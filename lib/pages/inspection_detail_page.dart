import 'package:flutter/material.dart';
import 'package:bridgeinsp_new/models/brpost_model.dart';

class InspectionDetailPage extends StatelessWidget {
  final BrPostModel inspection;

  const InspectionDetailPage({
    super.key,
    required this.inspection,
  });

  String _v(String? value) => value?.isNotEmpty == true ? value! : 'N/A';
  String _formatDate(DateTime? date) {
  if (date == null) return 'N/A';
  return '${date.day}/${date.month}/${date.year}';
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inspection ${inspection.id}'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _section('Surface Bridge - Blockage', [
            _row('Status', _v(inspection.surfacebridgeblockagestatus)),
            _row('Bound', _v(inspection.surfacebridgeblockagebound)),
            _row('Remarks', _v(inspection.surfacebridgeblockageremarks)),
          ]),

          _section('Surface Bridge - Ponding', [
            _row('Status', _v(inspection.surfacebridgepondingstatus)),
            _row('Bound', _v(inspection.surfacebridgepondingbound)),
            _row('Remarks', _v(inspection.surfacebridgepondingremarks)),
          ]),

          _section('Parapet - Impact', [
            _row('Status', _v(inspection.parapetimpactstatus)),
            _row('Bound', _v(inspection.parapetimpactbound)),
            _row('Remarks', _v(inspection.parapetimpactremarks)),
          ]),

          _section('Joint', [
            _row('Description', _v(inspection.jointdescription)),
            _row('Status', _v(inspection.jointstatus)),
            _row('Bound', _v(inspection.jointbound)),
            _row('Remarks', _v(inspection.jointremarks)),
          ]),

          const Divider(),

          _row('Date of Inspection', _formatDate(inspection.dateofinsp)),
          _row('Inspected By', _v(inspection.inspectedby)),
          _row('Maintained By', _v(inspection.maintainedby)),
        ],
      ),
    );
  }

  Widget _section(String title, List<Widget> children) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 16),
        Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        ...children,
      ],
    );
  }

  Widget _row(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Expanded(flex: 3, child: Text(label)),
          Expanded(flex: 5, child: Text(value)),
        ],
      ),
    );
  }
}
