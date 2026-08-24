// File: lib/models/sendmodel.dart
// import 'package:bridgeinsp_new/models/brpost_model.dart'; // Import the updated brpostmodel
// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'dart:convert';

// SharedPref helper with proper async support

class SendInfo {
  final String id;
  final String? surfacebridgeblockagestatus;
  final String? surfacebridgeblockagebound;
  final String? surfacebridgeblockageremarks;
  final String? surfacebridgepondingstatus;
  final String? surfacebridgepondingbound;
  final String? surfacebridgepondingremarks;
  final String? surfacebridgeothers;
  final String? surfacebridgeothersstatus;
  final String? surfacebridgeothersbound;
  final String? surfacebridgeothersremarks;
  final String? parapetimpactstatus;
  final String? parapetimpactbound;
  final String? parapetimpactremarks;
  final String? parapetcorrosionstatus;
  final String? parapetcorrosionbound;
  final String? parapetcorrosionremarks;
  final String? parapetcrackstatus;
  final String? parapetcrackbound;
  final String? parapetcrackremarks;
  final String? parapetspallstatus;
  final String? parapetspallbound;
  final String? parapetspallremarks;
  final String? parapetothers;
  final String? parapetothersstatus;
  final String? parapetothersbound;
  final String? parapetothersremarks;
  final String? jointdescription;
  final String? jointstatus;
  final String? jointbound;
  final String? jointremarks;
  final String? jointfixitystatus;
  final String? jointfixitybound;
  final String? jointfixityremarks;
  final String? jointleakagestatus;
  final String? jointleakagebound;
  final String? jointleakageremarks;
  final String? jointothers;
  final String? jointothersstatus;
  final String? jointothersbound;
  final String? jointothersremarks;
  final String? abutmentapproachpavementstatus;
  final String? abutmentapproachpavementbound;
  final String? abutmentapproachpavementremarks;
  final String? abutmentapproachothers;
  final String? abutmentapproachothersstatus;
  final String? abutmentapproachothersbound;
  final String? abutmentapproachothersremarks;
  final String? beamcorrosionstatus;
  final String? beamcorrosionbound;
  final String? beamcorrosionremarks;
  final String? beamcrackstatus;
  final String? beamcrackbound;
  final String? beamcrackremarks;
  final String? beamspallingstatus;
  final String? beamspallingbound;
  final String? beamspallingremarks;
  final String? beamothers;
  final String? beamothersstatus;
  final String? beamothersbound;
  final String? beamothersremarks;
  final String? decksoffitcrackstatus;
  final String? decksoffitcrackbound;
  final String? decksoffitcrackremarks;
  final String? decksoffitspallstatus;
  final String? decksoffitspallbound;
  final String? decksoffitspallremarks;
  final String? decksoffitothers;
  final String? decksoffitothersstatus;
  final String? conditiodecksoffitothersboundnPierCrack;
  final String? decksoffitothersremarks;
  final String? abutmentwingwallmovementstatus;
  final String? abutmentwingwallmovementbound;
  final String? abutmentwingwallmovementremarks;
  final String? abutmentwingwallcrackstatus;
  final String? abutmentwingwallcrackbound;
  final String? abutmentwingwallcrackremarks;
  final String? abutmentwingwallspallstatus;
  final String? abutmentwingwallspallbound;
  final String? abutmentwingwallspallremarks;
  final String? abutmentwingwallothers;
  final String? abutmentwingwallothersstatus;
  final String? abutmentwingwallothersbound;
  final String? abutmentwingwallothersremarks;
  final String? piermovementstatus;
  final String? piermovementbound;
  final String? piermovementremarks;
  final String? pierscourstatus;
  final String? pierscourbound;
  final String? pierscourremarks;
  final String? pierdebrisstatus;
  final String? pierdebrisbound;
  final String? pierdebrisremarks;
  final String? piercrackstatus;
  final String? piercrackbound;
  final String? piercrackremarks;
  final String? pierspallstatus;
  final String? pierspallbound;
  final String? pierspallremarks;
  final String? pierothers;
  final String? pierothersstatus;
  final String? pierothersbound;
  final String? pierothersremarks;
  final String? slopeprotectiondamagestatus;
  final String? remarksBeaslopeprotectiondamageboundmcrack;
  final String? slopeprotectiondamageremarks;
  final String? slopeprotectionscouringstatus;
  final String? slopeprotectionscouringbound;
  final String? slopeprotectionscouringremarks;
  final String? slopeprotectionerosionbound;
  final String? slopeprotectionerosionremarks;
  final String? slopeprotectionvegestatus;
  final String? slopeprotectionvegebound;
  final String? slopeprotectionvegeremarks;
  final String? slopeprotectionsiltstatus;
  final String? slopeprotectionsiltbound;
  final String? slopeprotectionsiltremarks;
  final String? slopeprotectionothers;
  final String? slopeprotectionothersstatus;
  final String? slopeprotectionothersbound;
  final String? slopeprotectionothersremarks;
  final String? bearingdeformstatus;
  final String? bearingdeformbound;
  final String? bearingdeformremarks;
  final String? bearingdebrisstatus;
  final String? bearingdebrisbound;
  final String? bearingdebrisremarks;
  final String? bearingseatingstatus;
  final String? bearingseatingbound;
  final String? bearingseatingremarks;
  final String? bearingplinthstatus;
  final String? bearingplinthbound;
  final String? bearingplinthremarks;
  final String? bearingothers;
  final String? bearingothersstatus;
  final String? bearingothersbound;
  final String? bearingothersremarks;
  final String? otherselem1description;
  final String? otherselem1status;
  final String? otherselem1bound;
  final String? otherselem1remarks;
  final String? otherselem2description;
  final String? otherselem2status;
  final String? otherselem2bound;
  final String? otherselem2remarks;
  final String? routinedefect1;
  final String? otherdefect1;
  final String? routinedefect2;
  final String? routinedefect3;
  final String? routinedefect4;
  final String? otherdefect2;
  final String? otherdefect3;
  final String? otherdefect4;
  final String? slopeprotectionerosionstatus;
  final DateTime? dateofinspection;
  final String? inspectedby;
  final String? maintainedby;
  final String? dateoflastinspection;
  final List<String>? images; 
  final List<String>? images2;
  final List<String>? images3;
  final List<String>? images4;   // Add field for base64 encoded images

