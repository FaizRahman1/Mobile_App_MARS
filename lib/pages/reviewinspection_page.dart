// File: lib/pages/reviewinspection_page.dart
import 'package:flutter/material.dart';
import 'package:bridgeinsp_new/models/brpost_model.dart'; // Adjust import if path is different
import 'package:shared_preferences/shared_preferences.dart'; // For loading saved data
import 'dart:convert'; // For json.decode

// Assuming your brpostmodel has a static decode method like: static List<brpostmodel> decode(String jsonString)
// and encode like: static String encode(List<brpostmodel> list)
// If not, you'll need to adapt the loading/saving logic here based on how brpostmodel handles serialization.

class ReviewInspectionPage extends StatefulWidget {
  final String row; // The Bridge ID to review

  const ReviewInspectionPage({super.key, required this.row});

  @override
  State<ReviewInspectionPage> createState() => _ReviewInspectionPageState();
}

class _ReviewInspectionPageState extends State<ReviewInspectionPage> {
  brpostmodel? _inspectionData;
  bool _isLoading = true;
  String? _error;

  @override
  void initState() {
    super.initState();
    _loadInspectionData();
  }

  Future<void> _loadInspectionData() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final jsonString = prefs.getString('info'); // Key where full inspections are saved

      if (jsonString != null) {
        final List<brpostmodel> allInspections = brpostmodel.decode(jsonString);

        // Find the inspection matching the widget.row (Bridge ID)
        // This finds the *last* one if multiple exist for the same ID
        final matchingInspection = allInspections.lastWhere(
          (inspection) => inspection.id == widget.row,
          orElse: () => throw Exception("No inspection found for ID: ${widget.row}"),
        );

        setState(() {
          _inspectionData = matchingInspection;
          _isLoading = false;
        });
      } else {
        setState(() {
          _error = "No inspection data found.";
          _isLoading = false;
        });
      }
    } catch (e) {
      print("Error loading inspection for ${widget.row}: $e");
      setState(() {
        _error = "Failed to load inspection: $e";
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return Scaffold(
        appBar: AppBar(title: Text("Reviewing ${widget.row}")),
        body: const Center(child: CircularProgressIndicator()),
      );
    }

    if (_error != null) {
      return Scaffold(
        appBar: AppBar(title: Text("Reviewing ${widget.row}")),
        body: Center(child: Text(_error!)),
      );
    }

    if (_inspectionData == null) {
      // This case should ideally be handled by the 'orElse' in lastWhere,
      // but adding a check here for safety.
      return Scaffold(
        appBar: AppBar(title: Text("Reviewing ${widget.row}")),
        body: const Center(child: Text("No inspection data found for this ID.")),
      );
    }

    // If data is loaded successfully, delegate to the detail view widget
    return InspectionDetailPage(inspection: _inspectionData!);
  }
}

// --- IMPORTANT ---
// You need to make your InspectionDetailPage widget available for import.
// If InspectionDetailPage is defined in inspection_detail_page.dart,
// ensure that file exports it correctly or import it explicitly here if needed.
// For this example, I'll assume InspectionDetailPage is accessible via a common import
// or you move its definition to a shared location if needed specifically for Review.
// If you want to keep it separate, copy the InspectionDetailPage code here or create a shared widget file.

// Assuming InspectionDetailPage is available from another file or copied here
// import 'package:your_app/pages/inspection_detail_page.dart'; // Adjust path

// If you want to keep it in this file for simplicity based on the code you provided:
class InspectionDetailPage extends StatelessWidget {
  final brpostmodel inspection;

  const InspectionDetailPage({super.key, required this.inspection});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inspection Details: ${inspection.id ?? "N/A"}'),
        backgroundColor: Colors.deepPurple.shade200,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Basic Info
              _buildSectionTitle('Basic Information'),
              _buildDetailRow('Bridge ID', inspection.id),
              _buildDetailRow('Date of Inspection', inspection.dateofinsp?.toString()),
              _buildDetailRow('Inspected By', inspection.inspectedby),
              _buildDetailRow('Maintained By', inspection.maintainedby),
              const SizedBox(height: 20),

              // Surface Drainage
              _buildSectionTitle('Surface Drainage'),
              _buildDetailRow('Blockage Status', inspection.surfacebridgeblockagestatus),
              _buildDetailRow('Blockage Bound', inspection.surfacebridgeblockagebound),
              _buildDetailRow('Blockage Remarks', inspection.surfacebridgeblockageremarks),
              _buildDetailRow('Ponding Status', inspection.surfacebridgepondingstatus),
              _buildDetailRow('Ponding Bound', inspection.surfacebridgepondingbound),
              _buildDetailRow('Ponding Remarks', inspection.surfacebridgepondingremarks),
              _buildDetailRow('Others', inspection.surfacebridgeothers),
              _buildDetailRow('Others Status', inspection.surfacebridgeothersstatus),
              _buildDetailRow('Others Bound', inspection.surfacebridgeothersbound),
              _buildDetailRow('Others Remarks', inspection.surfacebridgeothersremarks),
              const SizedBox(height: 20),

