// File: lib/pages/inspection_page.dart
import 'dart:convert';
import 'dart:io';

import 'package:bridgeinsp_new/generaloutline.dart';
import 'package:bridgeinsp_new/models/brpost_model.dart';
import 'package:bridgeinsp_new/models/bridgeidlist_model.dart';
import 'package:bridgeinsp_new/models/sendmodel.dart';
import 'package:bridgeinsp_new/pages/furtherinvestigation_tab.dart';
import 'package:bridgeinsp_new/pages/inspectionsummary_tab.dart';
import 'package:bridgeinsp_new/pages/inventory.dart';
import 'package:bridgeinsp_new/pages/obsmaintenanceroutine_tab.dart';
import 'package:bridgeinsp_new/pages/recordedinspection_page.dart';
import 'package:bridgeinsp_new/pages/remedialwork_tab.dart';
import 'package:bridgeinsp_new/pages/substructure_tab.dart';
import 'package:bridgeinsp_new/pages/superstructuresecondary_tab.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:image_picker/image_picker.dart';

class SharedPref {
  Future<String?> read(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(key);
  }

  Future<void> save(String key, String value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, value);
  }
}

class InspectionPage extends StatefulWidget {
  final String? row;
  final DateTime? date;

  const InspectionPage({super.key, required this.row, required this.date});

  @override
  State<InspectionPage> createState() => _InspectionPageState();
}

class _InspectionPageState extends State<InspectionPage> {
  // Forms
  late final SuperstructureSecondaryTab structuresecondform =
      SuperstructureSecondaryTab();
  late final SubstructureTab structuresubform = SubstructureTab();
  late final InspectionSummaryTab summaryform = InspectionSummaryTab();
  late final FurtherInvestigationTab furtherinvform = FurtherInvestigationTab();
  late final RemedialWorkTab remworkform = RemedialWorkTab();
  late final ObservationMaintenanceRoutineTab observationform =
      ObservationMaintenanceRoutineTab();

  // Steps
  int _currentStep = 0;

  // Image picker
  final ImagePicker _picker = ImagePicker();
  final List<XFile> _imageFiles = <XFile>[];

  int get _stepCount => _steps().length;

  double get _progress =>
      _stepCount <= 1 ? 0.0 : (_currentStep / (_stepCount - 1));

