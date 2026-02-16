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

  // ===== Abutment Approach =====
  final String? abutmentapproachpavementstatus;
  final String? abutmentapproachpavementbound;
  final String? abutmentapproachpavementremarks;
  final String? abutmentapproachothers;
  final String? abutmentapproachothersstatus;
  final String? abutmentapproachothersbound;
  final String? abutmentapproachothersremarks;

  // ===== Beam/Girder =====
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

  // ===== Deck Soffit =====
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

  // ===== Abutment/Wingwall =====
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

  // ===== Pier =====
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

  // ===== Slope Protection / River Bank / Waterway =====
  final String? slopeprotectiondamagestatus;
  final String? remarksBeaslopeprotectiondamageboundmcrack;
  final String? slopeprotectiondamageremarks;
  final String? slopeprotectionscouringstatus;
  final String? slopeprotectionscouringbound;
  final String? slopeprotectionscouringremarks;
  final String? slopeprotectionerosionbound;
  final String? slopeprotectionerosionstatus;
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

  // ===== Bearing =====
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

  // ===== Other Elements =====
  final String? otherselem1description;
  final String? otherselem1status;
  final String? otherselem1bound;
  final String? otherselem1remarks;
  final String? otherselem2description;
  final String? otherselem2status;
  final String? otherselem2bound;
  final String? otherselem2remarks;

  // ===== Defects =====
  final String? routinedefect1;
  final String? otherdefect1;
  final String? routinedefect2;
  final String? routinedefect3;
  final String? routinedefect4;
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

  BrPostModel({
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
    this.slopeprotectionerosionstatus,
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

    required this.dateofinsp,
    required this.inspectedby,
    required this.maintainedby,

    this.images,
    this.images2,
    this.images3,
    this.images4,
  });

  // NOTE: This helper makes decoding old saved JSON safe.
  static String? _s(dynamic v) {
    if (v == null) return null;
    if (v == 'null') return null;
    final s = v.toString();
    if (s.isEmpty) return null;
    return s;
  }

  factory BrPostModel.fromJson(Map<String, dynamic> json) {
    final DateTime safeDate = () {
      final v = json['dateofinsp'];
      if (v == null) return DateTime.now();
      return DateTime.tryParse(v.toString()) ?? DateTime.now();
    }();

    return BrPostModel(
      id: (json['id'] ?? '').toString(),

      surfacebridgeblockagestatus: _s(json['cond_blockage_status']),
      surfacebridgeblockagebound: _s(json['cond_blockage_bound']),
      surfacebridgeblockageremarks: _s(json['cond_blockage_remarks']),
      surfacebridgepondingstatus: _s(json['cond_ponding_status']),
      surfacebridgepondingbound: _s(json['cond_ponding_bound']),
      surfacebridgepondingremarks: _s(json['cond_ponding_remarks']),
      surfacebridgeothers: _s(json['cond_surfacebridge_others']),
      surfacebridgeothersstatus: _s(json['cond_surfacebridge_Status']),
      surfacebridgeothersbound: _s(json['cond_others_bound']),
      surfacebridgeothersremarks: _s(json['cond_others_remarks']),

      parapetimpactstatus: _s(json['cond_impact_status']),
      parapetimpactbound: _s(json['cond_impact_bound']),
      parapetimpactremarks: _s(json['cond_impact_remarks']),
      parapetcorrosionstatus: _s(json['cond_corrosion_status']),
      parapetcorrosionbound: _s(json['cond_corrosion_bound']),
      parapetcorrosionremarks: _s(json['remarkscorrosion']),
      parapetcrackstatus: _s(json['cond_crack_status']),
      parapetcrackbound: _s(json['cond_crack_bound']),
      parapetcrackremarks: _s(json['remarkscrack']),
      parapetspallstatus: _s(json['cond_spall_status']),
      parapetspallbound: _s(json['cond_spall_bound']),
      parapetspallremarks: _s(json['remarksspalling']),
      parapetothers: _s(json['cond_parapet_others']),
      parapetothersstatus: _s(json['cond_parapet_others_status']),
      parapetothersbound: _s(json['cond_parapet_others_bound']),
      parapetothersremarks: _s(json['cond_parapet_remarks']),

      jointdescription: _s(json['joint_description']),
      jointstatus: _s(json['cond_joint_status']),
      jointbound: _s(json['cond_joint_bound']),
      jointremarks: _s(json['cond_joint_remarks']),
      jointfixitystatus: _s(json['cond_fixity_status']),
      jointfixitybound: _s(json['cond_fixity_bound']),
      jointfixityremarks: _s(json['remarksFixity']),
      jointleakagestatus: _s(json['cond_leakage_status']),
      jointleakagebound: _s(json['cond_leakage_bound']),
      jointleakageremarks: _s(json['remarksWaterLeakage']),
      jointothers: _s(json['joint_others']),
      jointothersstatus: _s(json['cond_joint_others_status']),
      jointothersbound: _s(json['cond_joint_others_bound']),
      jointothersremarks: _s(json['remarksjointOthers']),

      abutmentapproachpavementstatus: _s(json['cond_pavement_status']),
      abutmentapproachpavementbound: _s(json['cond_pavement_bound']),
      abutmentapproachpavementremarks: _s(json['cond_pavement_remarks']),
      abutmentapproachothers: _s(json['cond_abutmentapproach_others']),
      abutmentapproachothersstatus: _s(json['cond_abutmentapproach_others_status']),
      abutmentapproachothersbound: _s(json['cond_abutmentapproach_others_bound']),
      abutmentapproachothersremarks: _s(json['abutmentapproach_others_remarks']),

      beamcorrosionstatus: _s(json['cond_beam_corrosion_status']),
      beamcorrosionbound: _s(json['cond_beam_corrosion_bound']),
      beamcorrosionremarks: _s(json['cond_beam_corrosion_remarks']),
      beamcrackstatus: _s(json['cond_beam_crack_status']),
      beamcrackbound: _s(json['cond_beam_crack_bound']),
      beamcrackremarks: _s(json['cond_beam_crack_remarks']),
      beamspallingstatus: _s(json['cond_beam_spalling_status']),
      beamspallingbound: _s(json['cond_beam_spalling_bound']),
      beamspallingremarks: _s(json['cond_beam_spalling_remarks']),
      beamothers: _s(json['cond_beam_others']),
      beamothersstatus: _s(json['cond_beam_others_status']),
      beamothersbound: _s(json['cond_beam_others_bound']),
      beamothersremarks: _s(json['cond_beam_others_remarks']),

      decksoffitcrackstatus: _s(json['cond_decksoffit_crack_status']),
      decksoffitcrackbound: _s(json['cond_decksoffit_crack_bound']),
      decksoffitcrackremarks: _s(json['cond_decksoffit_crack_remarks']),
      decksoffitspallstatus: _s(json['cond_decksoffit_spall_status']),
      decksoffitspallbound: _s(json['cond_decksoffit_spall_bound']),
      decksoffitspallremarks: _s(json['cond_decksoffit_spall_remarks']),
      decksoffitothers: _s(json['cond_decksoffit_others']),
      decksoffitothersstatus: _s(json['cond_decksoffit_others_status']),
      conditiodecksoffitothersboundnPierCrack: _s(json['cond_decksoffit_others_bound']),
      decksoffitothersremarks: _s(json['cond_decksoffit_others_remarks']),

      abutmentwingwallmovementstatus: _s(json['cond_abutmentwingwall_movement_status']),
      abutmentwingwallmovementbound: _s(json['cond_abutmentwingwall_movement_bound']),
      abutmentwingwallmovementremarks: _s(json['cond_abutmentwingwall_movement_remarks']),
      abutmentwingwallcrackstatus: _s(json['cond_abutmentwingwall_crack_status']),
      abutmentwingwallcrackbound: _s(json['cond_abutmentwingwall_crack_bound']),
      abutmentwingwallcrackremarks: _s(json['cond_abutmentwingwall_crack_remarks']),
      abutmentwingwallspallstatus: _s(json['cond_abutmentwingwall_spall_status']),
      abutmentwingwallspallbound: _s(json['cond_abutmentwingwall_spall_bound']),
      abutmentwingwallspallremarks: _s(json['cond_abutmentwingwall_spall_remarks']),
      abutmentwingwallothers: _s(json['cond_abutmentwingwall_others']),
      abutmentwingwallothersstatus: _s(json['cond_abutmentwingwall_others_status']),
      abutmentwingwallothersbound: _s(json['cond_abutmentwingwall_others_bound']),
      abutmentwingwallothersremarks: _s(json['cond_abutmentwingwall_others_remarks']),

      piermovementstatus: _s(json['cond_pier_movement_status']),
      piermovementbound: _s(json['cond_pier_movement_bound']),
      piermovementremarks: _s(json['cond_pier_movement_remarks']),
      pierscourstatus: _s(json['cond_pier_scour_status']),
      pierscourbound: _s(json['cond_pier_scour_bound']),
      pierscourremarks: _s(json['cond_pier_scour_remarks']),
      pierdebrisstatus: _s(json['cond_pier_debris_status']),
      pierdebrisbound: _s(json['cond_pier_debris_bound']),
      pierdebrisremarks: _s(json['cond_pier_debris_remarks']),
      piercrackstatus: _s(json['cond_pier_crack_status']),
      piercrackbound: _s(json['cond_pier_crack_bound']),
      piercrackremarks: _s(json['cond_pier_crack_remarks']),
      pierspallstatus: _s(json['cond_pier_spall_status']),
      pierspallbound: _s(json['cond_pier_spall_bound']),
      pierspallremarks: _s(json['cond_pier_spall_remarks']),
      pierothers: _s(json['cond_pier_others']),
      pierothersstatus: _s(json['cond_pier_others_status']),
      pierothersbound: _s(json['cond_pier_others_bound']),
      pierothersremarks: _s(json['cond_pier_others_remarks']),

      slopeprotectiondamagestatus: _s(json['cond_slopeprotection_damage_status']),
      remarksBeaslopeprotectiondamageboundmcrack: _s(json['cond_slopeprotection_damage_bound']),
      slopeprotectiondamageremarks: _s(json['cond_slopeprotection_damage_remarks']),
      slopeprotectionscouringstatus: _s(json['cond_slopeprotection_scouring_status']),
      slopeprotectionscouringbound: _s(json['cond_slopeprotection_scouring_bound']),
      slopeprotectionscouringremarks: _s(json['cond_slopeprotection_scouring_remarks']),
      slopeprotectionerosionbound: _s(json['cond_slopeprotection_erosion_bound']),
      slopeprotectionerosionstatus: _s(json['cond_slopeprotection_erosion_status']),
      slopeprotectionerosionremarks: _s(json['cond_slopeprotection_erosion_remarks']),
      slopeprotectionvegestatus: _s(json['cond_slopeprotection_vege_status']),
      slopeprotectionvegebound: _s(json['cond_slopeprotection_vege_bound']),
      slopeprotectionvegeremarks: _s(json['cond_slopeprotection_vege_remarks']),
      slopeprotectionsiltstatus: _s(json['cond_slopeprotection_silt_status']),
      slopeprotectionsiltbound: _s(json['cond_slopeprotection_silt_bound']),
      slopeprotectionsiltremarks: _s(json['cond_slopeprotection_silt_remarks']),
      slopeprotectionothers: _s(json['cond_slopeprotection_others']),
      slopeprotectionothersstatus: _s(json['cond_slopeprotection_others_status']),
      slopeprotectionothersbound: _s(json['cond_slopeprotection_others_bound']),
      slopeprotectionothersremarks: _s(json['cond_slopeprotection_others_remarks']),

      bearingdeformstatus: _s(json['cond_bearing_deform_status']),
      bearingdeformbound: _s(json['cond_bearing_deform_bound']),
      bearingdeformremarks: _s(json['cond_bearing_deform_remarks']),
      bearingdebrisstatus: _s(json['cond_bearing_debris_status']),
      bearingdebrisbound: _s(json['cond_bearing_debris_bound']),
      bearingdebrisremarks: _s(json['cond_bearing_debris_remarks']),
      bearingseatingstatus: _s(json['cond_bearing_seating_status']),
      bearingseatingbound: _s(json['cond_bearing_seating_bound']),
      bearingseatingremarks: _s(json['cond_bearing_seating_remarks']),
      bearingplinthstatus: _s(json['cond_bearing_plinth_status']),
      bearingplinthbound: _s(json['cond_bearing_plinth_bound']),
      bearingplinthremarks: _s(json['cond_bearing_plinth_remarks']),
      bearingothers: _s(json['cond_bearing_others']),
      bearingothersstatus: _s(json['cond_bearing_others_status']),
      bearingothersbound: _s(json['cond_bearing_others_bound']),
      bearingothersremarks: _s(json['cond_bearing_others_remarks']),

      otherselem1description: _s(json['cond_otherselem1_description']),
      otherselem1status: _s(json['cond_otherselem1_status']),
      otherselem1bound: _s(json['cond_otherselem1_bound']),
      otherselem1remarks: _s(json['cond_otherselem1_remarks']),
      otherselem2description: _s(json['cond_otherselem2_description']),
      otherselem2status: _s(json['cond_otherselem2_status']),
      otherselem2bound: _s(json['cond_otherselem2_bound']),
      otherselem2remarks: _s(json['cond_otherselem2_remarks']),

      routinedefect1: _s(json['cond_routinedefect1']),
      otherdefect1: _s(json['cond_otherdefect1']),
      routinedefect2: _s(json['cond_routinedefect2']),
      routinedefect3: _s(json['cond_routinedefect3']),
      routinedefect4: _s(json['cond_routinedefect4']),
      otherdefect2: _s(json['cond_otherdefect2']),
      otherdefect3: _s(json['cond_otherdefect3']),
      otherdefect4: _s(json['cond_otherdefect4']),

      dateofinsp: safeDate,
      inspectedby: (json['inspectedby'] ?? 'MobileUser').toString(),
      maintainedby: (json['maintainedby'] ?? 'PLUS').toString(),

      images: (json['images'] as List?)?.map((e) => e.toString()).toList(),
      images2: (json['images2'] as List?)?.map((e) => e.toString()).toList(),
      images3: (json['images3'] as List?)?.map((e) => e.toString()).toList(),
      images4: (json['images4'] as List?)?.map((e) => e.toString()).toList(),
    );
  }

  // This factory is used by your save logic (InspectionPage)
  factory BrPostModel.fromFormValues({
    required String id,
    DateTime? dateofinsp,
    String? inspectedby,
    String? maintainedby,

    String? surfacebridgeblockagestatus,
    String? surfacebridgeblockagebound,
    String? surfacebridgeblockageremarks,
    String? surfacebridgepondingstatus,
    String? surfacebridgepondingbound,
    String? surfacebridgepondingremarks,
    String? surfacebridgeothers,
    String? surfacebridgeothersstatus,
    String? surfacebridgeothersbound,
    String? surfacebridgeothersremarks,

    String? parapetimpactstatus,
    String? parapetimpactbound,
    String? parapetimpactremarks,
    String? parapetcorrosionstatus,
    String? parapetcorrosionbound,
    String? parapetcorrosionremarks,
    String? parapetcrackstatus,
    String? parapetcrackbound,
    String? parapetcrackremarks,
    String? parapetspallstatus,
    String? parapetspallbound,
    String? parapetspallremarks,
    String? parapetothers,
    String? parapetothersstatus,
    String? parapetothersbound,
    String? parapetothersremarks,

    String? jointdescription,
    String? jointstatus,
    String? jointbound,
    String? jointremarks,
    String? jointfixitystatus,
    String? jointfixitybound,
    String? jointfixityremarks,
    String? jointleakagestatus,
    String? jointleakagebound,
    String? jointleakageremarks,
    String? jointothers,
    String? jointothersstatus,
    String? jointothersbound,
    String? jointothersremarks,

    String? abutmentapproachpavementstatus,
    String? abutmentapproachpavementbound,
    String? abutmentapproachpavementremarks,
    String? abutmentapproachothers,
    String? abutmentapproachothersstatus,
    String? abutmentapproachothersbound,
    String? abutmentapproachothersremarks,

    String? beamcorrosionstatus,
    String? beamcorrosionbound,
    String? beamcorrosionremarks,
    String? beamcrackstatus,
    String? beamcrackbound,
    String? beamcrackremarks,
    String? beamspallingstatus,
    String? beamspallingbound,
    String? beamspallingremarks,
    String? beamothers,
    String? beamothersstatus,
    String? beamothersbound,
    String? beamothersremarks,

    String? decksoffitcrackstatus,
    String? decksoffitcrackbound,
    String? decksoffitcrackremarks,
    String? decksoffitspallstatus,
    String? decksoffitspallbound,
    String? decksoffitspallremarks,
    String? decksoffitothers,
    String? decksoffitothersstatus,
    String? conditiodecksoffitothersboundnPierCrack,
    String? decksoffitothersremarks,

    String? abutmentwingwallmovementstatus,
    String? abutmentwingwallmovementbound,
    String? abutmentwingwallmovementremarks,
    String? abutmentwingwallcrackstatus,
    String? abutmentwingwallcrackbound,
    String? abutmentwingwallcrackremarks,
    String? abutmentwingwallspallstatus,
    String? abutmentwingwallspallbound,
    String? abutmentwingwallspallremarks,
    String? abutmentwingwallothers,
    String? abutmentwingwallothersstatus,
    String? abutmentwingwallothersbound,
    String? abutmentwingwallothersremarks,

    String? piermovementstatus,
    String? piermovementbound,
    String? piermovementremarks,
    String? pierscourstatus,
    String? pierscourbound,
    String? pierscourremarks,
    String? pierdebrisstatus,
    String? pierdebrisbound,
    String? pierdebrisremarks,
    String? piercrackstatus,
    String? piercrackbound,
    String? piercrackremarks,
    String? pierspallstatus,
    String? pierspallbound,
    String? pierspallremarks,
    String? pierothers,
    String? pierothersstatus,
    String? pierothersbound,
    String? pierothersremarks,

    String? slopeprotectiondamagestatus,
    String? remarksBeaslopeprotectiondamageboundmcrack,
    String? slopeprotectiondamageremarks,
    String? slopeprotectionscouringstatus,
    String? slopeprotectionscouringbound,
    String? slopeprotectionscouringremarks,
    String? slopeprotectionerosionbound,
    String? slopeprotectionerosionstatus,
    String? slopeprotectionerosionremarks,
    String? slopeprotectionvegestatus,
    String? slopeprotectionvegebound,
    String? slopeprotectionvegeremarks,
    String? slopeprotectionsiltstatus,
    String? slopeprotectionsiltbound,
    String? slopeprotectionsiltremarks,
    String? slopeprotectionothers,
    String? slopeprotectionothersstatus,
    String? slopeprotectionothersbound,
    String? slopeprotectionothersremarks,

    String? bearingdeformstatus,
    String? bearingdeformbound,
    String? bearingdeformremarks,
    String? bearingdebrisstatus,
    String? bearingdebrisbound,
    String? bearingdebrisremarks,
    String? bearingseatingstatus,
    String? bearingseatingbound,
    String? bearingseatingremarks,
    String? bearingplinthstatus,
    String? bearingplinthbound,
    String? bearingplinthremarks,
    String? bearingothers,
    String? bearingothersstatus,
    String? bearingothersbound,
    String? bearingothersremarks,

    String? otherselem1description,
    String? otherselem1status,
    String? otherselem1bound,
    String? otherselem1remarks,
    String? otherselem2description,
    String? otherselem2status,
    String? otherselem2bound,
    String? otherselem2remarks,

    String? routinedefect1,
    String? otherdefect1,
    String? routinedefect2,
    String? routinedefect3,
    String? routinedefect4,
    String? otherdefect2,
    String? otherdefect3,
    String? otherdefect4,

    List<String>? images,
    List<String>? images2,
    List<String>? images3,
    List<String>? images4,
  }) {
    return BrPostModel(
      id: id,
      dateofinsp: dateofinsp ?? DateTime.now(),
      inspectedby: inspectedby ?? 'MobileUser',
      maintainedby: maintainedby ?? 'PLUS',

      surfacebridgeblockagestatus: surfacebridgeblockagestatus,
      surfacebridgeblockagebound: surfacebridgeblockagebound,
      surfacebridgeblockageremarks: surfacebridgeblockageremarks,
      surfacebridgepondingstatus: surfacebridgepondingstatus,
      surfacebridgepondingbound: surfacebridgepondingbound,
      surfacebridgepondingremarks: surfacebridgepondingremarks,
      surfacebridgeothers: surfacebridgeothers,
      surfacebridgeothersstatus: surfacebridgeothersstatus,
      surfacebridgeothersbound: surfacebridgeothersbound,
      surfacebridgeothersremarks: surfacebridgeothersremarks,

      parapetimpactstatus: parapetimpactstatus,
      parapetimpactbound: parapetimpactbound,
      parapetimpactremarks: parapetimpactremarks,
      parapetcorrosionstatus: parapetcorrosionstatus,
      parapetcorrosionbound: parapetcorrosionbound,
      parapetcorrosionremarks: parapetcorrosionremarks,
      parapetcrackstatus: parapetcrackstatus,
      parapetcrackbound: parapetcrackbound,
      parapetcrackremarks: parapetcrackremarks,
      parapetspallstatus: parapetspallstatus,
      parapetspallbound: parapetspallbound,
      parapetspallremarks: parapetspallremarks,
      parapetothers: parapetothers,
      parapetothersstatus: parapetothersstatus,
      parapetothersbound: parapetothersbound,
      parapetothersremarks: parapetothersremarks,

      jointdescription: jointdescription,
      jointstatus: jointstatus,
      jointbound: jointbound,
      jointremarks: jointremarks,
      jointfixitystatus: jointfixitystatus,
      jointfixitybound: jointfixitybound,
      jointfixityremarks: jointfixityremarks,
      jointleakagestatus: jointleakagestatus,
      jointleakagebound: jointleakagebound,
      jointleakageremarks: jointleakageremarks,
      jointothers: jointothers,
      jointothersstatus: jointothersstatus,
      jointothersbound: jointothersbound,
      jointothersremarks: jointothersremarks,

      abutmentapproachpavementstatus: abutmentapproachpavementstatus,
      abutmentapproachpavementbound: abutmentapproachpavementbound,
      abutmentapproachpavementremarks: abutmentapproachpavementremarks,
      abutmentapproachothers: abutmentapproachothers,
      abutmentapproachothersstatus: abutmentapproachothersstatus,
      abutmentapproachothersbound: abutmentapproachothersbound,
      abutmentapproachothersremarks: abutmentapproachothersremarks,

      beamcorrosionstatus: beamcorrosionstatus,
      beamcorrosionbound: beamcorrosionbound,
      beamcorrosionremarks: beamcorrosionremarks,
      beamcrackstatus: beamcrackstatus,
      beamcrackbound: beamcrackbound,
      beamcrackremarks: beamcrackremarks,
      beamspallingstatus: beamspallingstatus,
      beamspallingbound: beamspallingbound,
      beamspallingremarks: beamspallingremarks,
      beamothers: beamothers,
      beamothersstatus: beamothersstatus,
      beamothersbound: beamothersbound,
      beamothersremarks: beamothersremarks,

      decksoffitcrackstatus: decksoffitcrackstatus,
      decksoffitcrackbound: decksoffitcrackbound,
      decksoffitcrackremarks: decksoffitcrackremarks,
      decksoffitspallstatus: decksoffitspallstatus,
      decksoffitspallbound: decksoffitspallbound,
      decksoffitspallremarks: decksoffitspallremarks,
      decksoffitothers: decksoffitothers,
      decksoffitothersstatus: decksoffitothersstatus,
      conditiodecksoffitothersboundnPierCrack: conditiodecksoffitothersboundnPierCrack,
      decksoffitothersremarks: decksoffitothersremarks,

      abutmentwingwallmovementstatus: abutmentwingwallmovementstatus,
      abutmentwingwallmovementbound: abutmentwingwallmovementbound,
      abutmentwingwallmovementremarks: abutmentwingwallmovementremarks,
      abutmentwingwallcrackstatus: abutmentwingwallcrackstatus,
      abutmentwingwallcrackbound: abutmentwingwallcrackbound,
      abutmentwingwallcrackremarks: abutmentwingwallcrackremarks,
      abutmentwingwallspallstatus: abutmentwingwallspallstatus,
      abutmentwingwallspallbound: abutmentwingwallspallbound,
      abutmentwingwallspallremarks: abutmentwingwallspallremarks,
      abutmentwingwallothers: abutmentwingwallothers,
      abutmentwingwallothersstatus: abutmentwingwallothersstatus,
      abutmentwingwallothersbound: abutmentwingwallothersbound,
      abutmentwingwallothersremarks: abutmentwingwallothersremarks,

      piermovementstatus: piermovementstatus,
      piermovementbound: piermovementbound,
      piermovementremarks: piermovementremarks,
      pierscourstatus: pierscourstatus,
      pierscourbound: pierscourbound,
      pierscourremarks: pierscourremarks,
      pierdebrisstatus: pierdebrisstatus,
      pierdebrisbound: pierdebrisbound,
      pierdebrisremarks: pierdebrisremarks,
      piercrackstatus: piercrackstatus,
      piercrackbound: piercrackbound,
      piercrackremarks: piercrackremarks,
      pierspallstatus: pierspallstatus,
      pierspallbound: pierspallbound,
      pierspallremarks: pierspallremarks,
      pierothers: pierothers,
      pierothersstatus: pierothersstatus,
      pierothersbound: pierothersbound,
      pierothersremarks: pierothersremarks,

      slopeprotectiondamagestatus: slopeprotectiondamagestatus,
      remarksBeaslopeprotectiondamageboundmcrack: remarksBeaslopeprotectiondamageboundmcrack,
      slopeprotectiondamageremarks: slopeprotectiondamageremarks,
      slopeprotectionscouringstatus: slopeprotectionscouringstatus,
      slopeprotectionscouringbound: slopeprotectionscouringbound,
      slopeprotectionscouringremarks: slopeprotectionscouringremarks,
      slopeprotectionerosionbound: slopeprotectionerosionbound,
      slopeprotectionerosionstatus: slopeprotectionerosionstatus,
      slopeprotectionerosionremarks: slopeprotectionerosionremarks,
      slopeprotectionvegestatus: slopeprotectionvegestatus,
      slopeprotectionvegebound: slopeprotectionvegebound,
      slopeprotectionvegeremarks: slopeprotectionvegeremarks,
      slopeprotectionsiltstatus: slopeprotectionsiltstatus,
      slopeprotectionsiltbound: slopeprotectionsiltbound,
      slopeprotectionsiltremarks: slopeprotectionsiltremarks,
      slopeprotectionothers: slopeprotectionothers,
      slopeprotectionothersstatus: slopeprotectionothersstatus,
      slopeprotectionothersbound: slopeprotectionothersbound,
      slopeprotectionothersremarks: slopeprotectionothersremarks,

      bearingdeformstatus: bearingdeformstatus,
      bearingdeformbound: bearingdeformbound,
      bearingdeformremarks: bearingdeformremarks,
      bearingdebrisstatus: bearingdebrisstatus,
      bearingdebrisbound: bearingdebrisbound,
      bearingdebrisremarks: bearingdebrisremarks,
      bearingseatingstatus: bearingseatingstatus,
      bearingseatingbound: bearingseatingbound,
      bearingseatingremarks: bearingseatingremarks,
      bearingplinthstatus: bearingplinthstatus,
      bearingplinthbound: bearingplinthbound,
      bearingplinthremarks: bearingplinthremarks,
      bearingothers: bearingothers,
      bearingothersstatus: bearingothersstatus,
      bearingothersbound: bearingothersbound,
      bearingothersremarks: bearingothersremarks,

      otherselem1description: otherselem1description,
      otherselem1status: otherselem1status,
      otherselem1bound: otherselem1bound,
      otherselem1remarks: otherselem1remarks,
      otherselem2description: otherselem2description,
      otherselem2status: otherselem2status,
      otherselem2bound: otherselem2bound,
      otherselem2remarks: otherselem2remarks,

      routinedefect1: routinedefect1,
      otherdefect1: otherdefect1,
      routinedefect2: routinedefect2,
      routinedefect3: routinedefect3,
      routinedefect4: routinedefect4,
      otherdefect2: otherdefect2,
      otherdefect3: otherdefect3,
      otherdefect4: otherdefect4,

      images: images,
      images2: images2,
      images3: images3,
      images4: images4,
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'cond_blockage_status': surfacebridgeblockagestatus,
    'cond_blockage_bound': surfacebridgeblockagebound,
    'cond_blockage_remarks': surfacebridgeblockageremarks,
    'cond_ponding_status': surfacebridgepondingstatus,
    'cond_ponding_bound': surfacebridgepondingbound,
    'cond_ponding_remarks': surfacebridgepondingremarks,
    'cond_surfacebridge_others': surfacebridgeothers,
    'cond_surfacebridge_Status': surfacebridgeothersstatus,
    'cond_others_bound': surfacebridgeothersbound,
    'cond_others_remarks': surfacebridgeothersremarks,

    'cond_impact_status': parapetimpactstatus,
    'cond_impact_bound': parapetimpactbound,
    'cond_impact_remarks': parapetimpactremarks,
    'cond_corrosion_status': parapetcorrosionstatus,
    'cond_corrosion_bound': parapetcorrosionbound,
    'remarkscorrosion': parapetcorrosionremarks,
    'cond_crack_status': parapetcrackstatus,
    'cond_crack_bound': parapetcrackbound,
    'remarkscrack': parapetcrackremarks,
    'cond_spall_status': parapetspallstatus,
    'cond_spall_bound': parapetspallbound,
    'remarksspalling': parapetspallremarks,
    'cond_parapet_others': parapetothers,
    'cond_parapet_others_status': parapetothersstatus,
    'cond_parapet_others_bound': parapetothersbound,
    'cond_parapet_remarks': parapetothersremarks,

    'joint_description': jointdescription,
    'cond_joint_status': jointstatus,
    'cond_joint_bound': jointbound,
    'cond_joint_remarks': jointremarks,
    'cond_fixity_status': jointfixitystatus,
    'cond_fixity_bound': jointfixitybound,
    'remarksFixity': jointfixityremarks,
    'cond_leakage_status': jointleakagestatus,
    'cond_leakage_bound': jointleakagebound,
    'remarksWaterLeakage': jointleakageremarks,
    'joint_others': jointothers,
    'cond_joint_others_status': jointothersstatus,
    'cond_joint_others_bound': jointothersbound,
    'remarksjointOthers': jointothersremarks,

    'cond_pavement_status': abutmentapproachpavementstatus,
    'cond_pavement_bound': abutmentapproachpavementbound,
    'cond_pavement_remarks': abutmentapproachpavementremarks,
    'cond_abutmentapproach_others': abutmentapproachothers,
    'cond_abutmentapproach_others_status': abutmentapproachothersstatus,
    'cond_abutmentapproach_others_bound': abutmentapproachothersbound,
    'abutmentapproach_others_remarks': abutmentapproachothersremarks,

    'cond_beam_corrosion_status': beamcorrosionstatus,
    'cond_beam_corrosion_bound': beamcorrosionbound,
    'cond_beam_corrosion_remarks': beamcorrosionremarks,
    'cond_beam_crack_status': beamcrackstatus,
    'cond_beam_crack_bound': beamcrackbound,
    'cond_beam_crack_remarks': beamcrackremarks,
    'cond_beam_spalling_status': beamspallingstatus,
    'cond_beam_spalling_bound': beamspallingbound,
    'cond_beam_spalling_remarks': beamspallingremarks,
    'cond_beam_others': beamothers,
    'cond_beam_others_status': beamothersstatus,
    'cond_beam_others_bound': beamothersbound,
    'cond_beam_others_remarks': beamothersremarks,

    'cond_decksoffit_crack_status': decksoffitcrackstatus,
    'cond_decksoffit_crack_bound': decksoffitcrackbound,
    'cond_decksoffit_crack_remarks': decksoffitcrackremarks,
    'cond_decksoffit_spall_status': decksoffitspallstatus,
    'cond_decksoffit_spall_bound': decksoffitspallbound,
    'cond_decksoffit_spall_remarks': decksoffitspallremarks,
    'cond_decksoffit_others': decksoffitothers,
    'cond_decksoffit_others_status': decksoffitothersstatus,
    'cond_decksoffit_others_bound': conditiodecksoffitothersboundnPierCrack,
    'cond_decksoffit_others_remarks': decksoffitothersremarks,

    'cond_abutmentwingwall_movement_status': abutmentwingwallmovementstatus,
    'cond_abutmentwingwall_movement_bound': abutmentwingwallmovementbound,
    'cond_abutmentwingwall_movement_remarks': abutmentwingwallmovementremarks,
    'cond_abutmentwingwall_crack_status': abutmentwingwallcrackstatus,
    'cond_abutmentwingwall_crack_bound': abutmentwingwallcrackbound,
    'cond_abutmentwingwall_crack_remarks': abutmentwingwallcrackremarks,
    'cond_abutmentwingwall_spall_status': abutmentwingwallspallstatus,
    'cond_abutmentwingwall_spall_bound': abutmentwingwallspallbound,
    'cond_abutmentwingwall_spall_remarks': abutmentwingwallspallremarks,
    'cond_abutmentwingwall_others': abutmentwingwallothers,
    'cond_abutmentwingwall_others_status': abutmentwingwallothersstatus,
    'cond_abutmentwingwall_others_bound': abutmentwingwallothersbound,
    'cond_abutmentwingwall_others_remarks': abutmentwingwallothersremarks,

    'cond_pier_movement_status': piermovementstatus,
    'cond_pier_movement_bound': piermovementbound,
    'cond_pier_movement_remarks': piermovementremarks,
    'cond_pier_scour_status': pierscourstatus,
    'cond_pier_scour_bound': pierscourbound,
    'cond_pier_scour_remarks': pierscourremarks,
    'cond_pier_debris_status': pierdebrisstatus,
    'cond_pier_debris_bound': pierdebrisbound,
    'cond_pier_debris_remarks': pierdebrisremarks,
    'cond_pier_crack_status': piercrackstatus,
    'cond_pier_crack_bound': piercrackbound,
    'cond_pier_crack_remarks': piercrackremarks,
    'cond_pier_spall_status': pierspallstatus,
    'cond_pier_spall_bound': pierspallbound,
    'cond_pier_spall_remarks': pierspallremarks,
    'cond_pier_others': pierothers,
    'cond_pier_others_status': pierothersstatus,
    'cond_pier_others_bound': pierothersbound,
    'cond_pier_others_remarks': pierothersremarks,

    'cond_slopeprotection_damage_status': slopeprotectiondamagestatus,
    'cond_slopeprotection_damage_bound': remarksBeaslopeprotectiondamageboundmcrack,
    'cond_slopeprotection_damage_remarks': slopeprotectiondamageremarks,
    'cond_slopeprotection_scouring_status': slopeprotectionscouringstatus,
    'cond_slopeprotection_scouring_bound': slopeprotectionscouringbound,
    'cond_slopeprotection_scouring_remarks': slopeprotectionscouringremarks,
    'cond_slopeprotection_erosion_bound': slopeprotectionerosionbound,
    'cond_slopeprotection_erosion_status': slopeprotectionerosionstatus,
    'cond_slopeprotection_erosion_remarks': slopeprotectionerosionremarks,
    'cond_slopeprotection_vege_status': slopeprotectionvegestatus,
    'cond_slopeprotection_vege_bound': slopeprotectionvegebound,
    'cond_slopeprotection_vege_remarks': slopeprotectionvegeremarks,
    'cond_slopeprotection_silt_status': slopeprotectionsiltstatus,
    'cond_slopeprotection_silt_bound': slopeprotectionsiltbound,
    'cond_slopeprotection_silt_remarks': slopeprotectionsiltremarks,
    'cond_slopeprotection_others': slopeprotectionothers,
    'cond_slopeprotection_others_status': slopeprotectionothersstatus,
    'cond_slopeprotection_others_bound': slopeprotectionothersbound,
    'cond_slopeprotection_others_remarks': slopeprotectionothersremarks,

    'cond_bearing_deform_status': bearingdeformstatus,
    'cond_bearing_deform_bound': bearingdeformbound,
    'cond_bearing_deform_remarks': bearingdeformremarks,
    'cond_bearing_debris_status': bearingdebrisstatus,
    'cond_bearing_debris_bound': bearingdebrisbound,
    'cond_bearing_debris_remarks': bearingdebrisremarks,
    'cond_bearing_seating_status': bearingseatingstatus,
    'cond_bearing_seating_bound': bearingseatingbound,
    'cond_bearing_seating_remarks': bearingseatingremarks,
    'cond_bearing_plinth_status': bearingplinthstatus,
    'cond_bearing_plinth_bound': bearingplinthbound,
    'cond_bearing_plinth_remarks': bearingplinthremarks,
    'cond_bearing_others': bearingothers,
    'cond_bearing_others_status': bearingothersstatus,
    'cond_bearing_others_bound': bearingothersbound,
    'cond_bearing_others_remarks': bearingothersremarks,

    'cond_otherselem1_description': otherselem1description,
    'cond_otherselem1_status': otherselem1status,
    'cond_otherselem1_bound': otherselem1bound,
    'cond_otherselem1_remarks': otherselem1remarks,
    'cond_otherselem2_description': otherselem2description,
    'cond_otherselem2_status': otherselem2status,
    'cond_otherselem2_bound': otherselem2bound,
    'cond_otherselem2_remarks': otherselem2remarks,

    'cond_routinedefect1': routinedefect1,
    'cond_otherdefect1': otherdefect1,
    'cond_routinedefect2': routinedefect2,
    'cond_routinedefect3': routinedefect3,
    'cond_routinedefect4': routinedefect4,
    'cond_otherdefect2': otherdefect2,
    'cond_otherdefect3': otherdefect3,
    'cond_otherdefect4': otherdefect4,

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
      (json.decode(source) as List).map((e) => BrPostModel.fromJson(e)).toList();
}