              // Parapet
              _buildSectionTitle('Parapet'),
              _buildDetailRow('Impact Status', inspection.parapetimpactstatus),
              _buildDetailRow('Impact Bound', inspection.parapetimpactbound),
              _buildDetailRow('Impact Remarks', inspection.parapetimpactremarks),
              _buildDetailRow('Corrosion Status', inspection.parapetcorrosionstatus),
              _buildDetailRow('Corrosion Bound', inspection.parapetcorrosionbound),
              _buildDetailRow('Corrosion Remarks', inspection.parapetcorrosionremarks),
              _buildDetailRow('Crack Status', inspection.parapetcrackstatus),
              _buildDetailRow('Crack Bound', inspection.parapetcrackbound),
              _buildDetailRow('Crack Remarks', inspection.parapetcrackremarks),
              _buildDetailRow('Spalling Status', inspection.parapetspallstatus),
              _buildDetailRow('Spalling Bound', inspection.parapetspallbound),
              _buildDetailRow('Spalling Remarks', inspection.parapetspallremarks),
              _buildDetailRow('Others', inspection.parapetothers),
              _buildDetailRow('Others Status', inspection.parapetothersstatus),
              _buildDetailRow('Others Bound', inspection.parapetothersbound),
              _buildDetailRow('Others Remarks', inspection.parapetothersremarks),
              const SizedBox(height: 20),

              // Joint
              _buildSectionTitle('Joint'),
              _buildDetailRow('Description', inspection.jointdescription),
              _buildDetailRow('Status', inspection.jointstatus),
              _buildDetailRow('Bound', inspection.jointbound),
              _buildDetailRow('Remarks', inspection.jointremarks),
              _buildDetailRow('Fixity Status', inspection.jointfixitystatus),
              _buildDetailRow('Fixity Bound', inspection.jointfixitybound),
              _buildDetailRow('Fixity Remarks', inspection.jointfixityremarks),
              _buildDetailRow('Leakage Status', inspection.jointleakagestatus),
              _buildDetailRow('Leakage Bound', inspection.jointleakagebound),
              _buildDetailRow('Leakage Remarks', inspection.jointleakageremarks),
              _buildDetailRow('Others', inspection.jointothers),
              _buildDetailRow('Others Status', inspection.jointothersstatus),
              _buildDetailRow('Others Bound', inspection.jointothersbound),
              _buildDetailRow('Others Remarks', inspection.jointothersremarks),
              const SizedBox(height: 20),

              // Abutment Approach
              _buildSectionTitle('Abutment Approach'),
              _buildDetailRow('Pavement Status', inspection.abutmentapproachpavementstatus),
              _buildDetailRow('Pavement Bound', inspection.abutmentapproachpavementbound),
              _buildDetailRow('Pavement Remarks', inspection.abutmentapproachpavementremarks),
              _buildDetailRow('Others', inspection.abutmentapproachothers),
              _buildDetailRow('Others Status', inspection.abutmentapproachothersstatus),
              _buildDetailRow('Others Bound', inspection.abutmentapproachothersbound),
              _buildDetailRow('Others Remarks', inspection.abutmentapproachothersremarks),
              const SizedBox(height: 20),

              // Beam/Girder
              _buildSectionTitle('Beam/Girder'),
              _buildDetailRow('Corrosion Status', inspection.beamcorrosionstatus),
              _buildDetailRow('Corrosion Bound', inspection.beamcorrosionbound),
              _buildDetailRow('Corrosion Remarks', inspection.beamcorrosionremarks),
              _buildDetailRow('Crack Status', inspection.beamcrackstatus),
              _buildDetailRow('Crack Bound', inspection.beamcrackbound),
              _buildDetailRow('Crack Remarks', inspection.beamcrackremarks),
              _buildDetailRow('Spalling Status', inspection.beamspallingstatus),
              _buildDetailRow('Spalling Bound', inspection.beamspallingbound),
              _buildDetailRow('Spalling Remarks', inspection.beamspallingremarks),
              _buildDetailRow('Others', inspection.beamothers),
              _buildDetailRow('Others Status', inspection.beamothersstatus),
              _buildDetailRow('Others Bound', inspection.beamothersbound),
              _buildDetailRow('Others Remarks', inspection.beamothersremarks),
              const SizedBox(height: 20),

