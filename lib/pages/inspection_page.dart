// File: lib/pages/inspection_page.dart
import 'package:bridgeinsp_new/generaloutline.dart';
import 'package:bridgeinsp_new/models/sendmodel.dart'; // Import the SendInfo DTO
import 'package:bridgeinsp_new/models/bridgeidlist_model.dart'; // For adding to "list"
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
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:bridgeinsp_new/models/brpost_model.dart'; 
// --- ADD IMAGE PICKER IMPORT ---
import 'package:image_picker/image_picker.dart';
import 'dart:io'; // For File
import 'dart:convert'; // For base64Encode
// --- END OF IMPORT -----

// Add SharedPref helper if not available elsewhere
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
  late final SuperstructureSecondaryTab structuresecondform =
      SuperstructureSecondaryTab();
  late final SubstructureTab structuresubform = SubstructureTab();
  late final InspectionSummaryTab summaryform = InspectionSummaryTab();
  late final FurtherInvestigationTab furtherinvform = FurtherInvestigationTab();
  late final RemedialWorkTab remworkform = RemedialWorkTab();
  late final ObservationMaintenanceRoutineTab observationform =
      ObservationMaintenanceRoutineTab();

  int _currentStep = 0;

  // --- ADD IMAGE PICKER STATE ---
  final ImagePicker _picker = ImagePicker();
  List<XFile> _imageFiles = <XFile>[];
  // --- END OF STATE ---

  StepState _stepState(int step) {
    if (_currentStep > step) {
      return StepState.complete;
    } else {
      return StepState.editing;
    }
  }

  // --- ADD IMAGE PICKER METHODS ---
  Future<void> _pickImage(ImageSource source) async {
    try {
      final XFile? pickedFile = await _picker.pickImage(source: source);
      if (pickedFile != null) {
        setState(() {
          _imageFiles.add(pickedFile);
        });
      }
    } catch (e) {
      print("Error picking image: $e");
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Failed to pick image: $e")),
        );
      }
    }
  }

  void _removeImage(int index) {
    setState(() {
      _imageFiles.removeAt(index);
    });
  }
  // --- END OF METHODS ---

  List<Step> _steps() => [
        Step(
          title: const Text(
            'GENERAL DATA',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          content: Bridgeinventory(row: widget.row),
          state: _stepState(0),
          isActive: _currentStep == 0,
        ),
        Step(
          title: const Text(
            'BRIDGE INSPECTION PAGE',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          content: structuresecondform,
          state: _stepState(1),
          isActive: _currentStep == 1,
        ),
        // --- ADD NEW STEP FOR IMAGES ---
        Step(
          title: const Text(
            'PICTURES',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          content: _ImagePickerTab( // Create this new widget
            imageFiles: _imageFiles,
            onTakePicture: () => _pickImage(ImageSource.camera),
            onSelectFromGallery: () => _pickImage(ImageSource.gallery),
            onRemoveImage: _removeImage,
          ),
          state: _stepState(2),
          isActive: _currentStep == 2,
        ),
        // --- END OF NEW STEP ---
      ];

  String? _safeToString(dynamic value) {
    if (value == null || value == 'null') {
      return null;
    }
    return value.toString();
  }

  Future<void> _saveInspection() async {
    bool? confirm = await showDialog<bool>(
      context: context,
      builder: (_) => CupertinoAlertDialog(
        title: const Text("Confirm"),
        content: const Text("Are You Sure to Save?"),
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

    // Prepare image data asynchronously
    List<String>? imageBase64List;
    if (_imageFiles.isNotEmpty) {
      imageBase64List = [];
      for (XFile file in _imageFiles) {
        List<int> imageBytes = await File(file.path).readAsBytes();
        String base64String = base64Encode(imageBytes);
        imageBase64List.add(base64String);
      }
    }

    // --- STEP 1: Collect data from forms into the UI DTO (SendInfo) ---
    final sendInfoDto = SendInfo(
      id: widget.row.toString(),
      // Use the helper function for all fields
      surfacebridgeblockagestatus: _safeToString(structuresecondform.formBloc?.cond_blockage_status.value),
      surfacebridgeblockagebound: _safeToString(structuresecondform.formBloc?.cond_surfacebridge_blockage_bound.value),
      surfacebridgeblockageremarks: _safeToString(structuresecondform.formBloc?.cond_surfacebridge_blockage_remarks.value),
      surfacebridgepondingstatus: _safeToString(structuresecondform.formBloc?.cond_ponding_status.value),
      surfacebridgepondingbound: _safeToString(structuresecondform.formBloc?.cond_ponding_bound.value),
      surfacebridgepondingremarks: _safeToString(structuresecondform.formBloc?.cond_ponding_remarks.value),
      surfacebridgeothers: _safeToString(structuresecondform.formBloc?.cond_surfacebridge_others.value),
      surfacebridgeothersstatus: _safeToString(structuresecondform.formBloc?.cond_surfacebridge_Status.value), // Note: Capital 'S' in Status
      surfacebridgeothersbound: _safeToString(structuresecondform.formBloc?.cond_others_bound.value),
      surfacebridgeothersremarks: _safeToString(structuresecondform.formBloc?.cond_others_remarks.value),
      parapetimpactstatus: _safeToString(structuresecondform.formBloc?.cond_impact_status.value),
      parapetimpactbound: _safeToString(structuresecondform.formBloc?.cond_impact_bound.value),
      parapetimpactremarks: _safeToString(structuresecondform.formBloc?.cond_impact_remarks.value),
      parapetcorrosionstatus: _safeToString(structuresecondform.formBloc?.cond_corrosion_status.value),
      parapetcorrosionbound: _safeToString(structuresecondform.formBloc?.cond_corrosion_bound.value),
      parapetcorrosionremarks: _safeToString(structuresecondform.formBloc?.remarkscorrosion.value),
      parapetcrackstatus: _safeToString(structuresecondform.formBloc?.cond_crack_status.value),
      parapetcrackbound: _safeToString(structuresecondform.formBloc?.cond_crack_bound.value),
      parapetcrackremarks: _safeToString(structuresecondform.formBloc?.remarkscrack.value),
      parapetspallstatus: _safeToString(structuresecondform.formBloc?.cond_spall_status.value),
      parapetspallbound: _safeToString(structuresecondform.formBloc?.cond_spall_bound.value),
      parapetspallremarks: _safeToString(structuresecondform.formBloc?.remarksspalling.value),
      parapetothers: _safeToString(structuresecondform.formBloc?.cond_parapet_others.value),
      parapetothersstatus: _safeToString(structuresecondform.formBloc?.cond_parapet_others_status.value),
      parapetothersbound: _safeToString(structuresecondform.formBloc?.cond_parapet_others_bound.value),
      parapetothersremarks: _safeToString(structuresecondform.formBloc?.cond_parapet_remarks.value),
      jointdescription: _safeToString(structuresecondform.formBloc?.joint_description.value),
      jointstatus: _safeToString(structuresecondform.formBloc?.cond_joint_status.value),
      jointbound: _safeToString(structuresecondform.formBloc?.cond_joint_bound.value),
      jointremarks: _safeToString(structuresecondform.formBloc?.cond_joint_remarks.value),
      jointfixitystatus: _safeToString(structuresecondform.formBloc?.cond_fixity_status.value),
      jointfixitybound: _safeToString(structuresecondform.formBloc?.cond_fixity_bound.value),
      jointfixityremarks: _safeToString(structuresecondform.formBloc?.remarksFixity.value),
      jointleakagestatus: _safeToString(structuresecondform.formBloc?.cond_leakage_status.value),
      jointleakagebound: _safeToString(structuresecondform.formBloc?.cond_leakage_bound.value),
      jointleakageremarks: _safeToString(structuresecondform.formBloc?.remarksWaterLeakage.value),
      jointothers: _safeToString(structuresecondform.formBloc?.joint_others.value),
      jointothersstatus: _safeToString(structuresecondform.formBloc?.cond_joint_others_status.value),
      jointothersbound: _safeToString(structuresecondform.formBloc?.cond_joint_others_bound.value),
      jointothersremarks: _safeToString(structuresecondform.formBloc?.remarksjointOthers.value),
      abutmentapproachpavementstatus: _safeToString(structuresecondform.formBloc?.cond_pavement_status.value),
      abutmentapproachpavementbound: _safeToString(structuresecondform.formBloc?.cond_pavement_bound.value),
      abutmentapproachpavementremarks: _safeToString(structuresecondform.formBloc?.cond_pavement_remarks.value),
      abutmentapproachothers: _safeToString(structuresecondform.formBloc?.cond_abutmentapproach_others.value),
      abutmentapproachothersstatus: _safeToString(structuresecondform.formBloc?.cond_abutmentapproach_others_status.value),
      abutmentapproachothersbound: _safeToString(structuresecondform.formBloc?.cond_abutmentapproach_others_bound.value),
      abutmentapproachothersremarks: _safeToString(structuresecondform.formBloc?.abutmentapproach_others_remarks.value),
      beamcorrosionstatus: _safeToString(structuresecondform.formBloc?.cond_beam_corrosion_status.value),
      beamcorrosionbound: _safeToString(structuresecondform.formBloc?.cond_beam_corrosion_bound.value),
      beamcorrosionremarks: _safeToString(structuresecondform.formBloc?.cond_beam_corrosion_remarks.value),
      beamcrackstatus: _safeToString(structuresecondform.formBloc?.cond_beam_crack_status.value),
      beamcrackbound: _safeToString(structuresecondform.formBloc?.cond_beam_crack_bound.value),
      beamcrackremarks: _safeToString(structuresecondform.formBloc?.cond_beam_crack_remarks.value),
      beamspallingstatus: _safeToString(structuresecondform.formBloc?.cond_beam_spalling_status.value),
      beamspallingbound: _safeToString(structuresecondform.formBloc?.cond_beam_spalling_bound.value),
      beamspallingremarks: _safeToString(structuresecondform.formBloc?.cond_beam_spalling_remarks.value),
      beamothers: _safeToString(structuresecondform.formBloc?.cond_beam_others.value),
      beamothersstatus: _safeToString(structuresecondform.formBloc?.cond_beam_others_status.value),
      beamothersbound: _safeToString(structuresecondform.formBloc?.cond_beam_others_bound.value),
      beamothersremarks: _safeToString(structuresecondform.formBloc?.cond_beam_others_remarks.value),
      decksoffitcrackstatus: _safeToString(structuresecondform.formBloc?.cond_decksoffit_crack_status.value),
      decksoffitcrackbound: _safeToString(structuresecondform.formBloc?.cond_decksoffit_crack_bound.value),
      decksoffitcrackremarks: _safeToString(structuresecondform.formBloc?.cond_decksoffit_crack_remarks.value),
      decksoffitspallstatus: _safeToString(structuresecondform.formBloc?.cond_decksoffit_spall_status.value),
      decksoffitspallbound: _safeToString(structuresecondform.formBloc?.cond_decksoffit_spall_bound.value),
      decksoffitspallremarks: _safeToString(structuresecondform.formBloc?.cond_decksoffit_spall_remarks.value),
      decksoffitothers: _safeToString(structuresecondform.formBloc?.cond_decksoffit_others.value),
      decksoffitothersstatus: _safeToString(structuresecondform.formBloc?.cond_decksoffit_others_status.value),
      conditiodecksoffitothersboundnPierCrack: _safeToString(structuresecondform.formBloc?.cond_decksoffit_others_bound.value),
      decksoffitothersremarks: _safeToString(structuresecondform.formBloc?.cond_decksoffit_others_remarks.value),
      abutmentwingwallmovementstatus: _safeToString(structuresecondform.formBloc?.cond_abutmentwingwall_movement_status.value),
      abutmentwingwallmovementbound: _safeToString(structuresecondform.formBloc?.cond_abutmentwingwall_movement_bound.value),
      abutmentwingwallmovementremarks: _safeToString(structuresecondform.formBloc?.cond_abutmentwingwall_movement_remarks.value),
      abutmentwingwallcrackstatus: _safeToString(structuresecondform.formBloc?.cond_abutmentwingwall_crack_status.value),
      abutmentwingwallcrackbound: _safeToString(structuresecondform.formBloc?.cond_abutmentwingwall_crack_bound.value),
      abutmentwingwallcrackremarks: _safeToString(structuresecondform.formBloc?.cond_abutmentwingwall_crack_remarks.value),
      abutmentwingwallspallstatus: _safeToString(structuresecondform.formBloc?.cond_abutmentwingwall_spall_status.value),
      abutmentwingwallspallbound: _safeToString(structuresecondform.formBloc?.cond_abutmentwingwall_spall_bound.value),
      abutmentwingwallspallremarks: _safeToString(structuresecondform.formBloc?.cond_abutmentwingwall_spall_remarks.value),
      abutmentwingwallothers: _safeToString(structuresecondform.formBloc?.cond_abutmentwingwall_others.value),
      abutmentwingwallothersstatus: _safeToString(structuresecondform.formBloc?.cond_abutmentwingwall_others_status.value),
      abutmentwingwallothersbound: _safeToString(structuresecondform.formBloc?.cond_abutmentwingwall_others_bound.value),
      abutmentwingwallothersremarks: _safeToString(structuresecondform.formBloc?.cond_abutmentwingwall_others_remarks.value),
      piermovementstatus: _safeToString(structuresecondform.formBloc?.cond_pier_movement_status.value),
      piermovementbound: _safeToString(structuresecondform.formBloc?.cond_pier_movement_bound.value),
      piermovementremarks: _safeToString(structuresecondform.formBloc?.cond_pier_movement_remarks.value),
      pierscourstatus: _safeToString(structuresecondform.formBloc?.cond_pier_scour_status.value),
      pierscourbound: _safeToString(structuresecondform.formBloc?.cond_pier_scour_bound.value),
      pierscourremarks: _safeToString(structuresecondform.formBloc?.cond_pier_scour_remarks.value),
      pierdebrisstatus: _safeToString(structuresecondform.formBloc?.cond_pier_debris_status.value),
      pierdebrisbound: _safeToString(structuresecondform.formBloc?.cond_pier_debris_bound.value),
      pierdebrisremarks: _safeToString(structuresecondform.formBloc?.cond_pier_debris_remarks.value),
      piercrackstatus: _safeToString(structuresecondform.formBloc?.cond_pier_crack_status.value),
      piercrackbound: _safeToString(structuresecondform.formBloc?.cond_pier_crack_bound.value),
      piercrackremarks: _safeToString(structuresecondform.formBloc?.cond_pier_crack_remarks.value),
      pierspallstatus: _safeToString(structuresecondform.formBloc?.cond_pier_spall_status.value),
      pierspallbound: _safeToString(structuresecondform.formBloc?.cond_pier_spall_bound.value),
      pierspallremarks: _safeToString(structuresecondform.formBloc?.cond_pier_spall_remarks.value),
      pierothers: _safeToString(structuresecondform.formBloc?.cond_pier_others.value),
      pierothersstatus: _safeToString(structuresecondform.formBloc?.cond_pier_others_status.value),
      pierothersbound: _safeToString(structuresecondform.formBloc?.cond_pier_others_bound.value),
      pierothersremarks: _safeToString(structuresecondform.formBloc?.cond_pier_others_remarks.value),
      slopeprotectiondamagestatus: _safeToString(structuresecondform.formBloc?.cond_slopeprotection_damage_status.value),
      remarksBeaslopeprotectiondamageboundmcrack: _safeToString(structuresecondform.formBloc?.cond_slopeprotection_damage_bound.value),
      slopeprotectiondamageremarks: _safeToString(structuresecondform.formBloc?.cond_slopeprotection_damage_remarks.value),
      slopeprotectionscouringstatus: _safeToString(structuresecondform.formBloc?.cond_slopeprotection_scouring_status.value),
      slopeprotectionscouringbound: _safeToString(structuresecondform.formBloc?.cond_slopeprotection_scouring_bound.value),
      slopeprotectionscouringremarks: _safeToString(structuresecondform.formBloc?.cond_slopeprotection_scouring_remarks.value),
      slopeprotectionerosionstatus: _safeToString(structuresecondform.formBloc?.cond_slopeprotection_erosion_status.value),
      slopeprotectionerosionbound: _safeToString(structuresecondform.formBloc?.cond_slopeprotection_erosion_bound.value),
      slopeprotectionerosionremarks: _safeToString(structuresecondform.formBloc?.cond_slopeprotection_erosion_remarks.value),
      slopeprotectionvegestatus: _safeToString(structuresecondform.formBloc?.cond_slopeprotection_vege_status.value),
      slopeprotectionvegebound: _safeToString(structuresecondform.formBloc?.cond_slopeprotection_vege_bound.value),
      slopeprotectionvegeremarks: _safeToString(structuresecondform.formBloc?.cond_slopeprotection_vege_remarks.value),
      slopeprotectionsiltstatus: _safeToString(structuresecondform.formBloc?.cond_slopeprotection_silt_status.value),
      slopeprotectionsiltbound: _safeToString(structuresecondform.formBloc?.cond_slopeprotection_silt_bound.value),
      slopeprotectionsiltremarks: _safeToString(structuresecondform.formBloc?.cond_slopeprotection_silt_remarks.value),
      slopeprotectionothers: _safeToString(structuresecondform.formBloc?.cond_slopeprotection_others.value),
      slopeprotectionothersstatus: _safeToString(structuresecondform.formBloc?.cond_slopeprotection_others_status.value),
      slopeprotectionothersbound: _safeToString(structuresecondform.formBloc?.cond_slopeprotection_others_bound.value),
      slopeprotectionothersremarks: _safeToString(structuresecondform.formBloc?.cond_slopeprotection_others_remarks.value),
      bearingdeformstatus: _safeToString(structuresecondform.formBloc?.cond_bearing_deform_status.value),
      bearingdeformbound: _safeToString(structuresecondform.formBloc?.cond_bearing_deform_bound.value),
      bearingdeformremarks: _safeToString(structuresecondform.formBloc?.cond_bearing_deform_remarks.value),
      bearingdebrisstatus: _safeToString(structuresecondform.formBloc?.cond_bearing_debris_status.value),
      bearingdebrisbound: _safeToString(structuresecondform.formBloc?.cond_bearing_debris_bound.value),
      bearingdebrisremarks: _safeToString(structuresecondform.formBloc?.cond_bearing_debris_remarks.value),
      bearingseatingstatus: _safeToString(structuresecondform.formBloc?.cond_bearing_seating_status.value),
      bearingseatingbound: _safeToString(structuresecondform.formBloc?.cond_bearing_seating_bound.value),
      bearingseatingremarks: _safeToString(structuresecondform.formBloc?.cond_bearing_seating_remarks.value),
      bearingplinthstatus: _safeToString(structuresecondform.formBloc?.cond_bearing_plinth_status.value),
      bearingplinthbound: _safeToString(structuresecondform.formBloc?.cond_bearing_plinth_bound.value),
      bearingplinthremarks: _safeToString(structuresecondform.formBloc?.cond_bearing_plinth_remarks.value),
      bearingothers: _safeToString(structuresecondform.formBloc?.cond_bearing_others.value),
      bearingothersstatus: _safeToString(structuresecondform.formBloc?.cond_bearing_others_status.value),
      bearingothersbound: _safeToString(structuresecondform.formBloc?.cond_bearing_others_bound.value),
      bearingothersremarks: _safeToString(structuresecondform.formBloc?.cond_bearing_others_remarks.value),
      otherselem1description: _safeToString(structuresecondform.formBloc?.cond_otherselem1_description.value),
      otherselem1status: _safeToString(structuresecondform.formBloc?.cond_otherselem1_status.value),
      otherselem1bound: _safeToString(structuresecondform.formBloc?.cond_otherselem1_bound.value),
      otherselem1remarks: _safeToString(structuresecondform.formBloc?.cond_otherselem1_remarks.value),
      otherselem2description: _safeToString(structuresecondform.formBloc?.cond_otherselem2_description.value),
      otherselem2status: _safeToString(structuresecondform.formBloc?.cond_otherselem2_status.value),
      otherselem2bound: _safeToString(structuresecondform.formBloc?.cond_otherselem2_bound.value),
      otherselem2remarks: _safeToString(structuresecondform.formBloc?.cond_otherselem2_remarks.value),
      routinedefect1: _safeToString(structuresecondform.formBloc?.cond_routinedefect1.value),
      otherdefect1: _safeToString(structuresecondform.formBloc?.cond_otherdefect1.value),
      routinedefect2: _safeToString(structuresecondform.formBloc?.cond_routinedefect2.value),
      routinedefect3: _safeToString(structuresecondform.formBloc?.cond_routinedefect3.value),
      routinedefect4: _safeToString(structuresecondform.formBloc?.cond_routinedefect4.value),
      otherdefect2: _safeToString(structuresecondform.formBloc?.cond_otherdefect2.value),
      otherdefect3: _safeToString(structuresecondform.formBloc?.cond_otherdefect3.value),
      otherdefect4: _safeToString(structuresecondform.formBloc?.cond_otherdefect4.value),
      dateofinspection: DateTime.now(), // Use current time for saving
      inspectedby: 'MobileUser', // Set default user
      maintainedby: 'PLUS', // Set default maintenance
      dateoflastinspection: '', // Assuming these are handled elsewhere or are empty strings initially
      // --- ADD IMAGES TO THE SendInfo DTO ---
      images: imageBase64List, // Pass the list of base64 strings
      // images2, images3, images4 would be collected similarly if needed
      // --- END OF IMAGES ---
    );
    // --- END OF COLLECTING INTO SendInfo DTO ---

    try {
      // --- STEP 2: Map SendInfo DTO to BrPostModel using the factory ---
      // This assumes BrPostModel.fromFormValues exists and handles sanitization/default values.
      final brPostModelToSave = BrPostModel.fromFormValues(
        id: sendInfoDto.id!,
        // Pass raw dynamic values from SendInfo DTO to the factory
        // The factory will handle sanitization (?.toString()) and defaults
        surfacebridgeblockagestatus: sendInfoDto.surfacebridgeblockagestatus,
        surfacebridgeblockagebound: sendInfoDto.surfacebridgeblockagebound,
        surfacebridgeblockageremarks: sendInfoDto.surfacebridgeblockageremarks,
        surfacebridgepondingstatus: sendInfoDto.surfacebridgepondingstatus,
        
        // Pass date/inspector/maintainer if needed from UI, or let factory use defaults
        dateofinsp: sendInfoDto.dateofinspection, // Or get from UI if applicable
        inspectedby: sendInfoDto.inspectedby, // Or get from UI if applicable
        maintainedby: sendInfoDto.maintainedby, // Or get from UI if applicable
        // Pass images from SendInfo DTO
        images: sendInfoDto.images,
        // images2: sendInfoDto.images2, // Add if you have multiple image lists
        // images3: sendInfoDto.images3,
        // images4: sendInfoDto.images4,
      );
      // --- END OF MAPPING ---

      // --- STEP 3: Save BrPostModel using Repository ---
      final repository = BrPostRepository(); // Or get it via dependency injection
      await repository.save(brPostModelToSave);
      // --- END OF SAVING ---

      // Add Bridge ID to "list" for SelectedIdPage / RecordedInspection
      final sharedPref = SharedPref();
      try {
        String? jsonString = await sharedPref.read("list");
        List<Rows> selectedList = [];

        if (jsonString != null) {
          selectedList = Rows.decode(jsonString);
        }

        // Avoid duplicates
        if (!selectedList.any((row) => row.id == widget.row)) {
          selectedList.add(Rows(id: widget.row, dateofinsp: DateTime.now()));
          await sharedPref.save("list", Rows.encode(selectedList));
        }
      } catch (e) {
        // If "list" doesn't exist or decode fails, create a new one
        List<Rows> newList = [Rows(id: widget.row, dateofinsp: DateTime.now())];
        await sharedPref.save("list", Rows.encode(newList));
      }

      if (!mounted) return; // Check if widget is still mounted after async operation

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Save!"), duration: Duration(milliseconds: 500)),
      );

      // Optional: Show a confirmation dialog before navigating
      bool? goToRecorded = await showDialog<bool>(
        context: context,
        builder: (_) => CupertinoAlertDialog(
          title: const Text("Success"),
          content: const Text("Go to saved page?"),
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
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Save failed: $e")),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      drawer: const NavBar(),
      appBar: AppBar(
        title: Text(
          'Bridge General Inspection\nBridge ID : ${widget.row}',
          style: const TextStyle(fontSize: 20.0, color: Colors.black87),
          textAlign: TextAlign.center,
        ),
        centerTitle: true,
        backgroundColor: Colors.deepPurple.shade200,
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _saveInspection,
        icon: const Icon(Icons.airplane_ticket),
        heroTag: "fab1",
        label: const Text("Save"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stepper(
              physics: const ScrollPhysics(),
              type: StepperType.vertical,
              controlsBuilder: (BuildContext context, ControlsDetails controls) {
                return const Padding(padding: EdgeInsets.symmetric(vertical: 16.0));
              },
              onStepTapped: (step) => setState(() => _currentStep = step),
              onStepContinue: () {
                setState(() {
                  if (_currentStep < _steps().length - 1) {
                    _currentStep += 1;
                  } else {
                    _currentStep = 0;
                  }
                });
              },
              onStepCancel: () {
                setState(() {
                  if (_currentStep > 0) {
                    _currentStep -= 1;
                  }
                });
              },
              currentStep: _currentStep,
              steps: _steps(),
            ),
          ],
        ),
      ),
    );
  }
}

// --- NEW: Create the Image Picker Tab Widget ---
class _ImagePickerTab extends StatelessWidget {
  final List<XFile> imageFiles;
  final VoidCallback onTakePicture;
  final VoidCallback onSelectFromGallery;
  final Function(int) onRemoveImage; // Function to remove an image by index

  const _ImagePickerTab({
    Key? key,
    required this.imageFiles,
    required this.onTakePicture,
    required this.onSelectFromGallery,
    required this.onRemoveImage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Buttons to add images
        Row(
          children: [
            ElevatedButton.icon(
              onPressed: onTakePicture,
              icon: const Icon(Icons.camera_alt),
              label: const Text("Take Picture"),
            ),
            const SizedBox(width: 10),
            ElevatedButton.icon(
              onPressed: onSelectFromGallery,
              icon: const Icon(Icons.image),
              label: const Text("Select from Gallery"),
            ),
          ],
        ),
        const SizedBox(height: 10),
        // Display selected images
        if (imageFiles.isNotEmpty)
          const Text("Selected Images:", style: TextStyle(fontWeight: FontWeight.bold))
        else
          const Text("No images selected."),
        const SizedBox(height: 10),
        Wrap(
          spacing: 8.0,
          runSpacing: 8.0,
          children: imageFiles.asMap().entries.map((entry) {
            int index = entry.key;
            XFile file = entry.value;
            return Stack(
              children: [
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.file(
                      File(file.path), // Convert XFile to File
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                // Remove button for each image
                Positioned(
                  top: -5,
                  right: -5,
                  child: CircleAvatar(
                    radius: 12,
                    backgroundColor: Colors.red,
                    child: IconButton(
                      padding: EdgeInsets.zero,
                      iconSize: 14,
                      color: Colors.white,
                      icon: const Icon(Icons.close),
                      onPressed: () => onRemoveImage(index),
                    ),
                  ),
                ),
              ],
            );
          }).toList(),
        ),
      ],
    );
  }
}
// --- END OF NEW WIDGET ---

void mergeform() {}
