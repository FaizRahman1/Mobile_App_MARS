import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:bridgeinsp_new/slope/slmodels/slopeidlist_model.dart';
import 'package:bridgeinsp_new/slope/slmodels/slopepost_model.dart';
import 'package:bridgeinsp_new/slope/slpages/slopeform_tab.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:bridgeinsp_new/slope/slpages/slopeform_tab.dart';

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

class EditInspectionPage extends StatefulWidget {
  final SLPostModel model;

  const EditInspectionPage({
    super.key,
    required this.model,
  });

  @override
  State<EditInspectionPage> createState() =>
      _EditInspectionPageState();
}

class _EditInspectionPageState extends State<EditInspectionPage> {
  late final SlopeFormTab slopeForm = SlopeFormTab();

  int _currentStep = 0;
  bool _isSaving = false;

  final ImagePicker _picker = ImagePicker();
  final List<String> _existingBase64Images = [];
  final List<XFile> _newImageFiles = [];

  @override
  void initState() {
    super.initState();

    _existingBase64Images.addAll([
      ...(widget.model.images ?? const <String>[]),
      ...(widget.model.images2 ?? const <String>[]),
      ...(widget.model.images3 ?? const <String>[]),
      ...(widget.model.images4 ?? const <String>[]),
    ]);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _prefillFormFromModel(widget.model);
    });
  }

  void _setSelect(dynamic fieldBloc, String? value) {
    if (value == null || value.trim().isEmpty) return;

    try {
      final items = fieldBloc.items as List;

      if (items.contains(value)) {
        fieldBloc.updateValue(value);
      }
    } catch (error) {
      debugPrint('Unable to prefill select field: $error');
    }
  }

  void _setText(dynamic fieldBloc, String? value) {
    if (value == null) return;

    try {
      fieldBloc.updateValue(value);
    } catch (error) {
      debugPrint('Unable to prefill text field: $error');
    }
  }

  void _prefillFormFromModel(SLPostModel model) {
    final bloc = slopeForm.formBloc;

    _setText(bloc.diskfilmno, model.diskfilmno);
    _setText(bloc.photono, model.photono);
    _setText(bloc.interfacelocation, model.interfacelocation);

    _setSelect(bloc.accessibility, model.accessibility);
    _setText(bloc.accessibilitywhy, model.accessibilitywhy);

    _setSelect(
      bloc.vegetationControlForm,
      model.vegetationControlForm,
    );
    _setText(
      bloc.vegetationControlFormdesc,
      model.vegetationControlFormdesc,
    );

    _setSelect(
      bloc.drainCleaningForm,
      model.drainCleaningForm,
    );
    _setText(
      bloc.drainCleaningFormdesc,
      model.drainCleaningFormdesc,
    );

    _setSelect(
      bloc.gullyrepairform,
      model.gullyrepairform,
    );
    _setText(
      bloc.gullyrepairformdesc,
      model.gullyrepairformdesc,
    );

    _setSelect(
      bloc.concreterestorationform,
      model.concreterestorationform,
    );
    _setText(
      bloc.concreterestorationformdesc,
      model.concreterestorationformdesc,
    );

    _setSelect(
      bloc.precastconcretereplacementform,
      model.precastconcretereplacementform,
    );
    _setText(
      bloc.precastconcretereplacementformdesc,
      model.precastconcretereplacementformdesc,
    );

    _setSelect(
      bloc.earthdrainresectioningform,
      model.earthdrainresectioningform,
    );
    _setText(
      bloc.earthdrainresectioningformdesc,
      model.earthdrainresectioningformdesc,
    );

    _setText(
      bloc.otherroutinework,
      model.otherroutinework,
    );
    _setSelect(
      bloc.statusrm,
      model.statusrm,
    );

    if (mounted) {
      setState(() {});
    }
  }

  Future<void> _pickImage(ImageSource source) async {
    try {
      final picked = await _picker.pickImage(
        source: source,
        imageQuality: 80,
      );

      if (picked != null && mounted) {
        setState(() {
          _newImageFiles.add(picked);
        });
      }
    } catch (error) {
      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Unable to add image: $error'),
        ),
      );
    }
  }

  Future<void> _showPickImageSheet() async {
    if (!mounted) return;

    await showModalBottomSheet<void>(
      context: context,
      showDragHandle: true,
      builder: (sheetContext) {
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Add General Inspection Image',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 10),
                ListTile(
                  leading: const Icon(Icons.photo_camera),
                  title: const Text('Take picture'),
                  onTap: () async {
                    Navigator.of(sheetContext).pop();
                    await _pickImage(ImageSource.camera);
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.photo_library),
                  title: const Text('Select from gallery'),
                  onTap: () async {
                    Navigator.of(sheetContext).pop();
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

  void _removeExistingImage(int index) {
    setState(() {
      _existingBase64Images.removeAt(index);
    });
  }

  void _removeNewImage(int index) {
    setState(() {
      _newImageFiles.removeAt(index);
    });
  }

  String? _safeToString(dynamic value) {
    if (value == null) return null;

    final text = value.toString().trim();

    if (text.isEmpty || text.toLowerCase() == 'null') {
      return null;
    }

    return text;
  }

  Future<void> _saveEdits() async {
    if (_isSaving) return;

    final confirm = await showDialog<bool>(
      context: context,
      builder: (dialogContext) {
        return CupertinoAlertDialog(
          title: const Text('Save changes?'),
          content: const Text(
            'This will overwrite the locally saved Slope inspection.',
          ),
          actions: [
            CupertinoDialogAction(
              onPressed: () {
                Navigator.of(dialogContext).pop(false);
              },
              child: const Text('Cancel'),
            ),
            CupertinoDialogAction(
              isDefaultAction: true,
              onPressed: () {
                Navigator.of(dialogContext).pop(true);
              },
              child: const Text('Save'),
            ),
          ],
        );
      },
    );

    if (confirm != true || !mounted) return;

    setState(() {
      _isSaving = true;
    });

    try {
      final bloc = slopeForm.formBloc;

      final newBase64Images = <String>[];

      for (final imageFile in _newImageFiles) {
        final bytes = await File(imageFile.path).readAsBytes();
        newBase64Images.add(base64Encode(bytes));
      }

      final allImages = <String>[
        ..._existingBase64Images,
        ...newBase64Images,
      ];

      final updated = SLPostModel.fromFormValues(
        id: widget.model.id,
        diskfilmno: _safeToString(bloc.diskfilmno.value),
        photono: _safeToString(bloc.photono.value),
        interfacelocation:
            _safeToString(bloc.interfacelocation.value),
        accessibility:
            _safeToString(bloc.accessibility.value),
        accessibilitywhy:
            _safeToString(bloc.accessibilitywhy.value),
        vegetationControlForm:
            _safeToString(bloc.vegetationControlForm.value),
        vegetationControlFormdesc:
            _safeToString(bloc.vegetationControlFormdesc.value),
        drainCleaningForm:
            _safeToString(bloc.drainCleaningForm.value),
        drainCleaningFormdesc:
            _safeToString(bloc.drainCleaningFormdesc.value),
        gullyrepairform:
            _safeToString(bloc.gullyrepairform.value),
        gullyrepairformdesc:
            _safeToString(bloc.gullyrepairformdesc.value),
        concreterestorationform:
            _safeToString(bloc.concreterestorationform.value),
        concreterestorationformdesc:
            _safeToString(bloc.concreterestorationformdesc.value),
        precastconcretereplacementform:
            _safeToString(
              bloc.precastconcretereplacementform.value,
            ),
        precastconcretereplacementformdesc:
            _safeToString(
              bloc.precastconcretereplacementformdesc.value,
            ),
        earthdrainresectioningform:
            _safeToString(
              bloc.earthdrainresectioningform.value,
            ),
        earthdrainresectioningformdesc:
            _safeToString(
              bloc.earthdrainresectioningformdesc.value,
            ),
        otherroutinework:
            _safeToString(bloc.otherroutinework.value),
        statusrm: _safeToString(bloc.statusrm.value),
        dateofinsp: widget.model.dateofinsp,
        inspectedby: widget.model.inspectedby,
        maintainedby: widget.model.maintainedby,
        images: allImages.isEmpty ? null : allImages,
        images2: null,
        images3: null,
        images4: null,
      );

      final sharedPref = SharedPref();
      final existingInfo = await sharedPref.read('info');

      var savedInspections = <SLPostModel>[];

      if (existingInfo != null && existingInfo.isNotEmpty) {
        try {
          savedInspections = SLPostModel.decode(existingInfo);
        } catch (error) {
          debugPrint(
            'Unable to decode saved Slope inspections: $error',
          );
        }
      }

      savedInspections.removeWhere(
        (inspection) => inspection.id == updated.id,
      );
      savedInspections.add(updated);

      await sharedPref.save(
        'info',
        SLPostModel.encode(savedInspections),
      );

      final listString = await sharedPref.read('list');
      var selectedList = <Rows>[];

      if (listString != null && listString.isNotEmpty) {
        try {
          selectedList = Rows.decode(listString);
        } catch (error) {
          debugPrint(
            'Unable to decode saved Slope list: $error',
          );
        }
      }

      if (!selectedList.any((row) => row.id == updated.id)) {
        selectedList.add(
          Rows(
            id: updated.id,
            dateofinsp: updated.dateofinsp,
          ),
        );

        await sharedPref.save(
          'list',
          Rows.encode(selectedList),
        );
      }

      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Slope inspection changes saved.'),
        ),
      );

      Navigator.of(context).pop(true);
    } catch (error, stackTrace) {
      debugPrint('Unable to save Slope inspection: $error');
      debugPrintStack(stackTrace: stackTrace);

      if (!mounted) return;

      setState(() {
        _isSaving = false;
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Unable to save the Slope inspection: $error',
          ),
        ),
      );
    }
  }

  List<_StepMeta> _steps() {
    return const [
      _StepMeta(
        'Slope Inspection',
        Icons.fact_check_outlined,
      ),
      _StepMeta(
        'General Inspection Images',
        Icons.photo_library_outlined,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final steps = _steps();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Edit Slope: ${widget.model.id}',
          overflow: TextOverflow.ellipsis,
        ),
        actions: [
          IconButton(
            tooltip: 'Save',
            onPressed: _isSaving ? null : _saveEdits,
            icon: _isSaving
                ? const SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                    ),
                  )
                : const Icon(Icons.save_outlined),
          ),
        ],
      ),
      bottomNavigationBar: SafeArea(
        child: Container(
          padding: const EdgeInsets.fromLTRB(12, 10, 12, 12),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            border: Border(
              top: BorderSide(
                color: Colors.grey.shade200,
              ),
            ),
          ),
          child: Row(
            children: [
              Expanded(
                child: OutlinedButton.icon(
                  onPressed: _currentStep == 0 || _isSaving
                      ? null
                      : () {
                          setState(() {
                            _currentStep--;
                          });
                        },
                  icon: const Icon(Icons.chevron_left),
                  label: const Text('Back'),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: FilledButton.icon(
                  onPressed: _isSaving
                      ? null
                      : _currentStep == steps.length - 1
                          ? _saveEdits
                          : () {
                              setState(() {
                                _currentStep++;
                              });
                            },
                  icon: Icon(
                    _currentStep == steps.length - 1
                        ? Icons.save
                        : Icons.chevron_right,
                  ),
                  label: Text(
                    _currentStep == steps.length - 1
                        ? 'Save'
                        : 'Next',
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
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                ),
                scrollDirection: Axis.horizontal,
                itemBuilder: (_, index) {
                  return ChoiceChip(
                    selected: index == _currentStep,
                    label: Text(steps[index].title),
                    avatar: Icon(
                      steps[index].icon,
                      size: 18,
                    ),
                    onSelected: _isSaving
                        ? null
                        : (_) {
                            setState(() {
                              _currentStep = index;
                            });
                          },
                  );
                },
                separatorBuilder: (_, __) {
                  return const SizedBox(width: 8);
                },
                itemCount: steps.length,
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 200),
                child: SingleChildScrollView(
                  key: ValueKey(_currentStep),
                  padding: const EdgeInsets.fromLTRB(
                    12,
                    0,
                    12,
                    12,
                  ),
                  child: _currentStep == 0
                      ? Card(
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(16),
                            side: BorderSide(
                              color: Colors.grey.shade300,
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(12),
                            child: slopeForm,
                          ),
                        )
                      : _ImagesEditor(
                          existingBase64:
                              _existingBase64Images,
                          newFiles: _newImageFiles,
                          onAdd: _showPickImageSheet,
                          onRemoveExisting:
                              _removeExistingImage,
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

  Uint8List? _decodeImage(String value) {
    try {
      var imageValue = value.trim();

      if (imageValue.startsWith('data:image')) {
        final commaIndex = imageValue.indexOf(',');

        if (commaIndex >= 0) {
          imageValue = imageValue.substring(commaIndex + 1);
        }
      }

      return base64Decode(imageValue);
    } catch (_) {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    final total = existingBase64.length + newFiles.length;

    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(
          color: Colors.grey.shade300,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(14, 14, 14, 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'General Inspection Images ($total)',
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w800,
              ),
            ),
            const SizedBox(height: 4),
            const Text(
              'Images retrieved from or added to the General '
              'Inspection record.',
            ),
            const SizedBox(height: 10),
            FilledButton.icon(
              onPressed: onAdd,
              icon: const Icon(Icons.add_a_photo_outlined),
              label: const Text('Add Image'),
            ),
            const SizedBox(height: 12),
            if (total == 0)
              Container(
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(
                    color: Colors.grey.shade300,
                  ),
                ),
                child: const Row(
                  children: [
                    Icon(Icons.image_outlined),
                    SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        'No General Inspection images added.',
                      ),
                    ),
                  ],
                ),
              )
            else
              GridView.builder(
                shrinkWrap: true,
                physics:
                    const NeverScrollableScrollPhysics(),
                itemCount: total,
                gridDelegate:
                    const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                ),
                itemBuilder: (_, index) {
                  final isExisting =
                      index < existingBase64.length;

                  Widget image;
                  VoidCallback removeImage;

                  if (isExisting) {
                    final bytes = _decodeImage(
                      existingBase64[index],
                    );

                    image = bytes == null
                        ? const ColoredBox(
                            color: Color(0xFFE0E0E0),
                            child: Center(
                              child: Text(
                                'Invalid image',
                                textAlign: TextAlign.center,
                              ),
                            ),
                          )
                        : Image.memory(
                            bytes,
                            fit: BoxFit.cover,
                          );

                    removeImage = () {
                      onRemoveExisting(index);
                    };
                  } else {
                    final newIndex =
                        index - existingBase64.length;

                    image = Image.file(
                      File(newFiles[newIndex].path),
                      fit: BoxFit.cover,
                    );

                    removeImage = () {
                      onRemoveNew(newIndex);
                    };
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
                            onTap: removeImage,
                            child: Container(
                              padding: const EdgeInsets.all(6),
                              decoration: BoxDecoration(
                                color: Colors.black.withValues(
                                  alpha: 0.55,
                                ),
                                borderRadius:
                                    BorderRadius.circular(999),
                              ),
                              child: const Icon(
                                Icons.close,
                                color: Colors.white,
                                size: 16,
                              ),
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
