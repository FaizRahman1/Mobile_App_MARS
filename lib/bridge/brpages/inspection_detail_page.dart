import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:bridgeinsp_new/bridge/brmodels/brpost_model.dart';

class InspectionDetailPage extends StatelessWidget {
  final BrPostModel inspection;

  const InspectionDetailPage({super.key, required this.inspection});

  String _v(String? value) {
    final s = value?.toString().trim();
    if (s == null || s.isEmpty || s == 'null') return 'N/A';
    return s;
  }

  String _formatDate(DateTime date) {
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
          Expanded(flex: 6, child: Text(value)),
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
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
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
        children: all.indexed.map((entry) {
          final index = entry.$1;
          final b64 = entry.$2;
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
              child: const Text('Invalid\nimage', textAlign: TextAlign.center),
            );
          }

          final caption = index < (inspection.imageCaptions?.length ?? 0)
              ? inspection.imageCaptions![index]
              : '';
          return SizedBox(
            width: 140,
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: SizedBox(
                    width: 140,
                    height: 110,
                    child: Image.memory(bytes, fit: BoxFit.cover),
                  ),
                ),
                if (caption.trim().isNotEmpty) ...[
                  const SizedBox(height: 6),
                  Text(caption, textAlign: TextAlign.center),
                ],
              ],
            ),
          );
        }).toList(),
      ),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Review: ${inspection.id}')),
      body: ListView(
        padding: const EdgeInsets.all(12),
        children: [
          // ===== Meta summary (always visible) =====
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
                  _kv('Bridge ID', inspection.id),
                  _kv('Date of Inspection', _formatDate(inspection.dateofinsp)),
                  _kv('Inspected By', _v(inspection.inspectedby)),
                  _kv('Maintained By', _v(inspection.maintainedby)),
                ],
              ),
            ),
          ),

          const SizedBox(height: 10),

          // ===== Sections (Expandable) =====
          _section('Surface Bridge - Blockage', [
            _kv('Status', _v(inspection.surfacebridgeblockagestatus)),
            _kv('Bound', _v(inspection.surfacebridgeblockagebound)),
            _kv('Remarks', _v(inspection.surfacebridgeblockageremarks)),
          ]),

          _section('Surface Bridge - Ponding', [
            _kv('Status', _v(inspection.surfacebridgepondingstatus)),
            _kv('Bound', _v(inspection.surfacebridgepondingbound)),
            _kv('Remarks', _v(inspection.surfacebridgepondingremarks)),
          ]),

          _section('Surface Bridge - Others', [
            _kv('Others', _v(inspection.surfacebridgeothers)),
            _kv('Status', _v(inspection.surfacebridgeothersstatus)),
            _kv('Bound', _v(inspection.surfacebridgeothersbound)),
            _kv('Remarks', _v(inspection.surfacebridgeothersremarks)),
          ]),

          _section('Parapet - Impact', [
            _kv('Status', _v(inspection.parapetimpactstatus)),
            _kv('Bound', _v(inspection.parapetimpactbound)),
            _kv('Remarks', _v(inspection.parapetimpactremarks)),
          ]),

          _section('Parapet - Corrosion', [
            _kv('Status', _v(inspection.parapetcorrosionstatus)),
            _kv('Bound', _v(inspection.parapetcorrosionbound)),
            _kv('Remarks', _v(inspection.parapetcorrosionremarks)),
          ]),

          _section('Parapet - Crack / Spall / Others', [
            _kv('Crack Status', _v(inspection.parapetcrackstatus)),
            _kv('Crack Bound', _v(inspection.parapetcrackbound)),
            _kv('Crack Remarks', _v(inspection.parapetcrackremarks)),
            const Divider(),
            _kv('Spall Status', _v(inspection.parapetspallstatus)),
            _kv('Spall Bound', _v(inspection.parapetspallbound)),
            _kv('Spall Remarks', _v(inspection.parapetspallremarks)),
            const Divider(),
            _kv('Others', _v(inspection.parapetothers)),
            _kv('Others Status', _v(inspection.parapetothersstatus)),
            _kv('Others Bound', _v(inspection.parapetothersbound)),
            _kv('Others Remarks', _v(inspection.parapetothersremarks)),
          ]),

          _section('Joint', [
            _kv('Description', _v(inspection.jointdescription)),
            _kv('Status', _v(inspection.jointstatus)),
            _kv('Bound', _v(inspection.jointbound)),
            _kv('Remarks', _v(inspection.jointremarks)),
            const Divider(),
            _kv('Fixity Status', _v(inspection.jointfixitystatus)),
            _kv('Fixity Bound', _v(inspection.jointfixitybound)),
            _kv('Fixity Remarks', _v(inspection.jointfixityremarks)),
            const Divider(),
            _kv('Leakage Status', _v(inspection.jointleakagestatus)),
            _kv('Leakage Bound', _v(inspection.jointleakagebound)),
            _kv('Leakage Remarks', _v(inspection.jointleakageremarks)),
            const Divider(),
            _kv('Others', _v(inspection.jointothers)),
            _kv('Others Status', _v(inspection.jointothersstatus)),
            _kv('Others Bound', _v(inspection.jointothersbound)),
            _kv('Others Remarks', _v(inspection.jointothersremarks)),
          ]),

          _section('Abutment Approach', [
            _kv(
              'Pavement Status',
              _v(inspection.abutmentapproachpavementstatus),
            ),
            _kv('Pavement Bound', _v(inspection.abutmentapproachpavementbound)),
            _kv(
              'Pavement Remarks',
              _v(inspection.abutmentapproachpavementremarks),
            ),
            const Divider(),
            _kv('Others', _v(inspection.abutmentapproachothers)),
            _kv('Others Status', _v(inspection.abutmentapproachothersstatus)),
            _kv('Others Bound', _v(inspection.abutmentapproachothersbound)),
            _kv('Others Remarks', _v(inspection.abutmentapproachothersremarks)),
          ]),

          _section('Beam/Girder', [
            _kv('Corrosion Status', _v(inspection.beamcorrosionstatus)),
            _kv('Corrosion Bound', _v(inspection.beamcorrosionbound)),
            _kv('Corrosion Remarks', _v(inspection.beamcorrosionremarks)),
            const Divider(),
            _kv('Crack Status', _v(inspection.beamcrackstatus)),
            _kv('Crack Bound', _v(inspection.beamcrackbound)),
            _kv('Crack Remarks', _v(inspection.beamcrackremarks)),
            const Divider(),
            _kv('Spalling Status', _v(inspection.beamspallingstatus)),
            _kv('Spalling Bound', _v(inspection.beamspallingbound)),
            _kv('Spalling Remarks', _v(inspection.beamspallingremarks)),
            const Divider(),
            _kv('Others', _v(inspection.beamothers)),
            _kv('Others Status', _v(inspection.beamothersstatus)),
            _kv('Others Bound', _v(inspection.beamothersbound)),
            _kv('Others Remarks', _v(inspection.beamothersremarks)),
          ]),

          _section('Deck Soffit', [
            _kv('Crack Status', _v(inspection.decksoffitcrackstatus)),
            _kv('Crack Bound', _v(inspection.decksoffitcrackbound)),
            _kv('Crack Remarks', _v(inspection.decksoffitcrackremarks)),
            const Divider(),
            _kv('Spalling Status', _v(inspection.decksoffitspallstatus)),
            _kv('Spalling Bound', _v(inspection.decksoffitspallbound)),
            _kv('Spalling Remarks', _v(inspection.decksoffitspallremarks)),
            const Divider(),
            _kv('Others', _v(inspection.decksoffitothers)),
            _kv('Others Status', _v(inspection.decksoffitothersstatus)),
            _kv(
              'Others Bound',
              _v(inspection.conditiodecksoffitothersboundnPierCrack),
            ),
            _kv('Others Remarks', _v(inspection.decksoffitothersremarks)),
          ]),

          _section('Abutment / Wingwall', [
            _kv(
              'Movement Status',
              _v(inspection.abutmentwingwallmovementstatus),
            ),
            _kv('Movement Bound', _v(inspection.abutmentwingwallmovementbound)),
            _kv(
              'Movement Remarks',
              _v(inspection.abutmentwingwallmovementremarks),
            ),
            const Divider(),
            _kv('Crack Status', _v(inspection.abutmentwingwallcrackstatus)),
            _kv('Crack Bound', _v(inspection.abutmentwingwallcrackbound)),
            _kv('Crack Remarks', _v(inspection.abutmentwingwallcrackremarks)),
            const Divider(),
            _kv('Spalling Status', _v(inspection.abutmentwingwallspallstatus)),
            _kv('Spalling Bound', _v(inspection.abutmentwingwallspallbound)),
            _kv(
              'Spalling Remarks',
              _v(inspection.abutmentwingwallspallremarks),
            ),
            const Divider(),
            _kv('Others', _v(inspection.abutmentwingwallothers)),
            _kv('Others Status', _v(inspection.abutmentwingwallothersstatus)),
            _kv('Others Bound', _v(inspection.abutmentwingwallothersbound)),
            _kv('Others Remarks', _v(inspection.abutmentwingwallothersremarks)),
          ]),

          _section('Pier', [
            _kv('Movement Status', _v(inspection.piermovementstatus)),
            _kv('Movement Bound', _v(inspection.piermovementbound)),
            _kv('Movement Remarks', _v(inspection.piermovementremarks)),
            const Divider(),
            _kv('Scour Status', _v(inspection.pierscourstatus)),
            _kv('Scour Bound', _v(inspection.pierscourbound)),
            _kv('Scour Remarks', _v(inspection.pierscourremarks)),
            const Divider(),
            _kv('Debris Status', _v(inspection.pierdebrisstatus)),
            _kv('Debris Bound', _v(inspection.pierdebrisbound)),
            _kv('Debris Remarks', _v(inspection.pierdebrisremarks)),
            const Divider(),
            _kv('Crack Status', _v(inspection.piercrackstatus)),
            _kv('Crack Bound', _v(inspection.piercrackbound)),
            _kv('Crack Remarks', _v(inspection.piercrackremarks)),
            const Divider(),
            _kv('Spalling Status', _v(inspection.pierspallstatus)),
            _kv('Spalling Bound', _v(inspection.pierspallbound)),
            _kv('Spalling Remarks', _v(inspection.pierspallremarks)),
            const Divider(),
            _kv('Others', _v(inspection.pierothers)),
            _kv('Others Status', _v(inspection.pierothersstatus)),
            _kv('Others Bound', _v(inspection.pierothersbound)),
            _kv('Others Remarks', _v(inspection.pierothersremarks)),
          ]),

          _section('Slope Protection / Waterway', [
            _kv('Damage Status', _v(inspection.slopeprotectiondamagestatus)),
            _kv(
              'Damage Bound',
              _v(inspection.remarksBeaslopeprotectiondamageboundmcrack),
            ),
            _kv('Damage Remarks', _v(inspection.slopeprotectiondamageremarks)),
            const Divider(),
            _kv(
              'Scouring Status',
              _v(inspection.slopeprotectionscouringstatus),
            ),
            _kv('Scouring Bound', _v(inspection.slopeprotectionscouringbound)),
            _kv(
              'Scouring Remarks',
              _v(inspection.slopeprotectionscouringremarks),
            ),
            const Divider(),
            _kv('Erosion Status', _v(inspection.slopeprotectionerosionstatus)),
            _kv('Erosion Bound', _v(inspection.slopeprotectionerosionbound)),
            _kv(
              'Erosion Remarks',
              _v(inspection.slopeprotectionerosionremarks),
            ),
            const Divider(),
            _kv('Vegetation Status', _v(inspection.slopeprotectionvegestatus)),
            _kv('Vegetation Bound', _v(inspection.slopeprotectionvegebound)),
            _kv(
              'Vegetation Remarks',
              _v(inspection.slopeprotectionvegeremarks),
            ),
            const Divider(),
            _kv('Silt Status', _v(inspection.slopeprotectionsiltstatus)),
            _kv('Silt Bound', _v(inspection.slopeprotectionsiltbound)),
            _kv('Silt Remarks', _v(inspection.slopeprotectionsiltremarks)),
            const Divider(),
            _kv('Others', _v(inspection.slopeprotectionothers)),
            _kv('Others Status', _v(inspection.slopeprotectionothersstatus)),
            _kv('Others Bound', _v(inspection.slopeprotectionothersbound)),
            _kv('Others Remarks', _v(inspection.slopeprotectionothersremarks)),
          ]),

          _section('Bearing', [
            _kv('Deform Status', _v(inspection.bearingdeformstatus)),
            _kv('Deform Bound', _v(inspection.bearingdeformbound)),
            _kv('Deform Remarks', _v(inspection.bearingdeformremarks)),
            const Divider(),
            _kv('Debris Status', _v(inspection.bearingdebrisstatus)),
            _kv('Debris Bound', _v(inspection.bearingdebrisbound)),
            _kv('Debris Remarks', _v(inspection.bearingdebrisremarks)),
            const Divider(),
            _kv('Seating Status', _v(inspection.bearingseatingstatus)),
            _kv('Seating Bound', _v(inspection.bearingseatingbound)),
            _kv('Seating Remarks', _v(inspection.bearingseatingremarks)),
            const Divider(),
            _kv('Plinth Status', _v(inspection.bearingplinthstatus)),
            _kv('Plinth Bound', _v(inspection.bearingplinthbound)),
            _kv('Plinth Remarks', _v(inspection.bearingplinthremarks)),
            const Divider(),
            _kv('Others', _v(inspection.bearingothers)),
            _kv('Others Status', _v(inspection.bearingothersstatus)),
            _kv('Others Bound', _v(inspection.bearingothersbound)),
            _kv('Others Remarks', _v(inspection.bearingothersremarks)),
          ]),

          _section('Other Elements', [
            _kv('Element 1 Description', _v(inspection.otherselem1description)),
            _kv('Element 1 Status', _v(inspection.otherselem1status)),
            _kv('Element 1 Bound', _v(inspection.otherselem1bound)),
            _kv('Element 1 Remarks', _v(inspection.otherselem1remarks)),
            const Divider(),
            _kv('Element 2 Description', _v(inspection.otherselem2description)),
            _kv('Element 2 Status', _v(inspection.otherselem2status)),
            _kv('Element 2 Bound', _v(inspection.otherselem2bound)),
            _kv('Element 2 Remarks', _v(inspection.otherselem2remarks)),
          ]),

          _section('Defects Summary', [
            _kv('Routine Defect 1', _v(inspection.routinedefect1)),
            _kv('Other Defect 1', _v(inspection.otherdefect1)),
            const Divider(),
            _kv('Routine Defect 2', _v(inspection.routinedefect2)),
            _kv('Routine Defect 3', _v(inspection.routinedefect3)),
            _kv('Routine Defect 4', _v(inspection.routinedefect4)),
            const Divider(),
            _kv('Other Defect 2', _v(inspection.otherdefect2)),
            _kv('Other Defect 3', _v(inspection.otherdefect3)),
            _kv('Other Defect 4', _v(inspection.otherdefect4)),
          ]),

          _imagesSection(),

          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