  Future<void> _pickImage(ImageSource source) async {
    try {
      final XFile? pickedFile = await _picker.pickImage(
        source: source,
        imageQuality: 80, // helps performance
      );
      if (pickedFile != null) {
        setState(() => _imageFiles.add(pickedFile));
      }
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Failed to pick image: $e")),
      );
    }
  }

  void _removeImage(int index) => setState(() => _imageFiles.removeAt(index));

  Future<void> _showPickImageSheet() async {
    if (!mounted) return;
    await showModalBottomSheet(
      context: context,
      showDragHandle: true,
      builder: (_) {
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  "Add Photo",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                ),
                const SizedBox(height: 12),
                ListTile(
                  leading: const Icon(Icons.photo_camera),
                  title: const Text("Take picture"),
                  onTap: () async {
                    Navigator.pop(context);
                    await _pickImage(ImageSource.camera);
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.photo_library),
                  title: const Text("Select from gallery"),
                  onTap: () async {
                    Navigator.pop(context);
                    await _pickImage(ImageSource.gallery);
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  String? _safeToString(dynamic value) {
    if (value == null || value == 'null') return null;
    final s = value.toString().trim();
    if (s.isEmpty) return null;
    return s;
  }

  // --- Modern steps content (wrapped in cards) ---
  List<Widget> _stepBodies() => [
        _StepCard(
          title: "General Data",
          subtitle: "Basic bridge information",
          child: Bridgeinventory(row: widget.row),
        ),
        _StepCard(
          title: "Inspection Form",
          subtitle: "Record defects and conditions",
          child: structuresecondform,
        ),
        _StepCard(
          title: "Pictures",
          subtitle: "Add site photos (optional)",
          child: _ImagePickerModern(
            imageFiles: _imageFiles,
            onAdd: _showPickImageSheet,
            onRemove: _removeImage,
          ),
        ),
      ];

  List<_StepMeta> _steps() => const [
        _StepMeta("General", Icons.info_outline),
        _StepMeta("Inspection", Icons.fact_check_outlined),
        _StepMeta("Pictures", Icons.photo_library_outlined),
      ];

  Future<void> _saveInspection() async {
    final confirm = await showDialog<bool>(
      context: context,
      builder: (_) => CupertinoAlertDialog(
        title: const Text("Confirm"),
        content: const Text("Are you sure you want to save this inspection?"),
        actions: [
          CupertinoDialogAction(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text("Cancel"),
          ),
          CupertinoDialogAction(
            onPressed: () => Navigator.of(context).pop(true),
            child: const Text("Save"),
          ),
        ],
      ),
    );

    if (confirm != true || !mounted) return;

    // ✅ IMPORTANT: read from the persistent bloc instance used by UI
    final formBloc = structuresecondform.formBloc;

    // Convert images to base64 list
    List<String>? imageBase64List;
    if (_imageFiles.isNotEmpty) {
      imageBase64List = [];
      for (final file in _imageFiles) {
        final bytes = await File(file.path).readAsBytes();
        imageBase64List.add(base64Encode(bytes));
      }
    }

    final sendInfoDto = SendInfo(
      id: widget.row.toString(),

      surfacebridgeblockagestatus:
          _safeToString(formBloc.cond_blockage_status.value),
      surfacebridgeblockagebound:
          _safeToString(formBloc.cond_surfacebridge_blockage_bound.value),
      surfacebridgeblockageremarks:
          _safeToString(formBloc.cond_surfacebridge_blockage_remarks.value),
      surfacebridgepondingstatus:
          _safeToString(formBloc.cond_ponding_status.value),
      surfacebridgepondingbound: _safeToString(formBloc.cond_ponding_bound.value),
      surfacebridgepondingremarks:
          _safeToString(formBloc.cond_ponding_remarks.value),
      surfacebridgeothers:
          _safeToString(formBloc.cond_surfacebridge_others.value),
      surfacebridgeothersstatus:
          _safeToString(formBloc.cond_surfacebridge_Status.value),
      surfacebridgeothersbound: _safeToString(formBloc.cond_others_bound.value),
      surfacebridgeothersremarks:
          _safeToString(formBloc.cond_others_remarks.value),

      parapetimpactstatus: _safeToString(formBloc.cond_impact_status.value),
      parapetimpactbound: _safeToString(formBloc.cond_impact_bound.value),
      parapetimpactremarks: _safeToString(formBloc.cond_impact_remarks.value),
      parapetcorrosionstatus: _safeToString(formBloc.cond_corrosion_status.value),
      parapetcorrosionbound: _safeToString(formBloc.cond_corrosion_bound.value),
      parapetcorrosionremarks: _safeToString(formBloc.remarkscorrosion.value),
      parapetcrackstatus: _safeToString(formBloc.cond_crack_status.value),
      parapetcrackbound: _safeToString(formBloc.cond_crack_bound.value),
      parapetcrackremarks: _safeToString(formBloc.remarkscrack.value),
      parapetspallstatus: _safeToString(formBloc.cond_spall_status.value),
      parapetspallbound: _safeToString(formBloc.cond_spall_bound.value),
      parapetspallremarks: _safeToString(formBloc.remarksspalling.value),
      parapetothers: _safeToString(formBloc.cond_parapet_others.value),
      parapetothersstatus:
          _safeToString(formBloc.cond_parapet_others_status.value),
      parapetothersbound: _safeToString(formBloc.cond_parapet_others_bound.value),
      parapetothersremarks: _safeToString(formBloc.cond_parapet_remarks.value),

      jointdescription: _safeToString(formBloc.joint_description.value),
      jointstatus: _safeToString(formBloc.cond_joint_status.value),
      jointbound: _safeToString(formBloc.cond_joint_bound.value),
      jointremarks: _safeToString(formBloc.cond_joint_remarks.value),
      jointfixitystatus: _safeToString(formBloc.cond_fixity_status.value),
      jointfixitybound: _safeToString(formBloc.cond_fixity_bound.value),
      jointfixityremarks: _safeToString(formBloc.remarksFixity.value),
      jointleakagestatus: _safeToString(formBloc.cond_leakage_status.value),
      jointleakagebound: _safeToString(formBloc.cond_leakage_bound.value),
      jointleakageremarks: _safeToString(formBloc.remarksWaterLeakage.value),
      jointothers: _safeToString(formBloc.joint_others.value),
      jointothersstatus: _safeToString(formBloc.cond_joint_others_status.value),
      jointothersbound: _safeToString(formBloc.cond_joint_others_bound.value),
      jointothersremarks: _safeToString(formBloc.remarksjointOthers.value),

      // Keep remaining fields as you already mapped (unchanged in your project)
      // ...
      dateofinspection: DateTime.now(),
      inspectedby: 'MobileUser',
      maintainedby: 'PLUS',
      dateoflastinspection: '',
      images: imageBase64List,
    );

    try {
      final brPostModelToSave = BrPostModel.fromFormValues(
        id: sendInfoDto.id!,
        dateofinsp: sendInfoDto.dateofinspection,
        inspectedby: sendInfoDto.inspectedby,
        maintainedby: sendInfoDto.maintainedby,

        surfacebridgeblockagestatus: sendInfoDto.surfacebridgeblockagestatus,
        surfacebridgeblockagebound: sendInfoDto.surfacebridgeblockagebound,
        surfacebridgeblockageremarks: sendInfoDto.surfacebridgeblockageremarks,
        surfacebridgepondingstatus: sendInfoDto.surfacebridgepondingstatus,
        surfacebridgepondingbound: sendInfoDto.surfacebridgepondingbound,
        surfacebridgepondingremarks: sendInfoDto.surfacebridgepondingremarks,
        surfacebridgeothers: sendInfoDto.surfacebridgeothers,
        surfacebridgeothersstatus: sendInfoDto.surfacebridgeothersstatus,
        surfacebridgeothersbound: sendInfoDto.surfacebridgeothersbound,
        surfacebridgeothersremarks: sendInfoDto.surfacebridgeothersremarks,

        parapetimpactstatus: sendInfoDto.parapetimpactstatus,
        parapetimpactbound: sendInfoDto.parapetimpactbound,
        parapetimpactremarks: sendInfoDto.parapetimpactremarks,
        parapetcorrosionstatus: sendInfoDto.parapetcorrosionstatus,
        parapetcorrosionbound: sendInfoDto.parapetcorrosionbound,
        parapetcorrosionremarks: sendInfoDto.parapetcorrosionremarks,
        parapetcrackstatus: sendInfoDto.parapetcrackstatus,
        parapetcrackbound: sendInfoDto.parapetcrackbound,
        parapetcrackremarks: sendInfoDto.parapetcrackremarks,
        parapetspallstatus: sendInfoDto.parapetspallstatus,
        parapetspallbound: sendInfoDto.parapetspallbound,
        parapetspallremarks: sendInfoDto.parapetspallremarks,
        parapetothers: sendInfoDto.parapetothers,
        parapetothersstatus: sendInfoDto.parapetothersstatus,
        parapetothersbound: sendInfoDto.parapetothersbound,
        parapetothersremarks: sendInfoDto.parapetothersremarks,

        jointdescription: sendInfoDto.jointdescription,
        jointstatus: sendInfoDto.jointstatus,
        jointbound: sendInfoDto.jointbound,
        jointremarks: sendInfoDto.jointremarks,
        jointfixitystatus: sendInfoDto.jointfixitystatus,
        jointfixitybound: sendInfoDto.jointfixitybound,
        jointfixityremarks: sendInfoDto.jointfixityremarks,
        jointleakagestatus: sendInfoDto.jointleakagestatus,
        jointleakagebound: sendInfoDto.jointleakagebound,
        jointleakageremarks: sendInfoDto.jointleakageremarks,
        jointothers: sendInfoDto.jointothers,
        jointothersstatus: sendInfoDto.jointothersstatus,
        jointothersbound: sendInfoDto.jointothersbound,
        jointothersremarks: sendInfoDto.jointothersremarks,

        // keep the rest of your mappings unchanged in your project
        images: sendInfoDto.images,
        images2: sendInfoDto.images2,
        images3: sendInfoDto.images3,
        images4: sendInfoDto.images4,
      );

      final sharedPref = SharedPref();
      final existingInfo = await sharedPref.read("info");

      List<BrPostModel> savedInfo = [];
      if (existingInfo != null && existingInfo.isNotEmpty) {
        savedInfo = BrPostModel.decode(existingInfo);
      }

      savedInfo.removeWhere((x) => x.id == brPostModelToSave.id);
      savedInfo.add(brPostModelToSave);

      await sharedPref.save("info", BrPostModel.encode(savedInfo));

      // keep list logic
      try {
        final jsonString = await sharedPref.read("list");
        List<Rows> selectedList = [];

        if (jsonString != null && jsonString.isNotEmpty) {
          selectedList = Rows.decode(jsonString);
        }

        if (!selectedList.any((row) => row.id == widget.row)) {
          selectedList.add(Rows(id: widget.row, dateofinsp: DateTime.now()));
          await sharedPref.save("list", Rows.encode(selectedList));
        }
      } catch (_) {
        final newList = [Rows(id: widget.row, dateofinsp: DateTime.now())];
        await sharedPref.save("list", Rows.encode(newList));
      }

      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Saved locally!")),
      );

      final goToRecorded = await showDialog<bool>(
        context: context,
        builder: (_) => CupertinoAlertDialog(
          title: const Text("Success"),
          content: const Text("Go to saved inspections?"),
          actions: [
            CupertinoDialogAction(
              onPressed: () => Navigator.of(context).pop(false),
              child: const Text("No"),
            ),
            CupertinoDialogAction(
              onPressed: () => Navigator.of(context).pop(true),
              child: const Text("Yes"),
            ),
          ],
        ),
      );

      if (goToRecorded == true && mounted) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const RecordedInspection()),
        );
      }
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Save failed: $e")),
      );
    }
  }

  void _next() {
    setState(() {
      if (_currentStep < _stepCount - 1) _currentStep++;
    });
  }

  void _back() {
    setState(() {
      if (_currentStep > 0) _currentStep--;
    });
  }

  @override
  Widget build(BuildContext context) {
    final steps = _steps();
    final bodies = _stepBodies();

    return Scaffold(
      drawer: const NavBar(),
      appBar: AppBar(
        title: Column(
          children: [
            const Text("Bridge General Inspection"),
            Text(
              "Bridge ID: ${widget.row ?? '-'}",
              style: Theme.of(context).textTheme.labelLarge,
            ),
          ],
        ),
        centerTitle: true,
        actions: [
          IconButton(
            tooltip: "Save",
            onPressed: _saveInspection,
            icon: const Icon(Icons.save_outlined),
          ),
          const SizedBox(width: 6),
        ],
      ),

      // ✅ Sticky modern bottom bar
      bottomNavigationBar: SafeArea(
        child: Container(
          padding: const EdgeInsets.fromLTRB(12, 10, 12, 12),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            border: Border(top: BorderSide(color: Colors.grey.shade200)),
          ),
          child: Row(
            children: [
              Expanded(
                child: OutlinedButton.icon(
                  onPressed: _currentStep == 0 ? null : _back,
                  icon: const Icon(Icons.chevron_left),
                  label: const Text("Back"),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: FilledButton.icon(
                  onPressed: _currentStep == _stepCount - 1 ? _saveInspection : _next,
                  icon: Icon(_currentStep == _stepCount - 1
                      ? Icons.save
                      : Icons.chevron_right),
                  label: Text(_currentStep == _stepCount - 1 ? "Save" : "Next"),
                ),
              ),
            ],
          ),
        ),
      ),

      body: SafeArea(
        child: Column(
          children: [
            // ✅ Modern progress header
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 12, 16, 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${steps[_currentStep].title} (${_currentStep + 1}/$_stepCount)",
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(height: 10),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(99),
                    child: LinearProgressIndicator(value: _progress),
                  ),
                ],
              ),
            ),

            // ✅ Step chips (cleaner than default Stepper)
            SizedBox(
              height: 48,
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                scrollDirection: Axis.horizontal,
                itemBuilder: (_, i) {
                  final active = i == _currentStep;
                  return ChoiceChip(
                    selected: active,
                    label: Text(steps[i].title),
                    avatar: Icon(steps[i].icon, size: 18),
                    onSelected: (_) => setState(() => _currentStep = i),
                  );
                },
                separatorBuilder: (_, __) => const SizedBox(width: 8),
                itemCount: steps.length,
              ),
            ),

            const SizedBox(height: 10),

            // ✅ Content area
            Expanded(
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 200),
                child: SingleChildScrollView(
                  key: ValueKey(_currentStep),
                  padding: const EdgeInsets.fromLTRB(12, 0, 12, 12),
                  child: bodies[_currentStep],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// -------------------- UI helpers --------------------

class _StepMeta {
  final String title;
  final IconData icon;
  const _StepMeta(this.title, this.icon);
}

class _StepCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final Widget child;

  const _StepCard({
    required this.title,
    required this.subtitle,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(color: Colors.grey.shade300),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(14, 14, 14, 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title,
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w800)),
            const SizedBox(height: 2),
            Text(subtitle, style: TextStyle(color: Colors.grey.shade700)),
            const SizedBox(height: 12),
            child,
          ],
        ),
      ),
    );
  }
}