              // Deck Soffit
              _buildSectionTitle('Deck Soffit'),
              _buildDetailRow('Crack Status', inspection.decksoffitcrackstatus),
              _buildDetailRow('Crack Bound', inspection.decksoffitcrackbound),
              _buildDetailRow('Crack Remarks', inspection.decksoffitcrackremarks),
              _buildDetailRow('Spalling Status', inspection.decksoffitspallstatus),
              _buildDetailRow('Spalling Bound', inspection.decksoffitspallbound),
              _buildDetailRow('Spalling Remarks', inspection.decksoffitspallremarks),
              _buildDetailRow('Others', inspection.decksoffitothers),
              _buildDetailRow('Others Status', inspection.decksoffitothersstatus),
              _buildDetailRow('Others Bound', inspection.conditiodecksoffitothersboundnPierCrack),
              _buildDetailRow('Others Remarks', inspection.decksoffitothersremarks),
              const SizedBox(height: 20),

              // Abutment/Wingwall
              _buildSectionTitle('Abutment/Wingwall'),
              _buildDetailRow('Movement Status', inspection.abutmentwingwallmovementstatus),
              _buildDetailRow('Movement Bound', inspection.abutmentwingwallmovementbound),
              _buildDetailRow('Movement Remarks', inspection.abutmentwingwallmovementremarks),
              _buildDetailRow('Crack Status', inspection.abutmentwingwallcrackstatus),
              _buildDetailRow('Crack Bound', inspection.abutmentwingwallcrackbound),
              _buildDetailRow('Crack Remarks', inspection.abutmentwingwallcrackremarks),
              _buildDetailRow('Spalling Status', inspection.abutmentwingwallspallstatus),
              _buildDetailRow('Spalling Bound', inspection.abutmentwingwallspallbound),
              _buildDetailRow('Spalling Remarks', inspection.abutmentwingwallspallremarks),
              _buildDetailRow('Others', inspection.abutmentwingwallothers),
              _buildDetailRow('Others Status', inspection.abutmentwingwallothersstatus),
              _buildDetailRow('Others Bound', inspection.abutmentwingwallothersbound),
              _buildDetailRow('Others Remarks', inspection.abutmentwingwallothersremarks),
              const SizedBox(height: 20),

              // Pier
              _buildSectionTitle('Pier'),
              _buildDetailRow('Movement Status', inspection.piermovementstatus),
              _buildDetailRow('Movement Bound', inspection.piermovementbound),
              _buildDetailRow('Movement Remarks', inspection.piermovementremarks),
              _buildDetailRow('Scour Status', inspection.pierscourstatus),
              _buildDetailRow('Scour Bound', inspection.pierscourbound),
              _buildDetailRow('Scour Remarks', inspection.pierscourremarks),
              _buildDetailRow('Debris Status', inspection.pierdebrisstatus),
              _buildDetailRow('Debris Bound', inspection.pierdebrisbound),
              _buildDetailRow('Debris Remarks', inspection.pierdebrisremarks),
              _buildDetailRow('Crack Status', inspection.piercrackstatus),
              _buildDetailRow('Crack Bound', inspection.piercrackbound),
              _buildDetailRow('Crack Remarks', inspection.piercrackremarks),
              _buildDetailRow('Spalling Status', inspection.pierspallstatus),
              _buildDetailRow('Spalling Bound', inspection.pierspallbound),
              _buildDetailRow('Spalling Remarks', inspection.pierspallremarks),
              _buildDetailRow('Others', inspection.pierothers),
              _buildDetailRow('Others Status', inspection.pierothersstatus),
              _buildDetailRow('Others Bound', inspection.pierothersbound),
              _buildDetailRow('Others Remarks', inspection.pierothersremarks),
              const SizedBox(height: 20),

