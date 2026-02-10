import 'dart:convert';

import 'package:flutter/gestures.dart';

class BrPostModel {
  final String id;

  // ===== Bridge Surface =====
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

  // ===== Parapet =====
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

  // ===== Joint =====
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

  // ===== abutment =====sini
  final String? abutmentapproachpavementstatus;
  final String? abutmentapproachpavementbound;
  final String? abutmentapproachpavementremarks;
  final String? abutmentapproachothers;
  final String? abutmentapproachothersstatus;
  final String? abutmentapproachothersbound;
  final String? abutmentapproachothersremarks;

  // ===== beam =====
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
  
  // ==== Deck soft =====\
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

  // ==== abutmentwingwall =====
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

  // ==== pier  ====
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

  // ==== slope protection =====
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
  
  // ==== bearing ====
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
  
  // ==== others ====
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
  final String? slopeprotectionerosionstatus;
  final String? otherdefect2;
  final String? otherdefect3;
  final String? otherdefect4;


  // ===== Meta =====
  final DateTime dateofinsp;
  final String inspectedby;
  final String maintainedby;

  // ===== Images =====
  final List<String>? images;
  final List<String>? images2;
  final List<String>? images3;
  final List<String>? images4;

  const BrPostModel({
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
    this.slopeprotectionerosionstatus,
    this.otherdefect2,
    this.otherdefect3,
    this.otherdefect4,

    required this.dateofinsp,
    required this.inspectedby,
    required this.maintainedby,

    this.images,
    this.images2,
    this.images3,
    this.images4,
  });

  // ===== Helper =====
  static String? _s(dynamic v) => v?.toString();

