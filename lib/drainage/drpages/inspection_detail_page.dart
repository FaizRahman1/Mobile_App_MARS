import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:bridgeinsp_new/drainage/Drmodels/drpost_model.dart';

class InspectionDetailPage extends StatelessWidget {
  final DRPostModel inspection;

  const InspectionDetailPage({
    super.key,
    required this.inspection,
  });

  String _v(String? value) {
    final s = value?.toString().trim();
    if (s == null || s.isEmpty || s == 'null') return 'N/A';
    return s;
  }

  String _formatDate(DateTime? date) {
    if (date == null) return 'N/A';
    return '${date.day.toString().padLeft(2, '0')}/'
        '${date.month.toString().padLeft(2, '0')}/'
        '${date.year}';
  }

  Widget _kv(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 4,
            child: Text(
              label,
              style: const TextStyle(fontWeight: FontWeight.w600),
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

  Widget _section(String title, List<Widget> children) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: Colors.grey.shade300),
      ),
      child: ExpansionTile(
        tilePadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
        childrenPadding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        children: children,
      ),
    );
  }

  Uint8List? _tryDecodeBase64(String b64) {
    try {
      return base64Decode(b64);
    } catch (_) {
      return null;
    }
  }

  Widget _imagesSection() {
    final all = <String>[
      ...(inspection.images ?? const <String>[]),
      ...(inspection.images2 ?? const <String>[]),
      ...(inspection.images3 ?? const <String>[]),
      ...(inspection.images4 ?? const <String>[]),
    ];

    if (all.isEmpty) {
      return _section('Pictures', [
        const SizedBox(height: 6),
        const Text('No images saved.'),
      ]);
    }

    return _section('Pictures', [
      const SizedBox(height: 6),
      Wrap(
        spacing: 10,
        runSpacing: 10,
        children: all.map((b64) {
          final bytes = _tryDecodeBase64(b64);

          if (bytes == null) {
            return Container(
              width: 110,
              height: 110,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.grey.shade400),
              ),
              child: const Text(
                'Invalid\nimage',
                textAlign: TextAlign.center,
              ),
            );
          }

          return ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Container(
              width: 110,
              height: 110,
              color: Colors.grey.shade100,
              child: Image.memory(
                bytes,
                fit: BoxFit.cover,
              ),
            ),
          );
        }).toList(),
      ),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Review Drainage: ${inspection.id ?? '-'}'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(12),
        children: [
          Card(
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
              side: BorderSide(color: Colors.grey.shade300),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  _kv('Drainage ID', _v(inspection.id)),
                  _kv('Date of Inspection', _formatDate(inspection.dateofinsp)),
                  _kv('Inspected By', _v(inspection.inspectedby)),
                  _kv('Maintained By', _v(inspection.maintainedby)),
                ],
              ),
            ),
          ),

          const SizedBox(height: 10),

          _section('Weather Condition', [
            _kv('Weather Condition', _v(inspection.weathercondition)),
          ]),

          _section('Siltation / Debris', [
            _kv('Inlet', _v(inspection.siltationdiameterinlet)),
            _kv('Outlet', _v(inspection.siltationdiameteroutlet)),
          ]),

          _section('Vegetation near Culvert', [
            _kv('Inlet', _v(inspection.vegecoverinlet)),
            _kv('Outlet', _v(inspection.vegecoveroutlet)),
          ]),

          _section('Headwall', [
            _kv('Inlet Status', _v(inspection.headwallstatusinlet)),
            _kv('Inlet Remark', _v(inspection.headwallexplainationinlet)),
            const Divider(),
            _kv('Outlet Status', _v(inspection.headwallstatusoutlet)),
            _kv('Outlet Remark', _v(inspection.headwallexplainationoutlet)),
          ]),

          _section('Wingwall', [
            _kv('Inlet Status', _v(inspection.wingwallstatusinlet)),
            _kv('Inlet Remark', _v(inspection.wingwallexplanationinlet)),
            const Divider(),
            _kv('Outlet Status', _v(inspection.wingwallstatusoutlet)),
            _kv('Outlet Remark', _v(inspection.wingwallexplanationoutlet)),
          ]),

          _section('Sump', [
            _kv('Inlet Status', _v(inspection.sumpstatusinlet)),
            _kv('Inlet Remark', _v(inspection.sumpexplanationinlet)),
            const Divider(),
            _kv('Outlet Status', _v(inspection.sumpstatusoutlet)),
            _kv('Outlet Remark', _v(inspection.sumpexplanationoutlet)),
          ]),

          _section('Apron', [
            _kv('Inlet Status', _v(inspection.apronstatusinlet)),
            _kv('Inlet Remark', _v(inspection.apronexplanationinlet)),
            const Divider(),
            _kv('Outlet Status', _v(inspection.apronstatusoutlet)),
            _kv('Outlet Remark', _v(inspection.apronexplanationoutlet)),
          ]),

          _section('Incoming Drain', [
            _kv(
              'Inlet Status',
              _v(inspection.incdrainstatusinlet),
            ),
            _kv(
              'Inlet Remark',
              _v(inspection.incdrainexplanationinlet),
            ),
            const Divider(),
            _kv(
              'Outlet Status',
              _v(inspection.incdrainstatusoutlet),
            ),
            _kv(
              'Outlet Remark',
              _v(inspection.incdrainexplanationoutlet),
            ),
          ]),

          _section('Routine Defects', [
            _kv('Routine Defect 1', _v(inspection.routinedefect1)),
            _kv('Routine Defect 2', _v(inspection.routinedefect2)),
            _kv('Routine Defect 3', _v(inspection.routinedefect3)),
            _kv('Routine Defect 4', _v(inspection.routinedefect4)),
            _kv('Routine Defect 5', _v(inspection.routinedefect5)),
          ]),

          _section('Other Defects', [
            _kv('Other Defect 1', _v(inspection.otherdefect1)),
            _kv('Other Defect 2', _v(inspection.otherdefect2)),
            _kv('Other Defect 3', _v(inspection.otherdefect3)),
            _kv('Other Defect 4', _v(inspection.otherdefect4)),
            _kv('Other Defect 5', _v(inspection.otherdefect5)),
          ]),

          _imagesSection(),

          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
