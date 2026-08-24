import 'dart:convert';
import 'dart:typed_data';

import 'package:bridgeinsp_new/slope/slmodels/slopepost_model.dart';
import 'package:flutter/material.dart';

class InspectionDetailPage extends StatelessWidget {
  final SLPostModel inspection;

  const InspectionDetailPage({
    super.key,
    required this.inspection,
  });

  String _value(String? value) {
    final text = value?.trim();

    if (text == null ||
        text.isEmpty ||
        text.toLowerCase() == 'null') {
      return 'N/A';
    }

    return text;
  }

  String _formatDate(DateTime date) {
    return '${date.day.toString().padLeft(2, '0')}/'
        '${date.month.toString().padLeft(2, '0')}/'
        '${date.year}';
  }

  Widget _keyValue(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 4,
            child: Text(
              label,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            flex: 6,
            child: Text(value),
          ),
        ],
      ),
    );
  }

  Widget _section(
    String title,
    List<Widget> children, {
    bool initiallyExpanded = false,
  }) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(
          color: Colors.grey.shade300,
        ),
      ),
      child: ExpansionTile(
        initiallyExpanded: initiallyExpanded,
        tilePadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 6,
        ),
        childrenPadding: const EdgeInsets.fromLTRB(
          16,
          0,
          16,
          16,
        ),
        title: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        children: children,
      ),
    );
  }

  Uint8List? _tryDecodeBase64(String value) {
    try {
      var base64Value = value.trim();

      // Supports data URLs returned from the web system.
      if (base64Value.startsWith('data:image')) {
        final commaIndex = base64Value.indexOf(',');

        if (commaIndex >= 0) {
          base64Value = base64Value.substring(commaIndex + 1);
        }
      }

      return base64Decode(base64Value);
    } catch (_) {
      return null;
    }
  }

  List<String> _allImages() {
    return [
      ...(inspection.images ?? const <String>[]),
      ...(inspection.images2 ?? const <String>[]),
      ...(inspection.images3 ?? const <String>[]),
      ...(inspection.images4 ?? const <String>[]),
    ].where((image) => image.trim().isNotEmpty).toList();
  }

  Widget _generalInspectionImages(BuildContext context) {
    final images = _allImages();

    if (images.isEmpty) {
      return _section(
        'General Inspection Images',
        const [
          SizedBox(height: 6),
          Text(
            'No general inspection images were saved from the web system.',
          ),
        ],
      );
    }

    return _section(
      'General Inspection Images',
      [
        const Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Images captured or retrieved from the General Inspection '
            'record in the web system.',
          ),
        ),
        const SizedBox(height: 12),
        Wrap(
          spacing: 10,
          runSpacing: 10,
          children: List.generate(images.length, (index) {
            final imageValue = images[index];
            final bytes = _tryDecodeBase64(imageValue);

            if (bytes == null) {
              return Container(
                width: 115,
                height: 115,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: Colors.grey.shade400,
                  ),
                ),
                child: Text(
                  'Image ${index + 1}\nInvalid format',
                  textAlign: TextAlign.center,
                ),
              );
            }

            return InkWell(
              borderRadius: BorderRadius.circular(10),
              onTap: () {
                showDialog<void>(
                  context: context,
                  builder: (dialogContext) {
                    return Dialog(
                      child: Stack(
                        children: [
                          InteractiveViewer(
                            minScale: 0.5,
                            maxScale: 4,
                            child: Image.memory(
                              bytes,
                              fit: BoxFit.contain,
                            ),
                          ),
                          Positioned(
                            top: 4,
                            right: 4,
                            child: IconButton(
                              onPressed: () {
                                Navigator.of(dialogContext).pop();
                              },
                              icon: const Icon(Icons.close),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  width: 115,
                  height: 115,
                  color: Colors.grey.shade100,
                  child: Image.memory(
                    bytes,
                    fit: BoxFit.cover,
                    errorBuilder: (_, __, ___) {
                      return const Center(
                        child: Text(
                          'Unable to display image',
                          textAlign: TextAlign.center,
                        ),
                      );
                    },
                  ),
                ),
              ),
            );
          }),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Review Slope: ${_value(inspection.id)}',
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(12),
        children: [
          Card(
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
              side: BorderSide(
                color: Colors.grey.shade300,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  _keyValue(
                    'Slope ID',
                    _value(inspection.id),
                  ),
                  _keyValue(
                    'Date of Inspection',
                    _formatDate(inspection.dateofinsp),
                  ),
                  _keyValue(
                    'Inspected By',
                    _value(inspection.inspectedby),
                  ),
                  _keyValue(
                    'Maintained By',
                    _value(inspection.maintainedby),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 10),
          _section(
            'General Slope Data',
            [
              _keyValue(
                'Disk/Film No',
                _value(inspection.diskfilmno),
              ),
              _keyValue(
                'Photo No',
                _value(inspection.photono),
              ),
              _keyValue(
                'Interface Location',
                _value(inspection.interfacelocation),
              ),
              _keyValue(
                'Accessibility',
                _value(inspection.accessibility),
              ),
              _keyValue(
                'Accessibility Why',
                _value(inspection.accessibilitywhy),
              ),
            ],
            initiallyExpanded: true,
          ),
          _section(
            'Routine Works Checked',
            [
              _keyValue(
                'Vegetation Control Form',
                _value(inspection.vegetationControlForm),
              ),
              _keyValue(
                'Vegetation Control Form Description',
                _value(inspection.vegetationControlFormdesc),
              ),
              const Divider(),
              _keyValue(
                'Drain Cleaning Form',
                _value(inspection.drainCleaningForm),
              ),
              _keyValue(
                'Drain Cleaning Form Description',
                _value(inspection.drainCleaningFormdesc),
              ),
              const Divider(),
              _keyValue(
                'Gully Repair Form',
                _value(inspection.gullyrepairform),
              ),
              _keyValue(
                'Gully Repair Form Description',
                _value(inspection.gullyrepairformdesc),
              ),
              const Divider(),
              _keyValue(
                'Concrete Restoration Form',
                _value(inspection.concreterestorationform),
              ),
              _keyValue(
                'Concrete Restoration Form Description',
                _value(inspection.concreterestorationformdesc),
              ),
              const Divider(),
              _keyValue(
                'Precast Concrete Replacement Form',
                _value(
                  inspection.precastconcretereplacementform,
                ),
              ),
              _keyValue(
                'Precast Concrete Replacement Form Description',
                _value(
                  inspection.precastconcretereplacementformdesc,
                ),
              ),
              const Divider(),
              _keyValue(
                'Earth Drain Resectioning Form',
                _value(inspection.earthdrainresectioningform),
              ),
              _keyValue(
                'Earth Drain Resectioning Form Description',
                _value(
                  inspection.earthdrainresectioningformdesc,
                ),
              ),
              const Divider(),
              _keyValue(
                'Other Routine Work',
                _value(inspection.otherroutinework),
              ),
              _keyValue(
                'Status RM',
                _value(inspection.statusrm),
              ),
            ],
          ),
          _generalInspectionImages(context),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