              // Slope Protection / River Bank / Waterway
              _buildSectionTitle('Slope Protection / River Bank / Waterway'),
              _buildDetailRow('Damage Status', inspection.slopeprotectiondamagestatus),
              _buildDetailRow('Damage Bound', inspection.remarksBeaslopeprotectiondamageboundmcrack),
              _buildDetailRow('Damage Remarks', inspection.slopeprotectiondamageremarks),
              _buildDetailRow('Scouring Status', inspection.slopeprotectionscouringstatus),
              _buildDetailRow('Scouring Bound', inspection.slopeprotectionscouringbound),
              _buildDetailRow('Scouring Remarks', inspection.slopeprotectionscouringremarks),
              _buildDetailRow('Erosion Status', inspection.slopeprotectionerosionstatus),
              _buildDetailRow('Erosion Bound', inspection.slopeprotectionerosionbound),
              _buildDetailRow('Erosion Remarks', inspection.slopeprotectionerosionremarks),
              _buildDetailRow('Vegetation Status', inspection.slopeprotectionvegestatus),
              _buildDetailRow('Vegetation Bound', inspection.slopeprotectionvegebound),
              _buildDetailRow('Vegetation Remarks', inspection.slopeprotectionvegeremarks),
              _buildDetailRow('Silt Status', inspection.slopeprotectionsiltstatus),
              _buildDetailRow('Silt Bound', inspection.slopeprotectionsiltbound),
              _buildDetailRow('Silt Remarks', inspection.slopeprotectionsiltremarks),
              _buildDetailRow('Others', inspection.slopeprotectionothers),
              _buildDetailRow('Others Status', inspection.slopeprotectionothersstatus),
              _buildDetailRow('Others Bound', inspection.slopeprotectionothersbound),
              _buildDetailRow('Others Remarks', inspection.slopeprotectionothersremarks),
              const SizedBox(height: 20),

              // Bearing
              _buildSectionTitle('Bearing'),
              _buildDetailRow('Deformation Status', inspection.bearingdeformstatus),
              _buildDetailRow('Deformation Bound', inspection.bearingdeformbound),
              _buildDetailRow('Deformation Remarks', inspection.bearingdeformremarks),
              _buildDetailRow('Debris Status', inspection.bearingdebrisstatus),
              _buildDetailRow('Debris Bound', inspection.bearingdebrisbound),
              _buildDetailRow('Debris Remarks', inspection.bearingdebrisremarks),
              _buildDetailRow('Seating Status', inspection.bearingseatingstatus),
              _buildDetailRow('Seating Bound', inspection.bearingseatingbound),
              _buildDetailRow('Seating Remarks', inspection.bearingseatingremarks),
              _buildDetailRow('Plinth Status', inspection.bearingplinthstatus),
              _buildDetailRow('Plinth Bound', inspection.bearingplinthbound),
              _buildDetailRow('Plinth Remarks', inspection.bearingplinthremarks),
              _buildDetailRow('Others', inspection.bearingothers),
              _buildDetailRow('Others Status', inspection.bearingothersstatus),
              _buildDetailRow('Others Bound', inspection.bearingothersbound),
              _buildDetailRow('Others Remarks', inspection.bearingothersremarks),
              const SizedBox(height: 20),

              // Others Elements
              _buildSectionTitle('Other Elements'),
              _buildDetailRow('Element 1 Description', inspection.otherselem1description),
              _buildDetailRow('Element 1 Status', inspection.otherselem1status),
              _buildDetailRow('Element 1 Bound', inspection.otherselem1bound),
              _buildDetailRow('Element 1 Remarks', inspection.otherselem1remarks),
              _buildDetailRow('Element 2 Description', inspection.otherselem2description),
              _buildDetailRow('Element 2 Status', inspection.otherselem2status),
              _buildDetailRow('Element 2 Bound', inspection.otherselem2bound),
              _buildDetailRow('Element 2 Remarks', inspection.otherselem2remarks),
              const SizedBox(height: 20),

              // Defects
              _buildSectionTitle('Defects'),
              _buildDetailRow('Routine Defect 1', inspection.routinedefect1),
              _buildDetailRow('Other Defect 1', inspection.otherdefect1),
              _buildDetailRow('Routine Defect 2', inspection.routinedefect2),
              _buildDetailRow('Routine Defect 3', inspection.routinedefect3),
              _buildDetailRow('Routine Defect 4', inspection.routinedefect4),
              _buildDetailRow('Other Defect 2', inspection.otherdefect2),
              _buildDetailRow('Other Defect 3', inspection.otherdefect3),
              _buildDetailRow('Other Defect 4', inspection.otherdefect4),
            ],
          ),
        ),
      ),
    );
  }

  // Helper widget for section titles
  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 18.0,
          fontWeight: FontWeight.bold,
          color: Colors.deepPurple,
        ),
      ),
    );
  }

  // Helper widget for detail rows - handles null and empty strings
  Widget _buildDetailRow(String label, String? value) {
    String displayValue = value ?? 'N/A';
    if (displayValue.isEmpty) {
      displayValue = 'N/A';
    }
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start, // Align label and value to top
        children: [
          Expanded(
            flex: 2, // Label takes 2 parts
            child: Text(
              '$label: ',
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.grey,
              ),
            ),
          ),
          Expanded(
            flex: 3, // Value takes 3 parts
            child: Text(
              displayValue,
              style: const TextStyle(
                fontWeight: FontWeight.w400,
                color: Colors.black87,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