  // ===== Form → Model =====
  factory BrPostModel.fromFormValues({
    required String id,
    DateTime? dateofinsp,
    String? inspectedby,
    String? maintainedby,

    dynamic surfacebridgeblockagestatus,
    dynamic surfacebridgeblockagebound,
    dynamic surfacebridgeblockageremarks,
    dynamic surfacebridgepondingstatus,
    dynamic surfacebridgepondingbound,
    dynamic surfacebridgepondingremarks,
    dynamic surfacebridgeothers,
    dynamic surfacebridgeothersstatus,
    dynamic surfacebridgeothersbound,
    dynamic surfacebridgeothersremarks,
    dynamic parapetimpactstatus,
    dynamic parapetimpactbound,
    dynamic parapetimpactremarks,
    dynamic parapetcorrosionstatus,
    dynamic parapetcorrosionbound,
    dynamic parapetcorrosionremarks,
    dynamic parapetcrackstatus,
    dynamic parapetcrackbound,
    dynamic parapetcrackremarks,
    dynamic parapetspallstatus,
    dynamic parapetspallbound,
    dynamic parapetspallremarks,
    dynamic parapetothers,
    dynamic parapetothersstatus,
    dynamic parapetothersbound,
    dynamic parapetothersremarks,
    dynamic jointdescription,
    dynamic jointstatus,
    dynamic jointbound,
    dynamic jointremarks,
    dynamic jointfixitystatus,
    dynamic jointfixitybound,
    dynamic jointfixityremarks,
    dynamic jointleakagestatus,
    dynamic jointleakagebound,
    dynamic jointleakageremarks,
    dynamic jointothers,
    dynamic jointothersstatus,
    dynamic jointothersbound,
    dynamic jointothersremarks,
    dynamic abutmentapproachpavementstatus,
    dynamic abutmentapproachpavementbound,
    dynamic abutmentapproachpavementremarks,
    dynamic abutmentapproachothers,
    dynamic abutmentapproachothersstatus,
    dynamic abutmentapproachothersbound,
    dynamic abutmentapproachothersremarks,
    dynamic beamcorrosionstatus,
    dynamic beamcorrosionbound,
    dynamic beamcorrosionremarks,
    dynamic beamcrackstatus,
    dynamic beamcrackbound,
    dynamic beamcrackremarks,
    dynamic beamspallingstatus,
    dynamic beamspallingbound,
    dynamic beamspallingremarks,
    dynamic beamothers,
    dynamic beamothersstatus,
    dynamic beamothersbound,
    dynamic beamothersremarks,
    dynamic decksoffitcrackstatus,
    dynamic decksoffitcrackbound,
    dynamic decksoffitcrackremarks,
    dynamic decksoffitspallstatus,
    dynamic decksoffitspallbound,
    dynamic decksoffitspallremarks,
    dynamic decksoffitothers,
    dynamic decksoffitothersstatus,
    dynamic conditiodecksoffitothersboundnPierCrack,
    dynamic decksoffitothersremarks,
    dynamic abutmentwingwallmovementstatus,
    dynamic abutmentwingwallmovementbound,
    dynamic abutmentwingwallmovementremarks,
    dynamic abutmentwingwallcrackstatus,
    dynamic abutmentwingwallcrackbound,
    dynamic abutmentwingwallcrackremarks,
    dynamic abutmentwingwallspallstatus,
    dynamic abutmentwingwallspallbound,
    dynamic abutmentwingwallspallremarks,
    dynamic abutmentwingwallothers,
    dynamic abutmentwingwallothersstatus,
    dynamic abutmentwingwallothersbound,
    dynamic slopeprotectionerosionstatus,
    dynamic piermovementstatus,
    dynamic piermovementbound,
    dynamic piermovementremarks,
    dynamic pierscourstatus,
    dynamic pierscourbound,
    dynamic pierscourremarks,
    dynamic pierdebrisstatus,
    dynamic pierdebrisbound,
    dynamic pierdebrisremarks,
    dynamic piercrackstatus,
    dynamic piercrackbound,
    dynamic piercrackremarks,
    dynamic pierspallstatus,
    dynamic pierspallbound,
    dynamic pierspallremarks,
    dynamic pierothers,
    dynamic pierothersstatus,
    dynamic pierothersbound,
    dynamic pierothersremarks,
    dynamic slopeprotectiondamagestatus,
    dynamic remarksBeaslopeprotectiondamageboundmcrack,
    dynamic slopeprotectiondamageremarks,
    dynamic slopeprotectionscouringstatus,
    dynamic slopeprotectionscouringbound,
    dynamic slopeprotectionscouringremarks,
    dynamic slopeprotectionerosionbound,
    dynamic slopeprotectionerosionremarks,
    dynamic slopeprotectionvegestatus,
    dynamic slopeprotectionvegebound,
    dynamic slopeprotectionvegeremarks,
    dynamic slopeprotectionsiltstatus,
    dynamic slopeprotectionsiltbound,
    dynamic slopeprotectionsiltremarks,
    dynamic slopeprotectionothers,
    dynamic slopeprotectionothersstatus,
    dynamic slopeprotectionothersbound,
    dynamic slopeprotectionothersremarks,
    dynamic bearingdeformstatus,
    dynamic bearingdeformbound,
    dynamic bearingdeformremarks,
    dynamic bearingdebrisstatus,
    dynamic bearingdebrisbound,
    dynamic bearingdebrisremarks,
    dynamic bearingseatingstatus,
    dynamic bearingseatingbound,
    dynamic bearingseatingremarks,
    dynamic bearingplinthstatus,
    dynamic bearingplinthbound,
    dynamic bearingplinthremarks,
    dynamic bearingothers,
    dynamic bearingothersstatus,
    dynamic bearingothersbound,
    dynamic bearingothersremarks,
    dynamic otherselem1description,
    dynamic otherselem1status,
    dynamic otherselem1bound,
    dynamic otherselem1remarks,
    dynamic otherselem2description,
    dynamic otherselem2status,
    dynamic otherselem2bound,
    dynamic otherselem2remarks,
    dynamic routinedefect1,
    dynamic otherdefect1,
    dynamic routinedefect2,
    dynamic routinedefect3,
    dynamic routinedefect4,
    dynamic otherdefect2,
    dynamic otherdefect4,

    List<String>? images,
    List<String>? images2,
    List<String>? images3,
    List<String>? images4,
  }) {
    return BrPostModel(
      id: id,
      surfacebridgeblockagestatus: _s(surfacebridgeblockagestatus),
      surfacebridgeblockagebound: _s(surfacebridgeblockagebound),
      surfacebridgeblockageremarks: _s(surfacebridgeblockageremarks),

      dateofinsp: dateofinsp ?? DateTime.now(),
      inspectedby: inspectedby ?? 'MobileUser',
      maintainedby: maintainedby ?? 'PLUS',

      images: images,
      images2: images2,
      images3: images3,
      images4: images4,
    );
  }

