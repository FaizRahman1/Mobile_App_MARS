import 'dart:convert';
import 'dart:io';

import 'package:bridgeinsp_new/bridge/brmodels/brpost_model.dart';
import 'package:bridgeinsp_new/bridge/brmodels/bridgeidlist_model.dart';
import 'package:bridgeinsp_new/bridge/brpages/recordedinspection_page.dart';
import 'package:bridgeinsp_new/bridge/brpages/superstructuresecondary_tab.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:bridgeinsp_new/bridge/brpages/module_selection_page.dart';


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

/// Edit page: Prefill the same inspection form and allow save.
class EditInspectionPage extends StatefulWidget {
  final BrPostModel model;

  const EditInspectionPage({super.key, required this.model});

  @override
  State<EditInspectionPage> createState() => _EditInspectionPageState();
}

class _EditInspectionPageState extends State<EditInspectionPage> {
  // Use your existing inspection form tab
  // IMPORTANT: your SuperstructureSecondaryTab must expose a persistent `formBloc`
  late final SuperstructureSecondaryTab structuresecondform =
      SuperstructureSecondaryTab();

  int _currentStep = 0;

  // Images: keep existing base64 + newly added files
  final ImagePicker _picker = ImagePicker();
  final List<String> _existingBase64Images = [];
  final List<XFile> _newImageFiles = [];

