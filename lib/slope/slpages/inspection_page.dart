import 'dart:convert';
import 'dart:io';

import 'package:bridgeinsp_new/generaloutline.dart';
import 'package:bridgeinsp_new/slope/slmodels/slopepost_model.dart';
import 'package:bridgeinsp_new/slope/slmodels/slopeidlist_model.dart';
import 'package:bridgeinsp_new/slope/slmodels/sendmodel.dart';
import 'package:bridgeinsp_new/slope/slpages/furtherinvestigation_tab.dart';
import 'package:bridgeinsp_new/slope/slpages/inspectionsummary_tab.dart';
import 'package:bridgeinsp_new/slope/slpages/inventory.dart';
import 'package:bridgeinsp_new/slope/slpages/obsmaintenanceroutine_tab.dart';
import 'package:bridgeinsp_new/slope/slpages/recordedinspection_page.dart';
import 'package:bridgeinsp_new/slope/slpages/remedialwork_tab.dart';
import 'package:bridgeinsp_new/slope/slpages/substructure_tab.dart';
import 'package:bridgeinsp_new/slope/slpages/superstructuresecondary_tab.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:geolocator/geolocator.dart';
import 'package:shared_preferences/shared_preferences.dart';

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


class InspectionPhoto {
  final XFile file;
  final double? latitude;
  final double? longitude;
  final double? accuracy;
  final DateTime capturedAt;

  const InspectionPhoto({
    required this.file,
    required this.latitude,
    required this.longitude,
    required this.accuracy,
    required this.capturedAt,
  });

  Map<String, dynamic> toJson() => {
        'fileName': file.name,
        'filePath': file.path,
        'latitude': latitude,
        'longitude': longitude,
        'accuracy': accuracy,
        'capturedAt': capturedAt.toIso8601String(),
      };
}

class InspectionPage extends StatefulWidget {
  final String? row;
  final DateTime? date;

  const InspectionPage({super.key, required this.row, required this.date});

  @override
  State<InspectionPage> createState() => _InspectionPageState();
}

class _InspectionPageState extends State<InspectionPage> {
  late final StructureSecondaryForm slopeFormBloc = StructureSecondaryForm();

  late final SuperstructureSecondaryTab structuresecondform =
      SuperstructureSecondaryTab(formBloc: slopeFormBloc);

  late final SubstructureTab structuresubform = SubstructureTab();
  late final InspectionSummaryTab summaryform = InspectionSummaryTab();
  late final FurtherInvestigationTab furtherinvform = FurtherInvestigationTab();
  late final RemedialWorkTab remworkform = RemedialWorkTab();
  late final ObservationMaintenanceRoutineTab observationform =
      ObservationMaintenanceRoutineTab();

  int _currentStep = 0;

  final ImagePicker _picker = ImagePicker();
  final List<InspectionPhoto> _photos = <InspectionPhoto>[];
  bool _isGettingLocation = false;

  int get _stepCount => _steps().length;

  double get _progress =>
      _stepCount <= 1 ? 0.0 : (_currentStep / (_stepCount - 1));