  // ===== JSON =====
  factory BrPostModel.fromJson(Map<String, dynamic> json) {
    return BrPostModel(
      id: json['id'],
      surfacebridgeblockagestatus: json['cond_blockage_status'],
      surfacebridgeblockagebound: json['cond_blockage_bound'],
      surfacebridgeblockageremarks: json['cond_blockage_remarks'],
      surfacebridgepondingstatus : json['cond_ponding_status'],
      surfacebridgepondingbound : json['cond_ponding_bound'],
      surfacebridgepondingremarks : json['cond_ponding_remarks'],
      surfacebridgeothers : json['cond_surfacebridge_others'],
      surfacebridgeothersstatus : json['cond_surfacebridge_Status'],
      surfacebridgeothersbound : json['cond_others_bound'],
      surfacebridgeothersremarks : json['cond_others_remarks'],
      parapetimpactstatus : json['cond_impact_status'],
      parapetimpactbound : json['cond_impact_bound'],
      parapetimpactremarks : json['cond_impact_remarks'],
      parapetcorrosionstatus : json['cond_corrosion_status'],
      parapetcorrosionbound : json['cond_corrosion_bound'],
      parapetcorrosionremarks : json['remarkscorrosion'],
      parapetcrackstatus : json['cond_crack_status'],
      parapetcrackbound : json['cond_crack_bound'],
      parapetcrackremarks : json['remarkscrack'],
      parapetspallstatus : json['cond_spall_status'],
      parapetspallbound : json['cond_spall_bound'],
      parapetspallremarks : json['remarksspalling'],
      parapetothers : json['cond_parapet_others'],
      parapetothersstatus : json['cond_parapet_others_status'],
      parapetothersbound : json['cond_parapet_others_bound'],
      parapetothersremarks : json['cond_parapet_remarks'],
      jointdescription : json['joint_description'],
      jointstatus : json['cond_joint_status'],
      jointbound : json['cond_joint_bound'],
      jointremarks : json['cond_joint_remarks'],
      jointfixitystatus : json['cond_fixity_status'],
      jointfixitybound : json['cond_fixity_bound'],
      jointfixityremarks : json['remarksFixity'],
      jointleakagestatus : json['cond_leakage_status'],
      jointleakagebound : json['cond_leakage_bound'],
      jointleakageremarks : json['remarksWaterLeakage'],
      jointothers : json['joint_others'],
      jointothersstatus : json['cond_joint_others_status'],
      jointothersbound : json['cond_joint_others_bound'],
      jointothersremarks : json['remarksjointOthers'],
      abutmentapproachpavementstatus : json['cond_pavement_status'],
      abutmentapproachpavementbound : json['cond_pavement_bound'],
      abutmentapproachpavementremarks : json['cond_pavement_remarks'],
      abutmentapproachothers : json['cond_abutmentapproach_others'],
      abutmentapproachothersstatus : json['cond_abutmentapproach_others_status'],
      abutmentapproachothersbound : json['cond_abutmentapproach_others_bound'],
      abutmentapproachothersremarks : json['abutmentapproach_others_remarks'],
      beamcorrosionstatus : json['cond_beam_corrosion_status'],
      beamcorrosionbound : json['cond_beam_corrosion_bound'],
      beamcorrosionremarks : json['cond_beam_corrosion_remarks'],
      beamcrackstatus : json['cond_beam_crack_status'],
      beamcrackbound : json['cond_beam_crack_bound'],
      beamcrackremarks : json['cond_beam_crack_remarks'],
      beamspallingstatus : json['cond_beam_spalling_status'],
      beamspallingbound : json['cond_beam_spalling_bound'],
      beamspallingremarks : json['cond_beam_spalling_remarks'],
      beamothers : json['cond_beam_others'],
      beamothersstatus : json['cond_beam_others_status'],
      beamothersbound : json['cond_beam_others_bound'],
      beamothersremarks : json['cond_beam_others_remarks'],
      decksoffitcrackstatus : json['cond_decksoffit_crack_status'],
      decksoffitcrackbound : json['cond_decksoffit_crack_bound'],
      decksoffitcrackremarks : json['cond_decksoffit_crack_remarks'],
      decksoffitspallstatus : json['cond_decksoffit_spall_status'],
      decksoffitspallbound : json['cond_decksoffit_spall_bound'],
      decksoffitspallremarks : json['cond_decksoffit_spall_remarks'],
      decksoffitothers : json['cond_decksoffit_others'],
      decksoffitothersstatus : json['cond_decksoffit_others_status'],
      conditiodecksoffitothersboundnPierCrack : json['cond_decksoffit_others_bound'],
      decksoffitothersremarks : json['cond_decksoffit_others_remarks'],
      abutmentwingwallmovementstatus : json['cond_abutmentwingwall_movement_status'],
      abutmentwingwallmovementbound : json['cond_abutmentwingwall_movement_bound'],
      abutmentwingwallmovementremarks : json['cond_abutmentwingwall_movement_remarks'],
      abutmentwingwallcrackstatus : json['cond_abutmentwingwall_crack_status'],
      abutmentwingwallcrackbound : json['cond_abutmentwingwall_crack_bound'],
      abutmentwingwallcrackremarks : json['cond_abutmentwingwall_crack_remarks'],
      abutmentwingwallspallstatus : json['cond_abutmentwingwall_spall_status'],
      abutmentwingwallspallbound : json['cond_abutmentwingwall_spall_bound'],
      abutmentwingwallspallremarks : json['cond_abutmentwingwall_spall_remarks'],
      abutmentwingwallothers : json['cond_abutmentwingwall_others'],
      abutmentwingwallothersstatus : json['cond_abutmentwingwall_others_status'],
      abutmentwingwallothersbound : json['cond_abutmentwingwall_others_bound'],
      abutmentwingwallothersremarks : json['cond_abutmentwingwall_others_remarks'],
      piermovementstatus : json['cond_pier_movement_status'],
      piermovementbound : json['cond_pier_movement_bound'],
      piermovementremarks : json['cond_pier_movement_remarks'],
      pierscourstatus : json['cond_pier_scour_status'],
      pierscourbound : json['cond_pier_scour_bound'],
      pierscourremarks : json['cond_pier_scour_remarks'],
      pierdebrisstatus : json['cond_pier_debris_status'],
      pierdebrisbound : json['cond_pier_debris_bound'],
      pierdebrisremarks : json['cond_pier_debris_remarks'],
      piercrackstatus : json['cond_pier_crack_status'],
      piercrackbound : json['cond_pier_crack_bound'],
      piercrackremarks : json['cond_pier_crack_remarks'],
      pierspallstatus : json['cond_pier_spall_status'],
      pierspallbound : json['cond_pier_spall_bound'],
      pierspallremarks : json['cond_pier_spall_remarks'],
      pierothers : json['cond_pier_others'],
      pierothersstatus : json['cond_pier_others_status'],
      pierothersbound : json['cond_pier_others_bound'],
      pierothersremarks : json['cond_pier_others_remarks'],
      slopeprotectiondamagestatus : json['cond_slopeprotection_damage_status'],
      remarksBeaslopeprotectiondamageboundmcrack : json['cond_slopeprotection_damage_bound'],
      slopeprotectiondamageremarks : json['cond_slopeprotection_damage_remarks'],
      slopeprotectionscouringstatus : json['cond_slopeprotection_scouring_status'],
      slopeprotectionscouringbound : json['cond_slopeprotection_scouring_bound'],
      slopeprotectionscouringremarks : json['cond_slopeprotection_scouring_remarks'],
      slopeprotectionerosionstatus : json['cond_slopeprotection_erosion_status'],
      slopeprotectionerosionbound : json['cond_slopeprotection_erosion_bound'],
      slopeprotectionerosionremarks : json['cond_slopeprotection_erosion_remarks'],
      slopeprotectionvegestatus : json['cond_slopeprotection_vege_status'],
      slopeprotectionvegebound : json['cond_slopeprotection_vege_bound'],
      slopeprotectionvegeremarks : json['cond_slopeprotection_vege_remarks'],
      slopeprotectionsiltstatus : json['cond_slopeprotection_silt_status'],
      slopeprotectionsiltbound : json['cond_slopeprotection_silt_bound'],
      slopeprotectionsiltremarks : json['cond_slopeprotection_silt_remarks'],
      slopeprotectionothers : json['cond_slopeprotection_others'],
      slopeprotectionothersstatus : json['cond_slopeprotection_others_status'],
      slopeprotectionothersbound : json['cond_slopeprotection_others_bound'],
      slopeprotectionothersremarks : json['cond_slopeprotection_others_remarks'],
      bearingdeformstatus : json['cond_bearing_deform_status'],
      bearingdeformbound : json['cond_bearing_deform_bound'],
      bearingdeformremarks : json['cond_bearing_deform_remarks'],
      bearingdebrisstatus : json['cond_bearing_debris_status'],
      bearingdebrisbound : json['cond_bearing_debris_bound'],
      bearingdebrisremarks : json['cond_bearing_debris_remarks'],
      bearingseatingstatus : json['cond_bearing_seating_status'],
      bearingseatingbound : json['cond_bearing_seating_bound'],
      bearingseatingremarks : json['cond_bearing_seating_remarks'],
      bearingplinthstatus : json['cond_bearing_plinth_status'],
      bearingplinthbound : json['cond_bearing_plinth_bound'],
      bearingplinthremarks : json['cond_bearing_plinth_remarks'],
      bearingothers : json['cond_bearing_others'],
      bearingothersstatus : json['cond_bearing_others_status'],
      bearingothersbound : json['cond_bearing_others_bound'],
      bearingothersremarks : json['cond_bearing_others_remarks'],
      otherselem1description : json['cond_otherselem1_description'],
      otherselem1status : json['cond_otherselem1_status'],
      otherselem1bound : json['cond_otherselem1_bound'],
      otherselem1remarks : json['cond_otherselem1_remarks'],
      otherselem2description : json['cond_otherselem2_description'],
      otherselem2status : json['cond_otherselem2_status'],
      otherselem2bound : json['cond_otherselem2_bound'],
      otherselem2remarks : json['cond_otherselem2_remarks'],
      routinedefect1 : json['cond_routinedefect1'],
      otherdefect1 : json['cond_otherdefect1'],
      routinedefect2 : json['cond_routinedefect2'],
      routinedefect3 : json['cond_routinedefect3'],
      routinedefect4 : json['cond_routinedefect4'],
      otherdefect2 : json['cond_otherdefect2'],
      otherdefect3 : json['cond_otherdefect3'],
      otherdefect4 : json['cond_otherdefect4'],
      dateofinsp: DateTime.parse(json['dateofinsp']),
      inspectedby: json['inspectedby'],
      maintainedby: json['maintainedby'],
      images: (json['images'] as List?)?.map((e) => e.toString()).toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'cond_blockage_status': surfacebridgeblockagestatus,
        'cond_blockage_bound': surfacebridgeblockagebound,
        'cond_blockage_remarks': surfacebridgeblockageremarks,
        'cond_ponding_status' : surfacebridgepondingstatus,
        'cond_ponding_bound' : surfacebridgepondingbound,
        'cond_ponding_remarks' : surfacebridgepondingremarks,
        'cond_surfacebridge_others' : surfacebridgeothers,
        'cond_surfacebridge_Status' : surfacebridgeothersstatus,
        'cond_others_bound' : surfacebridgeothersbound,
        'cond_others_remarks' : surfacebridgeothersremarks,
        'cond_impact_status' : parapetimpactstatus,
        'cond_impact_bound' : parapetimpactbound,
        'cond_impact_remarks' : parapetimpactremarks,
        'cond_corrosion_status' : parapetcorrosionstatus,
        'cond_corrosion_bound' : parapetcorrosionbound,
        'remarkscorrosion' : parapetcorrosionremarks,
        'cond_crack_status' : parapetcrackstatus,
        'cond_crack_bound' : parapetcrackbound,
        'remarkscrack' : parapetcrackremarks,
        'cond_spall_status' : parapetspallstatus,
        'cond_spall_bound' : parapetspallbound,
        'remarksspalling' : parapetspallremarks,
        'cond_parapet_others' : parapetothers,
        'cond_parapet_others_status' : parapetothersstatus,
        'cond_parapet_others_bound' : parapetothersbound,
        'cond_parapet_remarks': parapetothersremarks,
        'joint_description' : jointdescription,
        'cond_joint_status' : jointstatus,
        'cond_joint_bound' : jointbound,
        'cond_joint_remarks' : jointremarks,
        'cond_fixity_status' : jointfixitystatus,
        'cond_fixity_bound' : jointfixitybound,
        'remarksFixity' : jointfixityremarks,
        'cond_leakage_status' : jointleakagestatus,
        'cond_leakage_bound' : jointleakagebound,
        'remarksWaterLeakage' : jointleakageremarks,
        'joint_others' : jointothers,
        'cond_joint_others_status' : jointothersstatus,
        'cond_joint_others_bound' : jointothersbound,
        'remarksjointOthers' : jointothersremarks,
        'cond_pavement_status' : abutmentapproachpavementstatus,
        'cond_pavement_bound' : abutmentapproachpavementbound,
        'cond_pavement_remarks' : abutmentapproachpavementremarks,
        'cond_abutmentapproach_others' : abutmentapproachothers,
        'cond_abutmentapproach_others_status' : abutmentapproachothersstatus,
        'cond_abutmentapproach_others_bound' : abutmentapproachothersbound,
        'abutmentapproach_others_remarks' : abutmentapproachothersremarks,
        'cond_beam_corrosion_status' : beamcorrosionstatus,
        'cond_beam_corrosion_bound' : beamcorrosionbound,
        'cond_beam_corrosion_remarks' : beamcorrosionremarks,
        'cond_beam_crack_status' : beamcrackstatus,
        'cond_beam_crack_bound' : beamcrackbound,
        'cond_beam_crack_remarks': beamcrackremarks,
        'cond_beam_spalling_status' : beamspallingstatus,
        'cond_beam_spalling_bound' : beamspallingbound,
        'cond_beam_spalling_remarks' : beamspallingremarks,
        'cond_beam_others' : beamothers,
        'cond_beam_others_status' : beamothersstatus,
        'cond_beam_others_bound' : beamothersbound,
        'cond_beam_others_remarks' : beamothersremarks,
        'cond_decksoffit_crack_status' : decksoffitcrackstatus,
        'cond_decksoffit_crack_bound' : decksoffitcrackbound,
        'cond_decksoffit_crack_remarks' :decksoffitcrackremarks,
        'cond_decksoffit_spall_status' :decksoffitspallstatus,
        'cond_decksoffit_spall_bound' : decksoffitspallbound,
        'cond_decksoffit_spall_remarks' : decksoffitspallremarks,
        'cond_decksoffit_others' : decksoffitothers,
        'cond_decksoffit_others_status' : decksoffitothersstatus,
        'cond_decksoffit_others_bound' : conditiodecksoffitothersboundnPierCrack,
        'cond_decksoffit_others_remarks' : decksoffitothersremarks,
        'cond_abutmentwingwall_movement_status' : abutmentwingwallmovementstatus,
        'cond_abutmentwingwall_movement_bound' : abutmentwingwallmovementbound,
        'cond_abutmentwingwall_movement_remarks' : abutmentwingwallmovementremarks,
        'cond_abutmentwingwall_crack_status' : abutmentwingwallcrackstatus,
        'cond_abutmentwingwall_crack_bound' : abutmentwingwallcrackbound,
        'cond_abutmentwingwall_crack_remarks' : abutmentwingwallcrackremarks,
        'cond_abutmentwingwall_spall_status' : abutmentwingwallspallstatus,
        'cond_abutmentwingwall_spall_bound' : abutmentwingwallspallbound,
        'cond_abutmentwingwall_spall_remarks' : abutmentwingwallspallremarks,
        'cond_abutmentwingwall_others' : abutmentwingwallothers,
        'cond_abutmentwingwall_others_status' : abutmentwingwallothersstatus,
        'cond_abutmentwingwall_others_bound' : abutmentwingwallothersbound,
        'cond_abutmentwingwall_others_remarks' : abutmentwingwallothersremarks,
        'cond_pier_movement_status' : piermovementstatus,
        'cond_pier_movement_bound' : piermovementbound,
        'cond_pier_movement_remarks' : piermovementremarks,
        'cond_pier_scour_status' : pierscourstatus,
        'cond_pier_scour_bound' : pierscourbound,
        'cond_pier_scour_remarks' : pierscourremarks,
        'cond_pier_debris_status' : pierdebrisstatus,
        'cond_pier_debris_bound' : pierdebrisbound,
        'cond_pier_debris_remarks' : pierdebrisremarks,
        'cond_pier_crack_status' : piercrackstatus,
        'cond_pier_crack_bound' : piercrackbound,
        'cond_pier_crack_remarks' : piercrackremarks,
        'cond_pier_spall_status' : pierspallstatus,
        'cond_pier_spall_bound' : pierspallbound,
        'cond_pier_spall_remarks' : pierspallremarks,
        'cond_pier_others' : pierothers,
        'cond_pier_others_status' : pierothersstatus,
        'cond_pier_others_bound' : pierothersbound,
        'cond_pier_others_remarks' : pierothersremarks,
        'cond_slopeprotection_damage_status': slopeprotectiondamagestatus,
        'cond_slopeprotection_damage_bound' : remarksBeaslopeprotectiondamageboundmcrack,
        'cond_slopeprotection_damage_remarks' :slopeprotectiondamageremarks,
        'cond_slopeprotection_scouring_status' : slopeprotectionscouringstatus,
        'cond_slopeprotection_scouring_bound' : slopeprotectionscouringbound,
        'cond_slopeprotection_scouring_remarks': slopeprotectionscouringremarks,
        'cond_slopeprotection_erosion_status' : slopeprotectionerosionstatus,
        'cond_slopeprotection_erosion_bound' : slopeprotectionerosionbound,
        'cond_slopeprotection_erosion_remarks' : slopeprotectionerosionremarks,
        'cond_slopeprotection_vege_status' : slopeprotectionvegestatus,
        'cond_slopeprotection_vege_bound' : slopeprotectionvegebound,
        'cond_slopeprotection_vege_remarks' : slopeprotectionvegeremarks,
        'cond_slopeprotection_silt_status' : slopeprotectionsiltstatus,
        'cond_slopeprotection_silt_bound' : slopeprotectionsiltbound,
        'cond_slopeprotection_silt_remarks' : slopeprotectionsiltremarks,
        'cond_slopeprotection_others' : slopeprotectionothers,
        'cond_slopeprotection_others_status' : slopeprotectionothersstatus,
        'cond_slopeprotection_others_bound' : slopeprotectionothersbound,
        'cond_slopeprotection_others_remarks' : slopeprotectionothersremarks,
        'cond_bearing_deform_status' : bearingdeformstatus,
        'cond_bearing_deform_bound' : bearingdeformbound,
        'cond_bearing_deform_remarks' : bearingdeformremarks,
        'cond_bearing_debris_status': bearingdebrisstatus,
        'cond_bearing_debris_bound' : bearingdebrisbound,
        'cond_bearing_debris_remarks' : bearingdebrisremarks,
        'cond_bearing_seating_status' : bearingseatingstatus,
        'cond_bearing_seating_bound' : bearingseatingbound,
        'cond_bearing_seating_remarks' : bearingseatingremarks,
        'cond_bearing_plinth_status' : bearingplinthstatus,
        'cond_bearing_plinth_bound' : bearingplinthbound,
        'cond_bearing_plinth_remarks' : bearingplinthremarks,
        'cond_bearing_others' : bearingothers,
        'cond_bearing_others_status' : bearingothersstatus,
        'cond_bearing_others_bound' : bearingothersbound,
        'cond_bearing_others_remarks' : bearingothersremarks,
        'cond_otherselem1_description' : otherselem1description,
        'cond_otherselem1_status' : otherselem1status,
        'cond_otherselem1_bound' : otherselem1bound,
        'cond_otherselem1_remarks' : otherselem1remarks,
        'cond_otherselem2_description' : otherselem2description,
        'cond_otherselem2_status' : otherselem2status,
        'cond_otherselem2_bound' : otherselem2bound,
        'cond_otherselem2_remarks' : otherselem2remarks,
        'cond_routinedefect1' : routinedefect1,
        'cond_otherdefect1' : otherdefect1,
        'cond_routinedefect2' : routinedefect2,
        'cond_routinedefect3' : routinedefect3,
        'cond_routinedefect4' : routinedefect4,
        'cond_otherdefect2' :  otherdefect2,
        'cond_otherdefect3' : otherdefect3,
        'cond_otherdefect4' : otherdefect4,
        'dateofinsp': dateofinsp.toIso8601String(),
        'inspectedby': inspectedby,
        'maintainedby': maintainedby,
        'images': images,
        'images2': images2,
        'images3': images3,
        'images4': images4,
      };

  static String encode(List<BrPostModel> list) =>
      json.encode(list.map((e) => e.toJson()).toList());

  static List<BrPostModel> decode(String source) =>
      (json.decode(source) as List)
          .map((e) => BrPostModel.fromJson(e))
          .toList();
}