  @override
  void initState() {
    super.initState();

    // Load existing images from model (base64 list)
    if (widget.model.images != null) {
      _existingBase64Images.addAll(widget.model.images!);
    }

    // Prefill form after first frame (to ensure bloc exists)
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _prefillFormFromModel(widget.model);
    });
  }

  // -------------------- PREFILL HELPERS --------------------

  void _setSelect(dynamic fieldBloc, String? value) {
    // fieldBloc can be SelectFieldBloc from flutter_form_bloc
    if (value == null) return;
    try {
      // only set if the item exists (avoid crash)
      final items = (fieldBloc.items as List);
      if (items.contains(value)) {
        fieldBloc.updateValue(value);
      }
    } catch (_) {
      // ignore if unsupported
    }
  }

  void _setText(dynamic fieldBloc, String? value) {
    if (value == null) return;
    try {
      fieldBloc.updateValue(value);
    } catch (_) {
      // ignore if unsupported
    }
  }

  void _prefillFormFromModel(BrPostModel m) {
    final b = structuresecondform.formBloc;

    // Surface Bridge - Blockage
    _setSelect(b.cond_blockage_status, m.surfacebridgeblockagestatus);
    _setSelect(b.cond_surfacebridge_blockage_bound, m.surfacebridgeblockagebound);
    _setText(b.cond_surfacebridge_blockage_remarks, m.surfacebridgeblockageremarks);

    // Surface Bridge - Ponding
    _setSelect(b.cond_ponding_status, m.surfacebridgepondingstatus);
    _setSelect(b.cond_ponding_bound, m.surfacebridgepondingbound);
    _setText(b.cond_ponding_remarks, m.surfacebridgepondingremarks);

    // Surface Bridge - Others
    _setText(b.cond_surfacebridge_others, m.surfacebridgeothers);
    _setSelect(b.cond_surfacebridge_Status, m.surfacebridgeothersstatus);
    _setSelect(b.cond_others_bound, m.surfacebridgeothersbound);
    _setText(b.cond_others_remarks, m.surfacebridgeothersremarks);

    // Parapet - Impact
    _setSelect(b.cond_impact_status, m.parapetimpactstatus);
    _setSelect(b.cond_impact_bound, m.parapetimpactbound);
    _setText(b.cond_impact_remarks, m.parapetimpactremarks);

    // Parapet - Corrosion
    _setSelect(b.cond_corrosion_status, m.parapetcorrosionstatus);
    _setSelect(b.cond_corrosion_bound, m.parapetcorrosionbound);
    _setText(b.remarkscorrosion, m.parapetcorrosionremarks);

    // Parapet - Crack
    _setSelect(b.cond_crack_status, m.parapetcrackstatus);
    _setSelect(b.cond_crack_bound, m.parapetcrackbound);
    _setText(b.remarkscrack, m.parapetcrackremarks);

    // Parapet - Spall
    _setSelect(b.cond_spall_status, m.parapetspallstatus);
    _setSelect(b.cond_spall_bound, m.parapetspallbound);
    _setText(b.remarksspalling, m.parapetspallremarks);

    // Parapet - Others
    _setText(b.cond_parapet_others, m.parapetothers);
    _setSelect(b.cond_parapet_others_status, m.parapetothersstatus);
    _setSelect(b.cond_parapet_others_bound, m.parapetothersbound);
    _setText(b.cond_parapet_remarks, m.parapetothersremarks);

    // Joint
    _setSelect(b.joint_description, m.jointdescription);
    _setSelect(b.cond_joint_status, m.jointstatus);
    _setSelect(b.cond_joint_bound, m.jointbound);
    _setText(b.cond_joint_remarks, m.jointremarks);

    // Fixity
    _setSelect(b.cond_fixity_status, m.jointfixitystatus);
    _setSelect(b.cond_fixity_bound, m.jointfixitybound);
    _setText(b.remarksFixity, m.jointfixityremarks);

    // Leakage
    _setSelect(b.cond_leakage_status, m.jointleakagestatus);
    _setSelect(b.cond_leakage_bound, m.jointleakagebound);
    _setText(b.remarksWaterLeakage, m.jointleakageremarks);

    // Joint Others
    _setText(b.joint_others, m.jointothers);
    _setSelect(b.cond_joint_others_status, m.jointothersstatus);
    _setSelect(b.cond_joint_others_bound, m.jointothersbound);
    _setText(b.remarksjointOthers, m.jointothersremarks);

    // ✅ Add more mappings here if your UI has more sections you want prefilled.
    // The pattern is always: model.field -> formBloc.field.updateValue(...)
    setState(() {});
  }

  // -------------------- IMAGES --------------------

  Future<void> _pickImage(ImageSource source) async {
    try {
      final XFile? picked = await _picker.pickImage(source: source, imageQuality: 80);
      if (picked != null) setState(() => _newImageFiles.add(picked));
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Pick image failed: $e")),
      );
    }
  }

  Future<void> _showPickImageSheet() async {
    if (!mounted) return;
    await showModalBottomSheet(
      context: context,
      showDragHandle: true,
      builder: (_) => SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text("Add Photo", style: TextStyle(fontWeight: FontWeight.w700)),
              const SizedBox(height: 10),
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
      ),
    );
  }

  void _removeExistingImage(int idx) {
    setState(() => _existingBase64Images.removeAt(idx));
  }

  void _removeNewImage(int idx) {
    setState(() => _newImageFiles.removeAt(idx));
  }

  // -------------------- SAVE (UPDATE EXISTING) --------------------

  String? _safeToString(dynamic value) {
    if (value == null || value == 'null') return null;
    final s = value.toString().trim();
    return s.isEmpty ? null : s;
  }

  Future<void> _saveEdits() async {
    final confirm = await showDialog<bool>(
      context: context,
      builder: (_) => CupertinoAlertDialog(
        title: const Text("Save changes?"),
        content: const Text("This will overwrite the saved inspection."),
        actions: [
          CupertinoDialogAction(
            onPressed: () => Navigator.pop(context, false),
            child: const Text("Cancel"),
          ),
          CupertinoDialogAction(
            onPressed: () => Navigator.pop(context, true),
            child: const Text("Save"),
          ),
        ],
      ),
    );

    if (confirm != true || !mounted) return;

    final b = structuresecondform.formBloc;

    // Convert new images to base64
    final List<String> newBase64 = [];
    for (final x in _newImageFiles) {
      final bytes = await File(x.path).readAsBytes();
      newBase64.add(base64Encode(bytes));
    }

    // Merge existing + new
    final allImages = <String>[
      ..._existingBase64Images,
      ...newBase64,
    ];

    // Build updated model (keep id & metadata, overwrite fields)
    final updated = BrPostModel.fromFormValues(
      id: widget.model.id ?? "",
      dateofinsp: widget.model.dateofinsp ?? DateTime.now(),
      inspectedby: widget.model.inspectedby ?? "MobileUser",
      maintainedby: widget.model.maintainedby ?? "PLUS",

      // Surface Bridge - Blockage
      surfacebridgeblockagestatus: _safeToString(b.cond_blockage_status.value),
      surfacebridgeblockagebound:
          _safeToString(b.cond_surfacebridge_blockage_bound.value),
      surfacebridgeblockageremarks:
          _safeToString(b.cond_surfacebridge_blockage_remarks.value),

      // Surface Bridge - Ponding
      surfacebridgepondingstatus: _safeToString(b.cond_ponding_status.value),
      surfacebridgepondingbound: _safeToString(b.cond_ponding_bound.value),
      surfacebridgepondingremarks: _safeToString(b.cond_ponding_remarks.value),

      // Surface Bridge - Others
      surfacebridgeothers: _safeToString(b.cond_surfacebridge_others.value),
      surfacebridgeothersstatus: _safeToString(b.cond_surfacebridge_Status.value),
      surfacebridgeothersbound: _safeToString(b.cond_others_bound.value),
      surfacebridgeothersremarks: _safeToString(b.cond_others_remarks.value),

      // Parapet
      parapetimpactstatus: _safeToString(b.cond_impact_status.value),
      parapetimpactbound: _safeToString(b.cond_impact_bound.value),
      parapetimpactremarks: _safeToString(b.cond_impact_remarks.value),

      parapetcorrosionstatus: _safeToString(b.cond_corrosion_status.value),
      parapetcorrosionbound: _safeToString(b.cond_corrosion_bound.value),
      parapetcorrosionremarks: _safeToString(b.remarkscorrosion.value),

      parapetcrackstatus: _safeToString(b.cond_crack_status.value),
      parapetcrackbound: _safeToString(b.cond_crack_bound.value),
      parapetcrackremarks: _safeToString(b.remarkscrack.value),

      parapetspallstatus: _safeToString(b.cond_spall_status.value),
      parapetspallbound: _safeToString(b.cond_spall_bound.value),
      parapetspallremarks: _safeToString(b.remarksspalling.value),

      parapetothers: _safeToString(b.cond_parapet_others.value),
      parapetothersstatus: _safeToString(b.cond_parapet_others_status.value),
      parapetothersbound: _safeToString(b.cond_parapet_others_bound.value),
      parapetothersremarks: _safeToString(b.cond_parapet_remarks.value),

      // Joint
      jointdescription: _safeToString(b.joint_description.value),
      jointstatus: _safeToString(b.cond_joint_status.value),
      jointbound: _safeToString(b.cond_joint_bound.value),
      jointremarks: _safeToString(b.cond_joint_remarks.value),

      jointfixitystatus: _safeToString(b.cond_fixity_status.value),
      jointfixitybound: _safeToString(b.cond_fixity_bound.value),
      jointfixityremarks: _safeToString(b.remarksFixity.value),

      jointleakagestatus: _safeToString(b.cond_leakage_status.value),
      jointleakagebound: _safeToString(b.cond_leakage_bound.value),
      jointleakageremarks: _safeToString(b.remarksWaterLeakage.value),

      jointothers: _safeToString(b.joint_others.value),
      jointothersstatus: _safeToString(b.cond_joint_others_status.value),
      jointothersbound: _safeToString(b.cond_joint_others_bound.value),
      jointothersremarks: _safeToString(b.remarksjointOthers.value),

      // Images
      images: allImages.isEmpty ? null : allImages,
      images2: widget.model.images2,
      images3: widget.model.images3,
      images4: widget.model.images4,
    );

    // Save back to SharedPreferences ("info") by upsert
    final sharedPref = SharedPref();
    final existingInfo = await sharedPref.read("info");

    List<BrPostModel> saved = [];
    if (existingInfo != null && existingInfo.isNotEmpty) {
      saved = BrPostModel.decode(existingInfo);
    }

    saved.removeWhere((x) => x.id == updated.id);
    saved.add(updated);

    await sharedPref.save("info", BrPostModel.encode(saved));

    // Ensure this ID exists in "list" as inspected
    final listString = await sharedPref.read("list");
    List<Rows> selectedList = [];
    if (listString != null && listString.isNotEmpty) {
      selectedList = Rows.decode(listString);
    }
    if (!selectedList.any((r) => r.id == updated.id)) {
      selectedList.add(Rows(id: updated.id, dateofinsp: DateTime.now()));
      await sharedPref.save("list", Rows.encode(selectedList));
    }

    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Changes saved ✅")),
    );

    Navigator.pop(context, true);
  }

  // -------------------- UI --------------------

  List<_StepMeta> _steps() => const [
        _StepMeta("Inspection", Icons.fact_check_outlined),
        _StepMeta("Pictures", Icons.photo_library_outlined),
      ];

  @override
  Widget build(BuildContext context) {
    final steps = _steps();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Edit: ${widget.model.id ?? '-'}",
          overflow: TextOverflow.ellipsis,
        ),
        actions: [
          IconButton(
            tooltip: "Save",
            onPressed: _saveEdits,
            icon: const Icon(Icons.save_outlined),
          )
        ],
      ),
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
                  onPressed: _currentStep == 0
                      ? null
                      : () => setState(() => _currentStep--),
                  icon: const Icon(Icons.chevron_left),
                  label: const Text("Back"),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: FilledButton.icon(
                  onPressed: _currentStep == steps.length - 1
                      ? _saveEdits
                      : () => setState(() => _currentStep++),
                  icon: Icon(_currentStep == steps.length - 1
                      ? Icons.save
                      : Icons.chevron_right),
                  label: Text(_currentStep == steps.length - 1 ? "Save" : "Next"),
                ),
              ),
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            // step chips
            SizedBox(
              height: 48,
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                scrollDirection: Axis.horizontal,
                itemBuilder: (_, i) => ChoiceChip(
                  selected: i == _currentStep,
                  label: Text(steps[i].title),
                  avatar: Icon(steps[i].icon, size: 18),
                  onSelected: (_) => setState(() => _currentStep = i),
                ),
                separatorBuilder: (_, __) => const SizedBox(width: 8),
                itemCount: steps.length,
              ),
            ),
            const SizedBox(height: 10),

            Expanded(
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 200),
                child: SingleChildScrollView(
                  key: ValueKey(_currentStep),
                  padding: const EdgeInsets.fromLTRB(12, 0, 12, 12),
                  child: _currentStep == 0
                      ? Card(
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                            side: BorderSide(color: Colors.grey.shade300),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: structuresecondform,
                          ),
                        )
                      : _ImagesEditor(
                          existingBase64: _existingBase64Images,
                          newFiles: _newImageFiles,
                          onAdd: _showPickImageSheet,
                          onRemoveExisting: _removeExistingImage,
                          onRemoveNew: _removeNewImage,
                        ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _StepMeta {
  final String title;
  final IconData icon;
  const _StepMeta(this.title, this.icon);
}

class _ImagesEditor extends StatelessWidget {
  final List<String> existingBase64;
  final List<XFile> newFiles;
  final VoidCallback onAdd;
  final void Function(int) onRemoveExisting;
  final void Function(int) onRemoveNew;

  const _ImagesEditor({
    required this.existingBase64,
    required this.newFiles,
    required this.onAdd,
    required this.onRemoveExisting,
    required this.onRemoveNew,
  });

  @override
  Widget build(BuildContext context) {
    final total = existingBase64.length + newFiles.length;

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
            Text("Pictures ($total)",
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w800)),
            const SizedBox(height: 10),
            FilledButton.icon(
              onPressed: onAdd,
              icon: const Icon(Icons.add_a_photo_outlined),
              label: const Text("Add Photo"),
            ),
            const SizedBox(height: 12),

            if (total == 0)
              Container(
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(color: Colors.grey.shade300),
                ),
                child: const Row(
                  children: [
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
                itemCount: total,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                ),
                itemBuilder: (_, i) {
                  // first show existing base64, then new files
                  final isExisting = i < existingBase64.length;

                  Widget image;
                  VoidCallback onRemove;

                  if (isExisting) {
                    final bytes = base64Decode(existingBase64[i]);
                    image = Image.memory(bytes, fit: BoxFit.cover);
                    onRemove = () => onRemoveExisting(i);
                  } else {
                    final idx = i - existingBase64.length;
                    image = Image.file(File(newFiles[idx].path), fit: BoxFit.cover);
                    onRemove = () => onRemoveNew(idx);
                  }

                  return ClipRRect(
                    borderRadius: BorderRadius.circular(14),
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        image,
                        Positioned(
                          top: 6,
                          right: 6,
                          child: InkWell(
                            onTap: onRemove,
                            child: Container(
                              padding: const EdgeInsets.all(6),
                              decoration: BoxDecoration(
                                color: Colors.black.withOpacity(0.55),
                                borderRadius: BorderRadius.circular(999),
                              ),
                              child: const Icon(Icons.close,
                                  color: Colors.white, size: 16),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
          ],
        ),
      ),
    );
  }
}
