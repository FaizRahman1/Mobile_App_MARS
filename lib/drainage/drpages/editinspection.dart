import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:geolocator/geolocator.dart';
import 'package:shared_preferences/shared_preferences.dart';

// UPDATE THESE IMPORTS TO MATCH YOUR PROJECT PATHS
import 'package:bridgeinsp_new/drainage/Drmodels/drpost_model.dart';
import 'package:bridgeinsp_new/drainage/drmodels/drainageidlist_model.dart';
import 'package:bridgeinsp_new/drainage/drpages/drainageform_tab.dart';

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
  String caption;

  InspectionPhoto({
    required this.file,
    required this.latitude,
    required this.longitude,
    required this.accuracy,
    required this.capturedAt,
    this.caption = '',
  });

  Map<String, dynamic> toJson() => {
    'fileName': file.name,
    'filePath': file.path,
    'latitude': latitude,
    'longitude': longitude,
    'accuracy': accuracy,
    'capturedAt': capturedAt.toIso8601String(),
    'caption': caption,
  };
}

class EditInspectionPage extends StatefulWidget {
  final DRPostModel model;

  const EditInspectionPage({super.key, required this.model});

  @override
  State<EditInspectionPage> createState() => _EditInspectionPageState();
}

class _EditInspectionPageState extends State<EditInspectionPage> {
  late final DrainageFormTab drainageForm = DrainageFormTab();

  int _currentStep = 0;

  final ImagePicker _picker = ImagePicker();
  final List<String> _existingBase64Images = [];
  final List<String> _existingCaptions = [];
  final List<Map<String, dynamic>> _existingPhotoMetadata = [];
  final List<InspectionPhoto> _newPhotos = [];
  bool _isGettingLocation = false;