  Future<Position?> _getCurrentPosition() async {
    final serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      if (!mounted) return null;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Location service is disabled. Please enable GPS and try again.',
          ),
        ),
      );
      return null;
    }

    LocationPermission permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }

    if (permission == LocationPermission.denied) {
      if (!mounted) return null;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Location permission was denied.')),
      );
      return null;
    }

    if (permission == LocationPermission.deniedForever) {
      if (!mounted) return null;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text(
            'Location permission is permanently denied. Enable it in app settings.',
          ),
          action: SnackBarAction(
            label: 'Settings',
            onPressed: Geolocator.openAppSettings,
          ),
        ),
      );
      return null;
    }

    return Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    ).timeout(const Duration(seconds: 15));
  }

  Future<void> _pickImage(ImageSource source) async {
    try {
      final XFile? pickedFile = await _picker.pickImage(
        source: source,
        imageQuality: 80,
      );

      if (pickedFile == null) return;

      if (mounted) {
        setState(() => _isGettingLocation = true);
      }

      Position? position;
      try {
        position = await _getCurrentPosition();
      } catch (e) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                'Photo added, but the GPS coordinate could not be captured: $e',
              ),
            ),
          );
        }
      }

      if (!mounted) return;

      setState(() {
        _photos.add(
          InspectionPhoto(
            file: pickedFile,
            latitude: position?.latitude,
            longitude: position?.longitude,
            accuracy: position?.accuracy,
            capturedAt: DateTime.now(),
          ),
        );
        _isGettingLocation = false;
      });
    } catch (e) {
      if (!mounted) return;
      setState(() => _isGettingLocation = false);
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Failed to add image: $e')));
    }
  }

  void _removeImage(int index) {
    setState(() => _photos.removeAt(index));
  }

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

  List<Widget> _stepBodies() => [
    _StepCard(
      title: "General Data",
      subtitle: "Basic slope information",
      child: Slopeinventory(row: widget.row),
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
        photos: _photos,
        isGettingLocation: _isGettingLocation,
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

    final formBloc = slopeFormBloc;

    List<String>? imageBase64List;
    if (_photos.isNotEmpty) {
      imageBase64List = [];
      for (final photo in _photos) {
        final bytes = await File(photo.file.path).readAsBytes();
        imageBase64List.add(base64Encode(bytes));
      }
    }

    final sendInfoDto = SendInfo(
      id: widget.row?.toString() ?? '',

      // General slope data
      diskfilmno: _safeToString(formBloc.diskfilmno.value),
      photono: _safeToString(formBloc.photono.value),
      interfacelocation: _safeToString(formBloc.interfacelocation.value),
      accessibility: _safeToString(formBloc.accessibility.value),
      accessibilitywhy: _safeToString(formBloc.accessibilitywhy.value),

      // Routine works checked
      vegetationControlForm: _safeToString(
        formBloc.vegetationControlForm.value,
      ),
      vegetationControlFormdesc: _safeToString(
        formBloc.vegetationControlFormdesc.value,
      ),

      drainCleaningForm: _safeToString(formBloc.drainCleaningForm.value),
      drainCleaningFormdesc: _safeToString(
        formBloc.drainCleaningFormdesc.value,
      ),

      gullyrepairform: _safeToString(formBloc.gullyrepairform.value),
      gullyrepairformdesc: _safeToString(formBloc.gullyrepairformdesc.value),

      concreterestorationform: _safeToString(
        formBloc.concreterestorationform.value,
      ),
      concreterestorationformdesc: _safeToString(
        formBloc.concreterestorationformdesc.value,
      ),

      precastconcretereplacementform: _safeToString(
        formBloc.precastconcretereplacementform.value,
      ),
      precastconcretereplacementformdesc: _safeToString(
        formBloc.precastconcretereplacementformdesc.value,
      ),

      earthdrainresectioningform: _safeToString(
        formBloc.earthdrainresectioningform.value,
      ),
      earthdrainresectioningformdesc: _safeToString(
        formBloc.earthdrainresectioningformdesc.value,
      ),

      otherroutinework: _safeToString(formBloc.otherroutinework.value),

      statusrm: _safeToString(formBloc.statusrm.value),

      // Inspection information
      dateofinsp: widget.date ?? DateTime.now(),
      inspectedby: 'MobileUser',
      maintainedby: 'PLUS',

      // Images
      images: imageBase64List,
    );

    try {
      final slPostModelToSave = SLPostModel.fromFormValues(
        id: sendInfoDto.id!,
        dateofinsp: sendInfoDto.dateofinsp,
        inspectedby: sendInfoDto.inspectedby,
        maintainedby: sendInfoDto.maintainedby,
        diskfilmno: sendInfoDto.diskfilmno,
        photono: sendInfoDto.photono,
        interfacelocation: sendInfoDto.interfacelocation,
        accessibility: sendInfoDto.accessibility,
        accessibilitywhy: sendInfoDto.accessibilitywhy,
        vegetationControlForm: sendInfoDto.vegetationControlForm,
        vegetationControlFormdesc: sendInfoDto.vegetationControlFormdesc,
        drainCleaningForm: sendInfoDto.drainCleaningForm,
        drainCleaningFormdesc: sendInfoDto.drainCleaningFormdesc,
        gullyrepairform: sendInfoDto.gullyrepairform,
        gullyrepairformdesc: sendInfoDto.gullyrepairformdesc,
        concreterestorationform: sendInfoDto.concreterestorationform,
        concreterestorationformdesc: sendInfoDto.concreterestorationformdesc,
        precastconcretereplacementform: sendInfoDto.precastconcretereplacementform,
        precastconcretereplacementformdesc: sendInfoDto.precastconcretereplacementformdesc,
        earthdrainresectioningform: sendInfoDto.earthdrainresectioningform,
        earthdrainresectioningformdesc: sendInfoDto.earthdrainresectioningformdesc,
        otherroutinework: sendInfoDto.otherroutinework,
        statusrm: sendInfoDto.statusrm,
        images: sendInfoDto.images,
        images2: sendInfoDto.images2,
        images3: sendInfoDto.images3,
        images4: sendInfoDto.images4,
      );

      final sharedPref = SharedPref();
      final existingInfo = await sharedPref.read("info");

      List<SLPostModel> savedInfo = [];
      if (existingInfo != null && existingInfo.isNotEmpty) {
        savedInfo = SLPostModel.decode(existingInfo);
      }

      savedInfo.removeWhere((x) => x.id == slPostModelToSave.id);
      savedInfo.add(slPostModelToSave);

      await sharedPref.save("info", SLPostModel.encode(savedInfo));

      // Save each photo's GPS metadata locally. To sync these values to the
      // server, add equivalent fields to the API model and database later.
      final photoMetadata = _photos.map((photo) => photo.toJson()).toList();
      await sharedPref.save(
        'slope_photo_locations_${widget.row}',
        jsonEncode(photoMetadata),
      );

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

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("Saved locally!")));

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
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Save failed: $e")));
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
  void dispose() {
    slopeFormBloc.close();
    super.dispose();
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
            Text(
              "Slope General Inspection",
              style: Theme.of(context).textTheme.labelLarge,
            ),
            Text(
              "Slope ID: ${widget.row ?? '-'}",
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
                  onPressed: _currentStep == _stepCount - 1
                      ? _saveInspection
                      : _next,
                  icon: Icon(
                    _currentStep == _stepCount - 1
                        ? Icons.save
                        : Icons.chevron_right,
                  ),
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
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 12, 16, 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${steps[_currentStep].title} (${_currentStep + 1}/$_stepCount)",
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 10),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(99),
                    child: LinearProgressIndicator(value: _progress),
                  ),
                ],
              ),
            ),
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
            Text(
              title,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w800),
            ),
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
  final List<InspectionPhoto> photos;
  final bool isGettingLocation;
  final VoidCallback onAdd;
  final void Function(int) onRemove;

  const _ImagePickerModern({
    required this.photos,
    required this.isGettingLocation,
    required this.onAdd,
    required this.onRemove,
  });

  String _formatCoordinate(double? value) {
    return value == null ? 'Not available' : value.toStringAsFixed(6);
  }

  String _formatAccuracy(double? value) {
    return value == null ? 'Not available' : '${value.toStringAsFixed(1)} m';
  }

  String _formatDateTime(DateTime value) {
    final local = value.toLocal();
    final day = local.day.toString().padLeft(2, '0');
    final month = local.month.toString().padLeft(2, '0');
    final year = local.year.toString();
    final hour = local.hour.toString().padLeft(2, '0');
    final minute = local.minute.toString().padLeft(2, '0');
    return '$day/$month/$year $hour:$minute';
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: double.infinity,
          child: FilledButton.icon(
            onPressed: isGettingLocation ? null : onAdd,
            icon: isGettingLocation
                ? const SizedBox(
                    width: 18,
                    height: 18,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  )
                : const Icon(Icons.add_a_photo_outlined),
            label: Text(
              isGettingLocation
                  ? 'Capturing GPS location...'
                  : 'Add Photo (${photos.length})',
            ),
          ),
        ),
        const SizedBox(height: 12),
        if (photos.isEmpty)
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
                Expanded(
                  child: Text(
                    'No photos added yet. GPS coordinates will be captured when a photo is added.',
                  ),
                ),
              ],
            ),
          )
        else
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: photos.length,
            separatorBuilder: (_, __) => const SizedBox(height: 12),
            itemBuilder: (_, index) {
              final photo = photos[index];
              final hasCoordinate =
                  photo.latitude != null && photo.longitude != null;

              return Card(
                margin: EdgeInsets.zero,
                elevation: 0,
                clipBehavior: Clip.antiAlias,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                  side: BorderSide(color: Colors.grey.shade300),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AspectRatio(
                      aspectRatio: 16 / 9,
                      child: Stack(
                        fit: StackFit.expand,
                        children: [
                          Image.file(
                            File(photo.file.path),
                            fit: BoxFit.cover,
                          ),
                          Positioned(
                            top: 8,
                            right: 8,
                            child: Material(
                              color: Colors.black.withOpacity(0.60),
                              shape: const CircleBorder(),
                              child: IconButton(
                                tooltip: 'Remove photo',
                                onPressed: () => onRemove(index),
                                icon: const Icon(
                                  Icons.close,
                                  color: Colors.white,
                                  size: 18,
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            left: 8,
                            bottom: 8,
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 6,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.black.withOpacity(0.60),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Text(
                                'Photo ${index + 1}',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        children: [
                          _PhotoInfoRow(
                            icon: Icons.my_location,
                            label: 'Latitude',
                            value: _formatCoordinate(photo.latitude),
                          ),
                          const SizedBox(height: 8),
                          _PhotoInfoRow(
                            icon: Icons.location_on_outlined,
                            label: 'Longitude',
                            value: _formatCoordinate(photo.longitude),
                          ),
                          const SizedBox(height: 8),
                          _PhotoInfoRow(
                            icon: Icons.gps_fixed,
                            label: 'GPS accuracy',
                            value: _formatAccuracy(photo.accuracy),
                          ),
                          const SizedBox(height: 8),
                          _PhotoInfoRow(
                            icon: Icons.schedule,
                            label: 'Captured at',
                            value: _formatDateTime(photo.capturedAt),
                          ),
                          if (!hasCoordinate) ...[
                            const SizedBox(height: 10),
                            Container(
                              width: double.infinity,
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: Theme.of(
                                  context,
                                ).colorScheme.errorContainer,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Text(
                                'GPS location was not available for this photo.',
                                style: TextStyle(
                                  color: Theme.of(
                                    context,
                                  ).colorScheme.onErrorContainer,
                                ),
                              ),
                            ),
                          ],
                        ],
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

class _PhotoInfoRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const _PhotoInfoRow({
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, size: 18),
        const SizedBox(width: 8),
        SizedBox(
          width: 105,
          child: Text(
            label,
            style: const TextStyle(fontWeight: FontWeight.w600),
          ),
        ),
        Expanded(child: Text(value)),
      ],
    );
  }
}

