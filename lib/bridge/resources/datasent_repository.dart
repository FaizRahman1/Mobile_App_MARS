// File: lib/resources/datasent_repository.dart

import 'package:bridgeinsp_new/bridge/brmodels/brpost_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

import '../notification/services/notification_service.dart';

final Uuid uuid = const Uuid();

abstract class PostingRepository {
  Future<AlertDialog> senddetaillist(BrPostModel pibridge);
}

class DatasendRepos extends PostingRepository {
  final Dio _dio = Dio();

  @override
  Future<AlertDialog> senddetaillist(BrPostModel gibridge) async {
    debugPrint("repository reachable");

    final String newid = uuid.v4();

    final response = await _dio.post(
      "https://c751d51c-8449-4784-b592-f904983ea9b0.mock.pstmn.io",
      data: {
        "id": newid,
        "bridgeid": gibridge.id ?? "",
        "dateofinspection": "2023-09-21T02:00:50.069Z",
        "dateoflastinspection": "2023-09-21T02:00:50.069Z",
        "inspectedby": gibridge.inspectedby ?? "",

        "cond_blockage_status": gibridge.surfacebridgeblockagestatus ?? "",
        "cond_surfacebridge_blockage_bound": gibridge.surfacebridgeblockagebound ?? "",
        "cond_surfacebridge_blockage_remarks": gibridge.surfacebridgeblockageremarks ?? "",
        "cond_ponding_status": gibridge.surfacebridgepondingstatus ?? "",
        "cond_ponding_bound": gibridge.surfacebridgepondingbound ?? "",
        "cond_ponding_remarks": gibridge.surfacebridgepondingremarks ?? "",
        "cond_surfacebridge_others": gibridge.surfacebridgeothers ?? "",
        "cond_surfacebridge_Status": gibridge.surfacebridgeothersstatus ?? "",
        "cond_others_bound": gibridge.surfacebridgeothersbound ?? "",
        "cond_others_remarks": gibridge.surfacebridgeothersremarks ?? "",

        "cond_impact_status": gibridge.parapetimpactstatus ?? "",
        "cond_impact_bound": gibridge.parapetimpactbound ?? "",
        "cond_impact_remarks": gibridge.parapetimpactremarks ?? "",
        "cond_corrosion_status": gibridge.parapetcorrosionstatus ?? "",
        "cond_corrosion_bound": gibridge.parapetcorrosionbound ?? "",
        "remarkscorrosion": gibridge.parapetcorrosionremarks ?? "",
        "cond_crack_status": gibridge.parapetcrackstatus ?? "",
        "cond_crack_bound": gibridge.parapetcrackbound ?? "",
        "remarkscrack": gibridge.parapetcrackremarks ?? "",
        "cond_spall_status": gibridge.parapetspallstatus ?? "",
        "cond_spall_bound": gibridge.parapetspallbound ?? "",
        "remarksspalling": gibridge.parapetspallremarks ?? "",
        "cond_parapet_others": gibridge.parapetothers ?? "",
        "cond_parapet_others_status": gibridge.parapetothersstatus ?? "",
        "cond_parapet_others_bound": gibridge.parapetothersbound ?? "",
        "cond_parapet_remarks": gibridge.parapetothersremarks ?? "",

        "joint_description": gibridge.jointdescription ?? "",
        "cond_joint_status": gibridge.jointstatus ?? "",
        "cond_joint_bound": gibridge.jointbound ?? "",
        "cond_joint_remarks": gibridge.jointremarks ?? "",
        "cond_fixity_status": gibridge.jointfixitystatus ?? "",
        "cond_fixity_bound": gibridge.jointfixitybound ?? "",
        "remarksFixity": gibridge.jointfixityremarks ?? "",
        "cond_leakage_status": gibridge.jointleakagestatus ?? "",
        "cond_leakage_bound": gibridge.jointleakagebound ?? "",
        "remarksWaterLeakage": gibridge.jointleakageremarks ?? "",
        "joint_others": gibridge.jointothers ?? "",
        "cond_joint_others_status": gibridge.jointothersstatus ?? "",

        // NOTE: You may want to add cond_pavement_status here if needed (missing in your original)
        "cond_pavement_bound": gibridge.abutmentapproachpavementbound ?? "",
        "cond_pavement_remarks": gibridge.abutmentapproachpavementremarks ?? "",
        "cond_abutmentapproach_others": gibridge.abutmentapproachothers ?? "",
        "cond_abutmentapproach_others_status": gibridge.abutmentapproachothersstatus ?? "",
        "cond_abutmentapproach_others_bound": gibridge.abutmentapproachothersbound ?? "",
        "abutmentapproach_others_remarks": gibridge.abutmentapproachothersremarks ?? "",

        "cond_beam_corrosion_status": gibridge.beamcorrosionstatus ?? "",
        "cond_beam_corrosion_bound": gibridge.beamcorrosionbound ?? "",
        "cond_beam_corrosion_remarks": gibridge.beamcorrosionremarks ?? "",
        "cond_beam_crack_status": gibridge.beamcrackstatus ?? "",
        "cond_beam_crack_bound": gibridge.beamcrackbound ?? "",
        "cond_beam_crack_remarks": gibridge.beamcrackremarks ?? "",
        "cond_beam_spalling_status": gibridge.beamspallingstatus ?? "",
        "cond_beam_spalling_bound": gibridge.beamspallingbound ?? "",
        "cond_beam_spalling_remarks": gibridge.beamspallingremarks ?? "",
        "cond_beam_others": gibridge.beamothers ?? "",
        "cond_beam_others_status": gibridge.beamothersstatus ?? "",
        "cond_beam_others_bound": gibridge.beamothersbound ?? "",
        "cond_beam_others_remarks": gibridge.beamothersremarks ?? "",

        "cond_decksoffit_crack_status": gibridge.decksoffitcrackstatus ?? "",
        "cond_decksoffit_crack_bound": gibridge.decksoffitcrackbound ?? "",
        "cond_decksoffit_crack_remarks": gibridge.decksoffitcrackremarks ?? "",
        "cond_decksoffit_spall_status": gibridge.decksoffitspallstatus ?? "",
        "cond_decksoffit_spall_bound": gibridge.decksoffitspallbound ?? "",
        "cond_decksoffit_spall_remarks": gibridge.decksoffitspallremarks ?? "",
        "cond_decksoffit_others": gibridge.decksoffitothers ?? "",
        "cond_decksoffit_others_status": gibridge.decksoffitothersstatus ?? "",
        "cond_decksoffit_others_bound": gibridge.conditiodecksoffitothersboundnPierCrack ?? "",
        "cond_decksoffit_others_remarks": gibridge.decksoffitothersremarks ?? "",

        "cond_abutmentwingwall_movement_status": gibridge.abutmentwingwallmovementstatus ?? "",
        "cond_abutmentwingwall_movement_bound": gibridge.abutmentwingwallmovementbound ?? "",
        "cond_abutmentwingwall_movement_remarks": gibridge.abutmentwingwallmovementremarks ?? "",
        "cond_abutmentwingwall_crack_status": gibridge.abutmentwingwallcrackstatus ?? "",
        "cond_abutmentwingwall_crack_bound": gibridge.abutmentwingwallcrackbound ?? "",
        "cond_abutmentwingwall_crack_remarks": gibridge.abutmentwingwallcrackremarks ?? "",
        "cond_abutmentwingwall_spall_status": gibridge.abutmentwingwallspallstatus ?? "",
        "cond_abutmentwingwall_spall_bound": gibridge.abutmentwingwallspallbound ?? "",
        "cond_abutmentwingwall_spall_remarks": gibridge.abutmentwingwallspallremarks ?? "",
        "cond_abutmentwingwall_others": gibridge.abutmentwingwallothers ?? "",
        "cond_abutmentwingwall_others_status": gibridge.abutmentwingwallothersstatus ?? "",
        "cond_abutmentwingwall_others_bound": gibridge.abutmentwingwallothersbound ?? "",
        "cond_abutmentwingwall_others_remarks": gibridge.abutmentwingwallothersremarks ?? "",

        "cond_pier_movement_status": gibridge.piermovementstatus ?? "",
        "cond_pier_movement_bound": gibridge.piermovementbound ?? "",
        "cond_pier_movement_remarks": gibridge.piermovementremarks ?? "",
        "cond_pier_scour_status": gibridge.pierscourstatus ?? "",
        "cond_pier_scour_bound": gibridge.pierscourbound ?? "",
        "cond_pier_scour_remarks": gibridge.pierscourremarks ?? "",
        "cond_pier_debris_status": gibridge.pierdebrisstatus ?? "",
        "cond_pier_debris_bound": gibridge.pierdebrisbound ?? "",
        "cond_pier_debris_remarks": gibridge.pierdebrisremarks ?? "",
        "cond_pier_crack_status": gibridge.piercrackstatus ?? "",
        "cond_pier_crack_bound": gibridge.piercrackbound ?? "",
        "cond_pier_crack_remarks": gibridge.piercrackremarks ?? "",
        "cond_pier_spall_status": gibridge.pierspallstatus ?? "",
        // NOTE: You may want to add cond_pier_spall_bound here if required by backend
        "cond_pier_spall_remarks": gibridge.pierspallremarks ?? "",
        "cond_pier_others_status": gibridge.pierothersstatus ?? "",
        "cond_pier_others_bound": gibridge.pierothersbound ?? "",
        "cond_pier_others_remarks": gibridge.pierothersremarks ?? "",

        "cond_slopeprotection_damage_status": gibridge.slopeprotectiondamagestatus ?? "",
        "cond_slopeprotection_damage_bound": gibridge.remarksBeaslopeprotectiondamageboundmcrack ?? "",
        "cond_slopeprotection_damage_remarks": gibridge.slopeprotectiondamageremarks ?? "",
        "cond_slopeprotection_scouring_status": gibridge.slopeprotectionscouringstatus ?? "",
        "cond_slopeprotection_scouring_bound": gibridge.slopeprotectionscouringbound ?? "",
        "cond_slopeprotection_scouring_remarks": gibridge.slopeprotectionscouringremarks ?? "",
        "cond_slopeprotection_erosion_bound": gibridge.slopeprotectionerosionbound ?? "",
        "cond_slopeprotection_erosion_status": gibridge.slopeprotectionerosionstatus ?? "",
        "cond_slopeprotection_erosion_remarks": gibridge.slopeprotectionerosionremarks ?? "",
        "cond_slopeprotection_vege_status": gibridge.slopeprotectionvegestatus ?? "",
        "cond_slopeprotection_vege_bound": gibridge.slopeprotectionvegebound ?? "",
        "cond_slopeprotection_vege_remarks": gibridge.slopeprotectionvegeremarks ?? "",
        "cond_slopeprotection_silt_status": gibridge.slopeprotectionsiltstatus ?? "",
        "cond_slopeprotection_silt_bound": gibridge.slopeprotectionsiltbound ?? "",
        "cond_slopeprotection_silt_remarks": gibridge.slopeprotectionsiltremarks ?? "",
        "cond_slopeprotection_others": gibridge.slopeprotectionothers ?? "",
        "cond_slopeprotection_others_status": gibridge.slopeprotectionothersstatus ?? "",
        "cond_slopeprotection_others_remarks": gibridge.slopeprotectionothersremarks ?? "",

        "cond_bearing_deform_status": gibridge.bearingdeformstatus ?? "",
        "cond_bearing_deform_bound": gibridge.bearingdeformbound ?? "",
        "cond_bearing_deform_remarks": gibridge.bearingdeformremarks ?? "",
        "cond_bearing_debris_status": gibridge.bearingdebrisstatus ?? "",
        "cond_bearing_debris_bound": gibridge.bearingdebrisbound ?? "",
        "cond_bearing_debris_remarks": gibridge.bearingdebrisremarks ?? "",
        "cond_bearing_seating_status": gibridge.bearingseatingstatus ?? "",
        "cond_bearing_seating_bound": gibridge.bearingseatingbound ?? "",
        "cond_bearing_seating_remarks": gibridge.bearingseatingremarks ?? "",
        "cond_bearing_plinth_status": gibridge.bearingplinthstatus ?? "",
        "cond_bearing_plinth_bound": gibridge.bearingplinthbound ?? "",
        "cond_bearing_plinth_remarks": gibridge.bearingplinthremarks ?? "",
        "cond_bearing_others": gibridge.bearingothers ?? "",
        "cond_bearing_others_status": gibridge.bearingothersstatus ?? "",
        "cond_bearing_others_bound": gibridge.bearingothersbound ?? "",
        "cond_bearing_others_remarks": gibridge.bearingothersremarks ?? "",

        "cond_otherselem1_description": gibridge.otherselem1description ?? "",
        "cond_otherselem1_status": gibridge.otherselem1status ?? "",
        "cond_otherselem1_bound": gibridge.otherselem1bound ?? "",
        "cond_otherselem1_remarks": gibridge.otherselem1remarks ?? "",
        "cond_otherselem2_description": gibridge.otherselem2description ?? "",
        "cond_otherselem2_status": gibridge.otherselem2status ?? "",
        "cond_otherselem2_bound": gibridge.otherselem2bound ?? "",
        "cond_otherselem2_remarks": gibridge.otherselem2remarks ?? "",

        "cond_routinedefect1": gibridge.routinedefect1 ?? "",
        "cond_otherdefect1": gibridge.otherdefect1 ?? "",
        "cond_routinedefect2": gibridge.routinedefect2 ?? "",
        "cond_routinedefect3": gibridge.routinedefect3 ?? "",
        "cond_routinedefect4": gibridge.routinedefect4 ?? "",
        "cond_otherdefect2": gibridge.otherdefect2 ?? "",
        "cond_otherdefect3": gibridge.otherdefect3 ?? "",
        "cond_otherdefect4": gibridge.otherdefect4 ?? "",
      },
    );

    debugPrint("API response: ${response.statusCode} ${response.data}");

    if (response.statusCode == 200) {
      await NotificationService.showNotification(
        title: "Success",
        body: "Successfully sent to Principal. Form for ${gibridge.id ?? ""} has been sent for approval.",
      );

      return AlertDialog(
        title: const Text("Success"),
        content: Text(
          "Form for ${gibridge.id ?? ""} has been sent for approval on ${DateTime.now()}",
        ),
      );
    } else {
      await NotificationService.showNotification(
        title: "FAIL",
        body: "ERROR OCCURRED",
      );

      return const AlertDialog(
        title: Text("Failed"),
        content: Text("Please check the connection and try again."),
      );
    }
  }
}