  @override
  void initState() {
    super.initState();

    if (widget.model.images != null) {
      _existingBase64Images.addAll(widget.model.images!);
    }
    _existingCaptions.addAll(widget.model.imageCaptions ?? const <String>[]);
    while (_existingCaptions.length < _existingBase64Images.length) {
      _existingCaptions.add('');
    }

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _prefillFormFromModel(widget.model);
      _loadExistingPhotoMetadata();
    });
  }

  Future<void> _loadExistingPhotoMetadata() async {
    final id = widget.model.id;
    if (id == null || id.isEmpty) return;

    try {
      final stored = await SharedPref().read('drainage_photo_locations_$id');
      if (stored == null || stored.isEmpty) return;

      final decoded = jsonDecode(stored);
      if (decoded is! List || !mounted) return;

      setState(() {
        _existingPhotoMetadata
          ..clear()
          ..addAll(
            decoded.whereType<Map>().map(
              (item) => Map<String, dynamic>.from(item),
            ),
          );
      });
    } catch (_) {
      // Existing inspections may not have GPS metadata yet.
    }
  }

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

  void _setSelect(dynamic fieldBloc, String? value) {
    if (value == null) return;
    try {
      final items = (fieldBloc.items as List);
      if (items.contains(value)) {
        fieldBloc.updateValue(value);
      }
    } catch (_) {}
  }

  void _setText(dynamic fieldBloc, String? value) {
    if (value == null) return;
    try {
      fieldBloc.updateValue(value);
    } catch (_) {}
  }

  void _prefillFormFromModel(DRPostModel m) {
    final b = drainageForm.formBloc;

    _setSelect(b.cond_siltation_inlet, m.siltationdiameterinlet);
    _setSelect(b.cond_siltation_outlet, m.siltationdiameteroutlet);

    _setSelect(b.cond_vege_inlet, m.vegecoverinlet);
    _setSelect(b.cond_vege_outlet, m.vegecoveroutlet);

    _setSelect(b.cond_headwall_inlet, m.headwallstatusinlet);
    _setText(b.headwall_explanation_inlet, m.headwallexplainationinlet);
    _setSelect(b.cond_headwall_outlet, m.headwallstatusoutlet);
    _setText(b.headwall_explanation_outlet, m.headwallexplainationoutlet);

    _setSelect(b.cond_wingwall_inlet, m.wingwallstatusinlet);
    _setText(b.wingwall_explanation_inlet, m.wingwallexplanationinlet);
    _setSelect(b.cond_wingwall_outlet, m.wingwallstatusoutlet);
    _setText(b.wingwall_explanation_outlet, m.wingwallexplanationoutlet);

    _setSelect(b.cond_sump_inlet, m.sumpstatusinlet);
    _setText(b.sump_explanation_inlet, m.sumpexplanationinlet);
    _setSelect(b.cond_sump_outlet, m.sumpstatusoutlet);
    _setText(b.sump_explanation_outlet, m.sumpexplanationoutlet);

    _setSelect(b.cond_apron_inlet, m.apronstatusinlet);
    _setText(b.apron_explanation_inlet, m.apronexplanationinlet);
    _setSelect(b.cond_apron_outlet, m.apronstatusoutlet);
    _setText(b.apron_explanation_outlet, m.apronexplanationoutlet);

    _setSelect(b.cond_incdrain_inlet, m.incdrainstatusinlet);
    _setText(b.incdrain_explanation_inlet, m.incdrainexplanationinlet);
    _setSelect(b.cond_incdrain_outlet, m.incdrainstatusoutlet);
    _setText(b.incdrain_explanation_outlet, m.incdrainexplanationoutlet);

    _setText(b.routinedefect1, m.routinedefect1);
    _setText(b.otherdefect1, m.otherdefect1);
    _setText(b.routinedefect2, m.routinedefect2);
    _setText(b.otherdefect2, m.otherdefect2);
    _setText(b.routinedefect3, m.routinedefect3);
    _setText(b.otherdefect3, m.otherdefect3);
    _setText(b.routinedefect4, m.routinedefect4);
    _setText(b.otherdefect4, m.otherdefect4);
    _setText(b.routinedefect5, m.routinedefect5);
    _setText(b.otherdefect5, m.otherdefect5);

    setState(() {});
  }

  Future<void> _pickImage(ImageSource source) async {
    try {
      final XFile? picked = await _picker.pickImage(
        source: source,
        imageQuality: 80,
      );

      if (picked == null) return;

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
        _newPhotos.add(
          InspectionPhoto(
            file: picked,
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
      ).showSnackBar(SnackBar(content: Text("Pick image failed: $e")));
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
              const Text(
                "Add Photo",
                style: TextStyle(fontWeight: FontWeight.w700),
              ),
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
    setState(() {
      _existingBase64Images.removeAt(idx);
      _existingCaptions.removeAt(idx);
      if (idx < _existingPhotoMetadata.length) {
        _existingPhotoMetadata.removeAt(idx);
      }
    });
  }

  void _removeNewImage(int idx) {
    setState(() => _newPhotos.removeAt(idx));
  }

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

    final b = drainageForm.formBloc;

    final List<String> newBase64 = [];
    for (final photo in _newPhotos) {
      final bytes = await File(photo.file.path).readAsBytes();
      newBase64.add(base64Encode(bytes));
    }

    final allImages = <String>[..._existingBase64Images, ...newBase64];

    final updated = DRPostModel.fromFormValues(
      id: widget.model.id ?? "",
      assetInternalId: widget.model.assetInternalId,
      dateofinsp: widget.model.dateofinsp ?? DateTime.now(),
      inspectedby: widget.model.inspectedby ?? "MobileUser",
      maintainedby: widget.model.maintainedby ?? "PLUS",

      siltationdiameterinlet: _safeToString(b.cond_siltation_inlet.value),
      siltationdiameteroutlet: _safeToString(b.cond_siltation_outlet.value),

      vegecoverinlet: _safeToString(b.cond_vege_inlet.value),
      vegecoveroutlet: _safeToString(b.cond_vege_outlet.value),

      headwallstatusinlet: _safeToString(b.cond_headwall_inlet.value),
      headwallexplainationinlet: _safeToString(
        b.headwall_explanation_inlet.value,
      ),
      headwallstatusoutlet: _safeToString(b.cond_headwall_outlet.value),
      headwallexplainationoutlet: _safeToString(
        b.headwall_explanation_outlet.value,
      ),

      wingwallstatusinlet: _safeToString(b.cond_wingwall_inlet.value),
      wingwallexplanationinlet: _safeToString(
        b.wingwall_explanation_inlet.value,
      ),
      wingwallstatusoutlet: _safeToString(b.cond_wingwall_outlet.value),
      wingwallexplanationoutlet: _safeToString(
        b.wingwall_explanation_outlet.value,
      ),

      sumpstatusinlet: _safeToString(b.cond_sump_inlet.value),
      sumpexplanationinlet: _safeToString(b.sump_explanation_inlet.value),
      sumpstatusoutlet: _safeToString(b.cond_sump_outlet.value),
      sumpexplanationoutlet: _safeToString(b.sump_explanation_outlet.value),

      apronstatusinlet: _safeToString(b.cond_apron_inlet.value),
      apronexplanationinlet: _safeToString(b.apron_explanation_inlet.value),
      apronstatusoutlet: _safeToString(b.cond_apron_outlet.value),
      apronexplanationoutlet: _safeToString(b.apron_explanation_outlet.value),

      incdrainstatusinlet: _safeToString(b.cond_incdrain_inlet.value),
      incdrainexplanationinlet: _safeToString(
        b.incdrain_explanation_inlet.value,
      ),
      incdrainstatusoutlet: _safeToString(b.cond_incdrain_outlet.value),
      incdrainexplanationoutlet: _safeToString(
        b.incdrain_explanation_outlet.value,
      ),

      routinedefect1: _safeToString(b.routinedefect1.value),
      otherdefect1: _safeToString(b.otherdefect1.value),
      routinedefect2: _safeToString(b.routinedefect2.value),
      otherdefect2: _safeToString(b.otherdefect2.value),
      routinedefect3: _safeToString(b.routinedefect3.value),
      otherdefect3: _safeToString(b.otherdefect3.value),
      routinedefect4: _safeToString(b.routinedefect4.value),
      otherdefect4: _safeToString(b.otherdefect4.value),
      routinedefect5: _safeToString(b.routinedefect5.value),
      otherdefect5: _safeToString(b.otherdefect5.value),

      images: allImages.isEmpty ? null : allImages,
      images2: widget.model.images2,
      images3: widget.model.images3,
      images4: widget.model.images4,
      imageCaptions: [
        ..._existingCaptions.map((caption) => caption.trim()),
        ..._newPhotos.map((photo) => photo.caption.trim()),
      ],
    );

    final sharedPref = SharedPref();
    final existingInfo = await sharedPref.read("info");

    List<Rows> selectedList = [];
    List<DRPostModel> saved = [];

    if (existingInfo != null && existingInfo.isNotEmpty) {
      saved = DRPostModel.decode(existingInfo);
    }

    saved.removeWhere((x) => x.id == updated.id);
    saved.add(updated);

    await sharedPref.save("info", DRPostModel.encode(saved));

    final combinedPhotoMetadata = <Map<String, dynamic>>[
      ..._existingPhotoMetadata,
      ..._newPhotos.map((photo) => photo.toJson()),
    ];

    await sharedPref.save(
      'drainage_photo_locations_${updated.id}',
      jsonEncode(combinedPhotoMetadata),
    );

    final listString = await sharedPref.read("list");
    if (listString != null && listString.isNotEmpty) {
      selectedList = Rows.decode(listString);
    }

    if (!selectedList.any((r) => r.id == updated.id)) {
      selectedList.add(Rows(id: updated.id, dateofinsp: DateTime.now()));
      await sharedPref.save("list", Rows.encode(selectedList));
    }

    if (!mounted) return;
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text("Changes saved ✅")));

    Navigator.pop(context, true);
  }

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
          ),
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
                  icon: Icon(
                    _currentStep == steps.length - 1
                        ? Icons.save
                        : Icons.chevron_right,
                  ),
                  label: Text(
                    _currentStep == steps.length - 1 ? "Save" : "Next",
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
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
                            child: drainageForm,
                          ),
                        )
                      : _ImagesEditor(
                          existingBase64: _existingBase64Images,
                          existingCaptions: _existingCaptions,
                          existingMetadata: _existingPhotoMetadata,
                          newPhotos: _newPhotos,
                          isGettingLocation: _isGettingLocation,
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
  final List<String> existingCaptions;
  final List<Map<String, dynamic>> existingMetadata;
  final List<InspectionPhoto> newPhotos;
  final bool isGettingLocation;
  final VoidCallback onAdd;
  final void Function(int) onRemoveExisting;
  final void Function(int) onRemoveNew;

  const _ImagesEditor({
    required this.existingBase64,
    required this.existingCaptions,
    required this.existingMetadata,
    required this.newPhotos,
    required this.isGettingLocation,
    required this.onAdd,
    required this.onRemoveExisting,
    required this.onRemoveNew,
  });

  String _formatCoordinate(dynamic value) {
    if (value is num) return value.toDouble().toStringAsFixed(6);
    final parsed = double.tryParse(value?.toString() ?? '');
    return parsed == null ? 'Not available' : parsed.toStringAsFixed(6);
  }

  String _formatAccuracy(dynamic value) {
    if (value is num) return '${value.toDouble().toStringAsFixed(1)} m';
    final parsed = double.tryParse(value?.toString() ?? '');
    return parsed == null ? 'Not available' : '${parsed.toStringAsFixed(1)} m';
  }

  String _formatDateTime(dynamic value) {
    DateTime? dateTime;
    if (value is DateTime) {
      dateTime = value;
    } else if (value != null) {
      dateTime = DateTime.tryParse(value.toString());
    }

    if (dateTime == null) return 'Not available';

    final local = dateTime.toLocal();
    final day = local.day.toString().padLeft(2, '0');
    final month = local.month.toString().padLeft(2, '0');
    final year = local.year.toString();
    final hour = local.hour.toString().padLeft(2, '0');
    final minute = local.minute.toString().padLeft(2, '0');
    return '$day/$month/$year $hour:$minute';
  }

  Widget _photoCard({
    required BuildContext context,
    required Widget image,
    required int photoNumber,
    required VoidCallback onRemove,
    required dynamic latitude,
    required dynamic longitude,
    required dynamic accuracy,
    required dynamic capturedAt,
    required bool isExisting,
    required String caption,
    required ValueChanged<String> onCaptionChanged,
  }) {
    final hasCoordinate =
        _formatCoordinate(latitude) != 'Not available' &&
        _formatCoordinate(longitude) != 'Not available';

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
                image,
                Positioned(
                  top: 8,
                  right: 8,
                  child: Material(
                    color: Colors.black.withOpacity(0.60),
                    shape: const CircleBorder(),
                    child: IconButton(
                      tooltip: 'Remove photo',
                      onPressed: onRemove,
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
                      isExisting
                          ? 'Existing photo $photoNumber'
                          : 'New photo $photoNumber',
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
                  value: _formatCoordinate(latitude),
                ),
                const SizedBox(height: 8),
                _PhotoInfoRow(
                  icon: Icons.location_on_outlined,
                  label: 'Longitude',
                  value: _formatCoordinate(longitude),
                ),
                const SizedBox(height: 8),
                _PhotoInfoRow(
                  icon: Icons.gps_fixed,
                  label: 'GPS accuracy',
                  value: _formatAccuracy(accuracy),
                ),
                const SizedBox(height: 8),
                _PhotoInfoRow(
                  icon: Icons.schedule,
                  label: 'Captured at',
                  value: _formatDateTime(capturedAt),
                ),
                const SizedBox(height: 12),
                TextFormField(
                  initialValue: caption,
                  maxLength: 50,
                  decoration: const InputDecoration(
                    labelText: 'Photo description',
                    hintText: 'Describe this picture',
                    prefixIcon: Icon(Icons.notes_outlined),
                    border: OutlineInputBorder(),
                  ),
                  onChanged: onCaptionChanged,
                ),
                if (!hasCoordinate) ...[
                  const SizedBox(height: 10),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.errorContainer,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      isExisting
                          ? 'GPS metadata is not available for this existing photo.'
                          : 'GPS location was not available for this photo.',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onErrorContainer,
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
  }

  @override
  Widget build(BuildContext context) {
    final total = existingBase64.length + newPhotos.length;

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
              'Pictures ($total)',
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w800),
            ),
            const SizedBox(height: 10),
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
                  isGettingLocation ? 'Capturing GPS location...' : 'Add Photo',
                ),
              ),
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
                    Expanded(
                      child: Text(
                        'No photos added yet. GPS coordinates will be captured for new photos.',
                      ),
                    ),
                  ],
                ),
              )
            else
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: total,
                separatorBuilder: (_, __) => const SizedBox(height: 12),
                itemBuilder: (_, i) {
                  final isExisting = i < existingBase64.length;

                  if (isExisting) {
                    final metadata = i < existingMetadata.length
                        ? existingMetadata[i]
                        : <String, dynamic>{};

                    Widget image;
                    try {
                      image = Image.memory(
                        base64Decode(existingBase64[i]),
                        fit: BoxFit.cover,
                      );
                    } catch (_) {
                      image = const Center(
                        child: Icon(Icons.broken_image_outlined, size: 40),
                      );
                    }

                    return _photoCard(
                      context: context,
                      image: image,
                      photoNumber: i + 1,
                      onRemove: () => onRemoveExisting(i),
                      latitude: metadata['latitude'],
                      longitude: metadata['longitude'],
                      accuracy: metadata['accuracy'],
                      capturedAt: metadata['capturedAt'],
                      isExisting: true,
                      caption: existingCaptions[i],
                      onCaptionChanged: (value) => existingCaptions[i] = value,
                    );
                  }

                  final newIndex = i - existingBase64.length;
                  final photo = newPhotos[newIndex];

                  return _photoCard(
                    context: context,
                    image: Image.file(File(photo.file.path), fit: BoxFit.cover),
                    photoNumber: newIndex + 1,
                    onRemove: () => onRemoveNew(newIndex),
                    latitude: photo.latitude,
                    longitude: photo.longitude,
                    accuracy: photo.accuracy,
                    capturedAt: photo.capturedAt,
                    isExisting: false,
                    caption: photo.caption,
                    onCaptionChanged: (value) => photo.caption = value,
                  );
                },
              ),
          ],
        ),
      ),
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