  SendInfo({
    required this.id,
    this.surfacebridgeblockagestatus,
    this.surfacebridgeblockagebound,
    this.surfacebridgeblockageremarks,
    this.surfacebridgepondingstatus,
    this.surfacebridgepondingbound,
    this.surfacebridgepondingremarks,
    this.surfacebridgeothers,
    this.surfacebridgeothersstatus,
    this.surfacebridgeothersbound,
    this.surfacebridgeothersremarks,
    this.parapetimpactstatus,
    this.parapetimpactbound,
    this.parapetimpactremarks,
    this.parapetcorrosionstatus,
    this.parapetcorrosionbound,
    this.parapetcorrosionremarks,
    this.parapetcrackstatus,
    this.parapetcrackbound,
    this.parapetcrackremarks,
    this.parapetspallstatus,
    this.parapetspallbound,
    this.parapetspallremarks,
    this.parapetothers,
    this.parapetothersstatus,
    this.parapetothersbound,
    this.parapetothersremarks,
    this.jointdescription,
    this.jointstatus,
    this.jointbound,
    this.jointremarks,
    this.jointfixitystatus,
    this.jointfixitybound,
    this.jointfixityremarks,
    this.jointleakagestatus,
    this.jointleakagebound,
    this.jointleakageremarks,
    this.jointothers,
    this.jointothersstatus,
    this.jointothersbound,
    this.jointothersremarks,
    this.abutmentapproachpavementstatus,
    this.abutmentapproachpavementbound,
    this.abutmentapproachpavementremarks,
    this.abutmentapproachothers,
    this.abutmentapproachothersstatus,
    this.abutmentapproachothersbound,
    this.abutmentapproachothersremarks,
    this.beamcorrosionstatus,
    this.beamcorrosionbound,
    this.beamcorrosionremarks,
    this.beamcrackstatus,
    this.beamcrackbound,
    this.beamcrackremarks,
    this.beamspallingstatus,
    this.beamspallingbound,
    this.beamspallingremarks,
    this.beamothers,
    this.beamothersstatus,
    this.beamothersbound,
    this.beamothersremarks,
    this.decksoffitcrackstatus,
    this.decksoffitcrackbound,
    this.decksoffitcrackremarks,
    this.decksoffitspallstatus,
    this.decksoffitspallbound,
    this.decksoffitspallremarks,
    this.decksoffitothers,
    this.decksoffitothersstatus,
    this.conditiodecksoffitothersboundnPierCrack,
    this.decksoffitothersremarks,
    this.abutmentwingwallmovementstatus,
    this.abutmentwingwallmovementbound,
    this.abutmentwingwallmovementremarks,
    this.abutmentwingwallcrackstatus,
    this.abutmentwingwallcrackbound,
    this.abutmentwingwallcrackremarks,
    this.abutmentwingwallspallstatus,
    this.abutmentwingwallspallbound,
    this.abutmentwingwallspallremarks,
    this.abutmentwingwallothers,
    this.abutmentwingwallothersstatus,
    this.abutmentwingwallothersbound,
    this.abutmentwingwallothersremarks,
    this.piermovementstatus,
    this.piermovementbound,
    this.piermovementremarks,
    this.pierscourstatus,
    this.pierscourbound,
    this.pierscourremarks,
    this.pierdebrisstatus,
    this.pierdebrisbound,
    this.pierdebrisremarks,
    this.piercrackstatus,
    this.piercrackbound,
    this.piercrackremarks,
    this.pierspallstatus,
    this.pierspallbound,
    this.pierspallremarks,
    this.pierothers,
    this.pierothersstatus,
    this.pierothersbound,
    this.pierothersremarks,
    this.slopeprotectiondamagestatus,
    this.remarksBeaslopeprotectiondamageboundmcrack,
    this.slopeprotectiondamageremarks,
    this.slopeprotectionscouringstatus,
    this.slopeprotectionscouringbound,
    this.slopeprotectionscouringremarks,
    this.slopeprotectionerosionbound,
    this.slopeprotectionerosionremarks,
    this.slopeprotectionvegestatus,
    this.slopeprotectionvegebound,
    this.slopeprotectionvegeremarks,
    this.slopeprotectionsiltstatus,
    this.slopeprotectionsiltbound,
    this.slopeprotectionsiltremarks,
    this.slopeprotectionothers,
    this.slopeprotectionothersstatus,
    this.slopeprotectionothersbound,
    this.slopeprotectionothersremarks,
    this.bearingdeformstatus,
    this.bearingdeformbound,
    this.bearingdeformremarks,
    this.bearingdebrisstatus,
    this.bearingdebrisbound,
    this.bearingdebrisremarks,
    this.bearingseatingstatus,
    this.bearingseatingbound,
    this.bearingseatingremarks,
    this.bearingplinthstatus,
    this.bearingplinthbound,
    this.bearingplinthremarks,
    this.bearingothers,
    this.bearingothersstatus,
    this.bearingothersbound,
    this.bearingothersremarks,
    this.otherselem1description,
    this.otherselem1status,
    this.otherselem1bound,
    this.otherselem1remarks,
    this.otherselem2description,
    this.otherselem2status,
    this.otherselem2bound,
    this.otherselem2remarks,
    this.routinedefect1,
    this.otherdefect1,
    this.routinedefect2,
    this.routinedefect3,
    this.routinedefect4,
    this.otherdefect2,
    this.otherdefect3,
    this.otherdefect4,
    this.slopeprotectionerosionstatus,
    this.dateofinspection,
    this.inspectedby,
    this.maintainedby,
    this.dateoflastinspection,
    this.images,
    this.images2,
    this.images3,
    this.images4,
     // Add images field
  });
}