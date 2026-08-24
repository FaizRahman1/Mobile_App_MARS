class BridgeinspectionModel {
  String? id;
  String? dateofinspection;
  String? dateoflastinspection;
  String? inspectedby;
  BridgeElement? bridgeelement;
  List<SummaryItem>? summary;
  String? error;

  BridgeinspectionModel({
    this.id,
    this.dateofinspection,
    this.dateoflastinspection,
    this.inspectedby,
    this.bridgeelement,
    this.summary,
  });

  BridgeinspectionModel.withError(String errorMessage) {
    error = errorMessage;
  }

  factory BridgeinspectionModel.fromJson(Map<String, dynamic> json) {
    return BridgeinspectionModel(
      id: json['id'],
      dateofinspection: json['dateofinspection'],
      dateoflastinspection: json['dateoflastinspection'],
      inspectedby: json['inspectedby'],
      bridgeelement: json['bridgeelement'] != null
          ? BridgeElement.fromJson(json['bridgeelement'] as Map<String, dynamic>)
          : null,
      summary: (json['summary'] as List?)
          ?.map((e) => SummaryItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['dateofinspection'] = dateofinspection;
    data['dateoflastinspection'] = dateoflastinspection;
    data['inspectedby'] = inspectedby;
    if (bridgeelement != null) {
      data['bridgeelement'] = bridgeelement!.toJson();
    }
    if (summary != null) {
      data['summary'] = summary!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class BridgeElement {
  // Surface Bridge
  String? surfacebridgeBlockageStatus;
  String? surfacebridgeBlockageBound;
  String? surfacebridgeBlockageRemarks;
  String? surfacebridgePondingStatus;
  String? surfacebridgePondingBound;
  String? surfacebridgePondingRemarks;
  String? surfacebridgeOthers;
  String? surfacebridgeOthersStatus;
  String? surfacebridgeOthersBound;
  String? surfacebridgeOthersRemarks;

  // Parapet
  String? parapetImpactStatus;
  String? parapetImpactBound;
  String? parapetImpactRemarks;
  String? parapetCorrosionStatus;
  String? parapetCorrosionBound;
  String? parapetCorrosionRemarks;
  String? parapetCrackStatus;
  String? parapetCrackBound;
  String? parapetCrackRemarks;
  String? parapetSpallStatus;
  String? parapetSpallBound;
  String? parapetSpallRemarks;
  String? parapetOthers;
  String? parapetOthersStatus;
  String? parapetOthersBound;
  String? parapetOthersRemarks;

  // Joint
  String? jointDescription;
  String? jointStatus;
  String? jointBound;
  String? jointRemarks;
  String? jointFixityStatus;
  String? jointFixityBound;
  String? jointFixityRemarks;
  String? jointLeakageStatus;
  String? jointLeakageBound;
  String? jointLeakageRemarks;
  String? jointOthers;
  String? jointOthersStatus;
  String? jointOthersBound;
  String? jointOthersRemarks;

  // Abutment Approach
  String? abutmentapproachPavementStatus;
  String? abutmentapproachPavementBound;
  String? abutmentapproachPavementRemarks;
  String? abutmentapproachOthers;
  String? abutmentapproachOthersStatus;
  String? abutmentapproachOthersBound;
  String? abutmentapproachOthersRemarks;

  // Beam
  String? beamCorrosionStatus;
  String? beamCorrosionBound;
  String? beamCorrosionRemarks;
  String? beamCrackStatus;
  String? beamCrackBound;
  String? beamCrackRemarks;
  String? beamSpallingStatus;
  String? beamSpallingBound;
  String? beamSpallingRemarks;
  String? beamOthers;
  String? beamOthersStatus;
  String? beamOthersBound;
  String? beamOthersRemarks;

  // Deck Soffit
  String? decksoffitCrackStatus;
  String? decksoffitCrackBound;
  String? decksoffitCrackRemarks;
  String? decksoffitSpallStatus;
  String? decksoffitSpallBound;
  String? decksoffitSpallRemarks;
  String? decksoffitOthers;
  String? decksoffitOthersStatus;
  String? decksoffitOthersBound;
  String? decksoffitOthersRemarks;

  // Abutment Wing Wall
  String? abutmentwingwallMovementStatus;
  String? abutmentwingwallMovementBound;
  String? abutmentwingwallMovementRemarks;
  String? abutmentwingwallCrackStatus;
  String? abutmentwingwallCrackBound;
  String? abutmentwingwallCrackRemarks;
  String? abutmentwingwallSpallStatus;
  String? abutmentwingwallSpallBound;
  String? abutmentwingwallSpallRemarks;
  String? abutmentwingwallOthers;
  String? abutmentwingwallOthersStatus;
  String? abutmentwingwallOthersBound;
  String? abutmentwingwallOthersRemarks;

  // Pier
  String? pierMovementStatus;
  String? pierMovementBound;
  String? pierMovementRemarks;
  String? pierScourStatus;
  String? pierScourBound;
  String? pierScourRemarks;
  String? pierDebrisStatus;
  String? pierDebrisBound;
  String? pierDebrisRemarks;
  String? pierCrackStatus;
  String? pierCrackBound;
  String? pierCrackRemarks;
  String? pierSpallStatus;
  String? pierSpallBound;
  String? pierSpallRemarks;
  String? pierOthers;
  String? pierOthersStatus;
  String? pierOthersBound;
  String? pierOthersRemarks;

  // Slope Protection
  String? slopeprotectionDamageStatus;
  String? slopeprotectionDamageBound;
  String? slopeprotectionDamageRemarks;
  String? slopeprotectionScouringStatus;
  String? slopeprotectionScouringBound;
  String? slopeprotectionScouringRemarks;
  String? slopeprotectionErosionStatus;
  String? slopeprotectionErosionBound;
  String? slopeprotectionErosionRemarks;
  String? slopeprotectionVegeStatus;
  String? slopeprotectionVegeBound;
  String? slopeprotectionVegeRemarks;
  String? slopeprotectionSiltStatus;
  String? slopeprotectionSiltBound;
  String? slopeprotectionSiltRemarks;
  String? slopeprotectionOthers;
  String? slopeprotectionOthersStatus;
  String? slopeprotectionOthersBound;
  String? slopeprotectionOthersRemarks;

  // Bearing
  String? bearingDeformStatus;
  String? bearingDeformBound;
  String? bearingDeformRemarks;
  String? bearingDebrisStatus;
  String? bearingDebrisBound;
  String? bearingDebrisRemarks;
  String? bearingSeatingStatus;
  String? bearingSeatingBound;
  String? bearingSeatingRemarks;
  String? bearingPlinthStatus;
  String? bearingPlinthBound;
  String? bearingPlinthRemarks;
  String? bearingOthers;
  String? bearingOthersStatus;
  String? bearingOthersBound;
  String? bearingOthersRemarks;

  // Other Elements
  String? otherselem1Description;
  String? otherselem1Status;
  String? otherselem1Bound;
  String? otherselem1Remarks;
  String? otherselem2Description;
  String? otherselem2Status;
  String? otherselem2Bound;
  String? otherselem2Remarks;

  BridgeElement({
    this.surfacebridgeBlockageStatus,
    this.surfacebridgeBlockageBound,
    this.surfacebridgeBlockageRemarks,
    this.surfacebridgePondingStatus,
    this.surfacebridgePondingBound,
    this.surfacebridgePondingRemarks,
    this.surfacebridgeOthers,
    this.surfacebridgeOthersStatus,
    this.surfacebridgeOthersBound,
    this.surfacebridgeOthersRemarks,
    this.parapetImpactStatus,
    this.parapetImpactBound,
    this.parapetImpactRemarks,
    this.parapetCorrosionStatus,
    this.parapetCorrosionBound,
    this.parapetCorrosionRemarks,
    this.parapetCrackStatus,
    this.parapetCrackBound,
    this.parapetCrackRemarks,
    this.parapetSpallStatus,
    this.parapetSpallBound,
    this.parapetSpallRemarks,
    this.parapetOthers,
    this.parapetOthersStatus,
    this.parapetOthersBound,
    this.parapetOthersRemarks,
    this.jointDescription,
    this.jointStatus,
    this.jointBound,
    this.jointRemarks,
    this.jointFixityStatus,
    this.jointFixityBound,
    this.jointFixityRemarks,
    this.jointLeakageStatus,
    this.jointLeakageBound,
    this.jointLeakageRemarks,
    this.jointOthers,
    this.jointOthersStatus,
    this.jointOthersBound,
    this.jointOthersRemarks,
    this.abutmentapproachPavementStatus,
    this.abutmentapproachPavementBound,
    this.abutmentapproachPavementRemarks,
    this.abutmentapproachOthers,
    this.abutmentapproachOthersStatus,
    this.abutmentapproachOthersBound,
    this.abutmentapproachOthersRemarks,
    this.beamCorrosionStatus,
    this.beamCorrosionBound,
    this.beamCorrosionRemarks,
    this.beamCrackStatus,
    this.beamCrackBound,
    this.beamCrackRemarks,
    this.beamSpallingStatus,
    this.beamSpallingBound,
    this.beamSpallingRemarks,
    this.beamOthers,
    this.beamOthersStatus,
    this.beamOthersBound,
    this.beamOthersRemarks,
    this.decksoffitCrackStatus,
    this.decksoffitCrackBound,
    this.decksoffitCrackRemarks,
    this.decksoffitSpallStatus,
    this.decksoffitSpallBound,
    this.decksoffitSpallRemarks,
    this.decksoffitOthers,
    this.decksoffitOthersStatus,
    this.decksoffitOthersBound,
    this.decksoffitOthersRemarks,
    this.abutmentwingwallMovementStatus,
    this.abutmentwingwallMovementBound,
    this.abutmentwingwallMovementRemarks,
    this.abutmentwingwallCrackStatus,
    this.abutmentwingwallCrackBound,
    this.abutmentwingwallCrackRemarks,
    this.abutmentwingwallSpallStatus,
    this.abutmentwingwallSpallBound,
    this.abutmentwingwallSpallRemarks,
    this.abutmentwingwallOthers,
    this.abutmentwingwallOthersStatus,
    this.abutmentwingwallOthersBound,
    this.abutmentwingwallOthersRemarks,
    this.pierMovementStatus,
    this.pierMovementBound,
    this.pierMovementRemarks,
    this.pierScourStatus,
    this.pierScourBound,
    this.pierScourRemarks,
    this.pierDebrisStatus,
    this.pierDebrisBound,
    this.pierDebrisRemarks,
    this.pierCrackStatus,
    this.pierCrackBound,
    this.pierCrackRemarks,
    this.pierSpallStatus,
    this.pierSpallBound,
    this.pierSpallRemarks,
    this.pierOthers,
    this.pierOthersStatus,
    this.pierOthersBound,
    this.pierOthersRemarks,
    this.slopeprotectionDamageStatus,
    this.slopeprotectionDamageBound,
    this.slopeprotectionDamageRemarks,
    this.slopeprotectionScouringStatus,
    this.slopeprotectionScouringBound,
    this.slopeprotectionScouringRemarks,
    this.slopeprotectionErosionStatus,
    this.slopeprotectionErosionBound,
    this.slopeprotectionErosionRemarks,
    this.slopeprotectionVegeStatus,
    this.slopeprotectionVegeBound,
    this.slopeprotectionVegeRemarks,
    this.slopeprotectionSiltStatus,
    this.slopeprotectionSiltBound,
    this.slopeprotectionSiltRemarks,
    this.slopeprotectionOthers,
    this.slopeprotectionOthersStatus,
    this.slopeprotectionOthersBound,
    this.slopeprotectionOthersRemarks,
    this.bearingDeformStatus,
    this.bearingDeformBound,
    this.bearingDeformRemarks,
    this.bearingDebrisStatus,
    this.bearingDebrisBound,
    this.bearingDebrisRemarks,
    this.bearingSeatingStatus,
    this.bearingSeatingBound,
    this.bearingSeatingRemarks,
    this.bearingPlinthStatus,
    this.bearingPlinthBound,
    this.bearingPlinthRemarks,
    this.bearingOthers,
    this.bearingOthersStatus,
    this.bearingOthersBound,
    this.bearingOthersRemarks,
    this.otherselem1Description,
    this.otherselem1Status,
    this.otherselem1Bound,
    this.otherselem1Remarks,
    this.otherselem2Description,
    this.otherselem2Status,
    this.otherselem2Bound,
    this.otherselem2Remarks,
  });

  factory BridgeElement.fromJson(Map<String, dynamic> json) {
    return BridgeElement(
      surfacebridgeBlockageStatus: json['surfacebridge_blockage_status'],
      surfacebridgeBlockageBound: json['surfacebridge_blockage_bound'],
      surfacebridgeBlockageRemarks: json['surfacebridge_blockage_remarks'],
      surfacebridgePondingStatus: json['surfacebridge_ponding_status'],
      surfacebridgePondingBound: json['surfacebridge_ponding_bound'],
      surfacebridgePondingRemarks: json['surfacebridge_ponding_remarks'],
      surfacebridgeOthers: json['surfacebridge_others'],
      surfacebridgeOthersStatus: json['surfacebridge_others_status'],
      surfacebridgeOthersBound: json['surfacebridge_others_bound'],
      surfacebridgeOthersRemarks: json['surfacebridge_others_remarks'],

      parapetImpactStatus: json['parapet_impact_status'],
      parapetImpactBound: json['parapet_impact_bound'],
      parapetImpactRemarks: json['parapet_impact_remarks'],
      parapetCorrosionStatus: json['parapet_corrosion_status'],
      parapetCorrosionBound: json['parapet_corrosion_bound'],
      parapetCorrosionRemarks: json['parapet_corrosion_remarks'],
      parapetCrackStatus: json['parapet_crack_status'],
      parapetCrackBound: json['parapet_crack_bound'],
      parapetCrackRemarks: json['parapet_crack_remarks'],
      parapetSpallStatus: json['parapet_spall_status'],
      parapetSpallBound: json['parapet_spall_bound'],
      parapetSpallRemarks: json['parapet_spall_remarks'],
      parapetOthers: json['parapet_others'],
      parapetOthersStatus: json['parapet_others_status'],
      parapetOthersBound: json['parapet_others_bound'],
      parapetOthersRemarks: json['parapet_others_remarks'],

      jointDescription: json['joint_description'],
      jointStatus: json['joint_status'],
      jointBound: json['joint_bound'],
      jointRemarks: json['joint_remarks'],
      jointFixityStatus: json['joint_fixity_status'],
      jointFixityBound: json['joint_fixity_bound'],
      jointFixityRemarks: json['joint_fixity_remarks'],
      jointLeakageStatus: json['joint_leakage_status'],
      jointLeakageBound: json['joint_leakage_bound'],
      jointLeakageRemarks: json['joint_leakage_remarks'],
      jointOthers: json['joint_others'],
      jointOthersStatus: json['joint_others_status'],
      jointOthersBound: json['joint_others_bound'],
      jointOthersRemarks: json['joint_others_remarks'],

      abutmentapproachPavementStatus: json['abutmentapproach_pavement_status'],
      abutmentapproachPavementBound: json['abutmentapproach_pavement_bound'],
      abutmentapproachPavementRemarks: json['abutmentapproach_pavement_remarks'],
      abutmentapproachOthers: json['abutmentapproach_others'],
      abutmentapproachOthersStatus: json['abutmentapproach_others_status'],
      abutmentapproachOthersBound: json['abutmentapproach_others_bound'],
      abutmentapproachOthersRemarks: json['abutmentapproach_others_remarks'],

      beamCorrosionStatus: json['beam_corrosion_status'],
      beamCorrosionBound: json['beam_corrosion_bound'],
      beamCorrosionRemarks: json['beam_corrosion_remarks'],
      beamCrackStatus: json['beam_crack_status'],
      beamCrackBound: json['beam_crack_bound'],
      beamCrackRemarks: json['beam_crack_remarks'],
      beamSpallingStatus: json['beam_spalling_status'],
      beamSpallingBound: json['beam_spalling_bound'],
      beamSpallingRemarks: json['beam_spalling_remarks'],
      beamOthers: json['beam_others'],
      beamOthersStatus: json['beam_others_status'],
      beamOthersBound: json['beam_others_bound'],
      beamOthersRemarks: json['beam_others_remarks'],

      decksoffitCrackStatus: json['decksoffit_crack_status'],
      decksoffitCrackBound: json['decksoffit_crack_bound'],
      decksoffitCrackRemarks: json['decksoffit_crack_remarks'],
      decksoffitSpallStatus: json['decksoffit_spall_status'],
      decksoffitSpallBound: json['decksoffit_spall_bound'],
      decksoffitSpallRemarks: json['decksoffit_spall_remarks'],
      decksoffitOthers: json['decksoffit_others'],
      decksoffitOthersStatus: json['decksoffit_others_status'],
      decksoffitOthersBound: json['decksoffit_others_bound'],
      decksoffitOthersRemarks: json['decksoffit_others_remarks'],

      abutmentwingwallMovementStatus: json['abutmentwingwall_movement_status'],
      abutmentwingwallMovementBound: json['abutmentwingwall_movement_bound'],
      abutmentwingwallMovementRemarks: json['abutmentwingwall_movement_remarks'],
      abutmentwingwallCrackStatus: json['abutmentwingwall_crack_status'],
      abutmentwingwallCrackBound: json['abutmentwingwall_crack_bound'],
      abutmentwingwallCrackRemarks: json['abutmentwingwall_crack_remarks'],
      abutmentwingwallSpallStatus: json['abutmentwingwall_spall_status'],
      abutmentwingwallSpallBound: json['abutmentwingwall_spall_bound'],
      abutmentwingwallSpallRemarks: json['abutmentwingwall_spall_remarks'],
      abutmentwingwallOthers: json['abutmentwingwall_others'],
      abutmentwingwallOthersStatus: json['abutmentwingwall_others_status'],
      abutmentwingwallOthersBound: json['abutmentwingwall_others_bound'],
      abutmentwingwallOthersRemarks: json['abutmentwingwall_others_remarks'],

      pierMovementStatus: json['pier_movement_status'],
      pierMovementBound: json['pier_movement_bound'],
      pierMovementRemarks: json['pier_movement_remarks'],
      pierScourStatus: json['pier_scour_status'],
      pierScourBound: json['pier_scour_bound'],
      pierScourRemarks: json['pier_scour_remarks'],
      pierDebrisStatus: json['pier_debris_status'],
      pierDebrisBound: json['pier_debris_bound'],
      pierDebrisRemarks: json['pier_debris_remarks'],
      pierCrackStatus: json['pier_crack_status'],
      pierCrackBound: json['pier_crack_bound'],
      pierCrackRemarks: json['pier_crack_remarks'],
      pierSpallStatus: json['pier_spall_status'],
      pierSpallBound: json['pier_spall_bound'],
      pierSpallRemarks: json['pier_spall_remarks'],
      pierOthers: json['pier_others'],
      pierOthersStatus: json['pier_others_status'],
      pierOthersBound: json['pier_others_bound'],
      pierOthersRemarks: json['pier_others_remarks'],

      slopeprotectionDamageStatus: json['slopeprotection_damage_status'],
      slopeprotectionDamageBound: json['slopeprotection_damage_bound'],
      slopeprotectionDamageRemarks: json['slopeprotection_damage_remarks'],
      slopeprotectionScouringStatus: json['slopeprotection_scouring_status'],
      slopeprotectionScouringBound: json['slopeprotection_scouring_bound'],
      slopeprotectionScouringRemarks: json['slopeprotection_scouring_remarks'],
      slopeprotectionErosionStatus: json['slopeprotection_erosion_status'],
      slopeprotectionErosionBound: json['slopeprotection_erosion_bound'],
      slopeprotectionErosionRemarks: json['slopeprotection_erosion_remarks'],
      slopeprotectionVegeStatus: json['slopeprotection_vege_status'],
      slopeprotectionVegeBound: json['slopeprotection_vege_bound'],
      slopeprotectionVegeRemarks: json['slopeprotection_vege_remarks'],
      slopeprotectionSiltStatus: json['slopeprotection_silt_status'],
      slopeprotectionSiltBound: json['slopeprotection_silt_bound'],
      slopeprotectionSiltRemarks: json['slopeprotection_silt_remarks'],
      slopeprotectionOthers: json['slopeprotection_others'],
      slopeprotectionOthersStatus: json['slopeprotection_others_status'],
      slopeprotectionOthersBound: json['slopeprotection_others_bound'],
      slopeprotectionOthersRemarks: json['slopeprotection_others_remarks'],

      bearingDeformStatus: json['bearing_deform_status'],
      bearingDeformBound: json['bearing_deform_bound'],
      bearingDeformRemarks: json['bearing_deform_remarks'],
      bearingDebrisStatus: json['bearing_debris_status'],
      bearingDebrisBound: json['bearing_debris_bound'],
      bearingDebrisRemarks: json['bearing_debris_remarks'],
      bearingSeatingStatus: json['bearing_seating_status'],
      bearingSeatingBound: json['bearing_seating_bound'],
      bearingSeatingRemarks: json['bearing_seating_remarks'],
      bearingPlinthStatus: json['bearing_plinth_status'],
      bearingPlinthBound: json['bearing_plinth_bound'],
      bearingPlinthRemarks: json['bearing_plinth_remarks'],
      bearingOthers: json['bearing_others'],
      bearingOthersStatus: json['bearing_others_status'],
      bearingOthersBound: json['bearing_others_bound'],
      bearingOthersRemarks: json['bearing_others_remarks'],

      otherselem1Description: json['otherselem1_description'],
      otherselem1Status: json['otherselem1_status'],
      otherselem1Bound: json['otherselem1_bound'],
      otherselem1Remarks: json['otherselem1_remarks'],
      otherselem2Description: json['otherselem2_description'],
      otherselem2Status: json['otherselem2_status'],
      otherselem2Bound: json['otherselem2_bound'],
      otherselem2Remarks: json['otherselem2_remarks'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'surfacebridge_blockage_status': surfacebridgeBlockageStatus,
      'surfacebridge_blockage_bound': surfacebridgeBlockageBound,
      'surfacebridge_blockage_remarks': surfacebridgeBlockageRemarks,
      'surfacebridge_ponding_status': surfacebridgePondingStatus,
      'surfacebridge_ponding_bound': surfacebridgePondingBound,
      'surfacebridge_ponding_remarks': surfacebridgePondingRemarks,
      'surfacebridge_others': surfacebridgeOthers,
      'surfacebridge_others_status': surfacebridgeOthersStatus,
      'surfacebridge_others_bound': surfacebridgeOthersBound,
      'surfacebridge_others_remarks': surfacebridgeOthersRemarks,

      'parapet_impact_status': parapetImpactStatus,
      'parapet_impact_bound': parapetImpactBound,
      'parapet_impact_remarks': parapetImpactRemarks,
      'parapet_corrosion_status': parapetCorrosionStatus,
      'parapet_corrosion_bound': parapetCorrosionBound,
      'parapet_corrosion_remarks': parapetCorrosionRemarks,
      'parapet_crack_status': parapetCrackStatus,
      'parapet_crack_bound': parapetCrackBound,
      'parapet_crack_remarks': parapetCrackRemarks,
      'parapet_spall_status': parapetSpallStatus,
      'parapet_spall_bound': parapetSpallBound,
      'parapet_spall_remarks': parapetSpallRemarks,
      'parapet_others': parapetOthers,
      'parapet_others_status': parapetOthersStatus,
      'parapet_others_bound': parapetOthersBound,
      'parapet_others_remarks': parapetOthersRemarks,

      'joint_description': jointDescription,
      'joint_status': jointStatus,
      'joint_bound': jointBound,
      'joint_remarks': jointRemarks,
      'joint_fixity_status': jointFixityStatus,
      'joint_fixity_bound': jointFixityBound,
      'joint_fixity_remarks': jointFixityRemarks,
      'joint_leakage_status': jointLeakageStatus,
      'joint_leakage_bound': jointLeakageBound,
      'joint_leakage_remarks': jointLeakageRemarks,
      'joint_others': jointOthers,
      'joint_others_status': jointOthersStatus,
      'joint_others_bound': jointOthersBound,
      'joint_others_remarks': jointOthersRemarks,

      'abutmentapproach_pavement_status': abutmentapproachPavementStatus,
      'abutmentapproach_pavement_bound': abutmentapproachPavementBound,
      'abutmentapproach_pavement_remarks': abutmentapproachPavementRemarks,
      'abutmentapproach_others': abutmentapproachOthers,
      'abutmentapproach_others_status': abutmentapproachOthersStatus,
      'abutmentapproach_others_bound': abutmentapproachOthersBound,
      'abutmentapproach_others_remarks': abutmentapproachOthersRemarks,

      'beam_corrosion_status': beamCorrosionStatus,
      'beam_corrosion_bound': beamCorrosionBound,
      'beam_corrosion_remarks': beamCorrosionRemarks,
      'beam_crack_status': beamCrackStatus,
      'beam_crack_bound': beamCrackBound,
      'beam_crack_remarks': beamCrackRemarks,
      'beam_spalling_status': beamSpallingStatus,
      'beam_spalling_bound': beamSpallingBound,
      'beam_spalling_remarks': beamSpallingRemarks,
      'beam_others': beamOthers,
      'beam_others_status': beamOthersStatus,
      'beam_others_bound': beamOthersBound,
      'beam_others_remarks': beamOthersRemarks,

      'decksoffit_crack_status': decksoffitCrackStatus,
      'decksoffit_crack_bound': decksoffitCrackBound,
      'decksoffit_crack_remarks': decksoffitCrackRemarks,
      'decksoffit_spall_status': decksoffitSpallStatus,
      'decksoffit_spall_bound': decksoffitSpallBound,
      'decksoffit_spall_remarks': decksoffitSpallRemarks,
      'decksoffit_others': decksoffitOthers,
      'decksoffit_others_status': decksoffitOthersStatus,
      'decksoffit_others_bound': decksoffitOthersBound,
      'decksoffit_others_remarks': decksoffitOthersRemarks,

      'abutmentwingwall_movement_status': abutmentwingwallMovementStatus,
      'abutmentwingwall_movement_bound': abutmentwingwallMovementBound,
      'abutmentwingwall_movement_remarks': abutmentwingwallMovementRemarks,
      'abutmentwingwall_crack_status': abutmentwingwallCrackStatus,
      'abutmentwingwall_crack_bound': abutmentwingwallCrackBound,
      'abutmentwingwall_crack_remarks': abutmentwingwallCrackRemarks,
      'abutmentwingwall_spall_status': abutmentwingwallSpallStatus,
      'abutmentwingwall_spall_bound': abutmentwingwallSpallBound,
      'abutmentwingwall_spall_remarks': abutmentwingwallSpallRemarks,
      'abutmentwingwall_others': abutmentwingwallOthers,
      'abutmentwingwall_others_status': abutmentwingwallOthersStatus,
      'abutmentwingwall_others_bound': abutmentwingwallOthersBound,
      'abutmentwingwall_others_remarks': abutmentwingwallOthersRemarks,

      'pier_movement_status': pierMovementStatus,
      'pier_movement_bound': pierMovementBound,
      'pier_movement_remarks': pierMovementRemarks,
      'pier_scour_status': pierScourStatus,
      'pier_scour_bound': pierScourBound,
      'pier_scour_remarks': pierScourRemarks,
      'pier_debris_status': pierDebrisStatus,
      'pier_debris_bound': pierDebrisBound,
      'pier_debris_remarks': pierDebrisRemarks,
      'pier_crack_status': pierCrackStatus,
      'pier_crack_bound': pierCrackBound,
      'pier_crack_remarks': pierCrackRemarks,
      'pier_spall_status': pierSpallStatus,
      'pier_spall_bound': pierSpallBound,
      'pier_spall_remarks': pierSpallRemarks,
      'pier_others': pierOthers,
      'pier_others_status': pierOthersStatus,
      'pier_others_bound': pierOthersBound,
      'pier_others_remarks': pierOthersRemarks,

      'slopeprotection_damage_status': slopeprotectionDamageStatus,
      'slopeprotection_damage_bound': slopeprotectionDamageBound,
      'slopeprotection_damage_remarks': slopeprotectionDamageRemarks,
      'slopeprotection_scouring_status': slopeprotectionScouringStatus,
      'slopeprotection_scouring_bound': slopeprotectionScouringBound,
      'slopeprotection_scouring_remarks': slopeprotectionScouringRemarks,
      'slopeprotection_erosion_status': slopeprotectionErosionStatus,
      'slopeprotection_erosion_bound': slopeprotectionErosionBound,
      'slopeprotection_erosion_remarks': slopeprotectionErosionRemarks,
      'slopeprotection_vege_status': slopeprotectionVegeStatus,
      'slopeprotection_vege_bound': slopeprotectionVegeBound,
      'slopeprotection_vege_remarks': slopeprotectionVegeRemarks,
      'slopeprotection_silt_status': slopeprotectionSiltStatus,
      'slopeprotection_silt_bound': slopeprotectionSiltBound,
      'slopeprotection_silt_remarks': slopeprotectionSiltRemarks,
      'slopeprotection_others': slopeprotectionOthers,
      'slopeprotection_others_status': slopeprotectionOthersStatus,
      'slopeprotection_others_bound': slopeprotectionOthersBound,
      'slopeprotection_others_remarks': slopeprotectionOthersRemarks,

      'bearing_deform_status': bearingDeformStatus,
      'bearing_deform_bound': bearingDeformBound,
      'bearing_deform_remarks': bearingDeformRemarks,
      'bearing_debris_status': bearingDebrisStatus,
      'bearing_debris_bound': bearingDebrisBound,
      'bearing_debris_remarks': bearingDebrisRemarks,
      'bearing_seating_status': bearingSeatingStatus,
      'bearing_seating_bound': bearingSeatingBound,
      'bearing_seating_remarks': bearingSeatingRemarks,
      'bearing_plinth_status': bearingPlinthStatus,
      'bearing_plinth_bound': bearingPlinthBound,
      'bearing_plinth_remarks': bearingPlinthRemarks,
      'bearing_others': bearingOthers,
      'bearing_others_status': bearingOthersStatus,
      'bearing_others_bound': bearingOthersBound,
      'bearing_others_remarks': bearingOthersRemarks,

      'otherselem1_description': otherselem1Description,
      'otherselem1_status': otherselem1Status,
      'otherselem1_bound': otherselem1Bound,
      'otherselem1_remarks': otherselem1Remarks,
      'otherselem2_description': otherselem2Description,
      'otherselem2_status': otherselem2Status,
      'otherselem2_bound': otherselem2Bound,
      'otherselem2_remarks': otherselem2Remarks,
    };
  }
}

class SummaryItem {
  String? routinedefect;
  String? otherdefect;

  SummaryItem({this.routinedefect, this.otherdefect});

  factory SummaryItem.fromJson(Map<String, dynamic> json) {
    return SummaryItem(
      routinedefect: json['routinedefect'],
      otherdefect: json['otherdefect'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'routinedefect': routinedefect,
      'otherdefect': otherdefect,
    };
  }
}