class _ImagePickerModern extends StatelessWidget {
  final List<XFile> imageFiles;
  final VoidCallback onAdd;
  final void Function(int) onRemove;

  const _ImagePickerModern({
    required this.imageFiles,
    required this.onAdd,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: FilledButton.icon(
                onPressed: onAdd,
                icon: const Icon(Icons.add_a_photo_outlined),
                label: Text("Add Photo (${imageFiles.length})"),
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),

        if (imageFiles.isEmpty)
          Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              border: Border.all(color: Colors.grey.shade300),
            ),
            child: Row(
              children: const [
                Icon(Icons.image_outlined),
                SizedBox(width: 10),
                Expanded(child: Text("No photos added yet.")),
              ],
            ),
          )
        else
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: imageFiles.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
            ),
            itemBuilder: (_, index) {
              final file = imageFiles[index];
              return ClipRRect(
                borderRadius: BorderRadius.circular(14),
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Image.file(
                      File(file.path),
                      fit: BoxFit.cover,
                    ),
                    Positioned(
                      top: 6,
                      right: 6,
                      child: InkWell(
                        onTap: () => onRemove(index),
                        child: Container(
                          padding: const EdgeInsets.all(6),
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.55),
                            borderRadius: BorderRadius.circular(999),
                          ),
                          child: const Icon(Icons.close, color: Colors.white, size: 16),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
      ],
    );
  }
}
