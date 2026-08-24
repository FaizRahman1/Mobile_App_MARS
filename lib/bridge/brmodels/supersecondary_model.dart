class SupersecondaryModel {
  String? id; //bridge id
  String? dateofinspection;
  String? dateoflastinspection;
  String? inspectedby;
  String? summary;
  int? startinspect;
  int? endinspect;
  String? trafficflow;
  SuperstructureSecondary? superstructureSecondary;
  String? error;

  SupersecondaryModel(
      {this.id,
      this.dateofinspection,
      this.dateoflastinspection,
      this.inspectedby,
      this.summary,
      this.startinspect,
      this.endinspect,
      this.trafficflow,
      this.superstructureSecondary});

  SupersecondaryModel.withError(String errorMessage) {
    error = errorMessage;
  }

  SupersecondaryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    dateofinspection = json['dateofinspection'];
    dateoflastinspection = json['dateoflastinspection'];
    inspectedby = json['inspectedby'];
    startinspect = json['startinspect'];
    endinspect = json['endinspect'];
    trafficflow = json['trafficflow'];
    superstructureSecondary = json['superstructure_secondary'] != null
        ? SuperstructureSecondary.fromJson(json['superstructure_secondary'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['dateofinspection'] = dateofinspection;
    data['dateoflastinspection'] = dateoflastinspection;
    data['inspectedby'] = inspectedby;
    data['startinspect'] = startinspect;
    data['endinspect'] = endinspect;
    data['trafficflow'] = trafficflow;
    if (superstructureSecondary != null) {
      data['superstructure_secondary'] = superstructureSecondary!.toJson();
    }
    return data;
  }
}

class SuperstructureSecondary {
  String? deckStructureCondition;
  String? deckStructureSeverity;
  int? deckStructureExtent;
  String? deckStructureRemarks;
  String? deckServiceCondition;
  String? deckServiceSeverity;
  int? deckServiceExtent;
  String? deckServiceRemarks;
  String? deckOther;
  String? deckOtherCondition;
  int? deckOtherSeverity;
  int? deckOtherExtent;
  String? deckOtherRemarks;
  int? deckRating;
  String? parapetorDamageCondition;
  String? parapetorDamageSeverity;
  int? parapetorDamageExtent;
  String? parapetorDamageRemarks;
  String? parapetorStabilityCondition;
  String? parapetorStabilitySeverity;
  int? parapetorStabilityExtent;
  String? parapetorStabilityRemarks;
  String? parapetorCorrosionCondition;
  String? parapetorCorrosionSeverity;
  int? parapetorCorrosionExtent;
  String? parapetorCorrosionRemarks;
  String? parapetorCrackingCondition;
  String? parapetorCrackingSeverity;
  int? parapetorCrackingExtent;
  String? parapetorCrackingRemarks;
  String? parapetorSpallingCondition;
  String? parapetorSpallingSeverity;
  int? parapetorSpallingExtent;
  String? parapetorSpallingRemarks;
  String? parapetorOther;
  String? parapetorOtherCondition;
  int? parapetorOtherSeverity;
  int? parapetorOtherExtent;
  String? parapetorOtherRemarks;
  int? parapetorRating;
  String? jointType;
  String? jointTypeCondition;
  String? jointTypeSeverity;
  String? jointTypeExtent;
  String? jointTypeRemarks;
  String? jointNoiseCondition;
  String? jointNoiseSeverity;
  int? jointNoiseExtent;
  String? jointNoiseRemarks;
  String? jointAlignmentCondition;
  String? jointAlignmentSeverity;
  int? jointAlignmentExtent;
  String? jointAlignmentRemarks;
  String? jointLeakageCondition;
  String? jointLeakageSeverity;
  int? jointLeakageExtent;
  String? jointLeakageRemarks;
  String? jointOther;
  String? jointOtherCondition;
  int? jointOtherSeverity;
  int? jointOtherExtent;
  String? jointOtherRemarks;
  int? jointRating;
  int? abutmentDepressionCondition;
  int? abutmentDepressionSeverity;
  int? abutmentDepressionExtent;
  String? abutmentDepressionRemarks;
  String? abutmentOthers;
  int? abutmentOthersCondition;
  int? abutmentOthersSeverity;
  int? abutmentOthersnExtent;
  String? abutmentOthersRemarks;
  int? abutmentRating;
  int? rfSignCondition;
  int? rfSignSeverity;
  int? rfSignExtent;
  String? rfSignRemarks;
  String? rfOthers;
  String? rfOthersCondition;
  int? rfOthersSeverity;
  int? rfOthersExtent;
  String? rfOthersRemarks;
  int? rfRating;

  SuperstructureSecondary(
      {this.deckStructureCondition,
      this.deckStructureSeverity,
      this.deckStructureExtent,
      this.deckStructureRemarks,
      this.deckServiceCondition,
      this.deckServiceSeverity,
      this.deckServiceExtent,
      this.deckServiceRemarks,
      this.deckOther,
      this.deckOtherCondition,
      this.deckOtherSeverity,
      this.deckOtherExtent,
      this.deckOtherRemarks,
      this.deckRating,
      this.parapetorDamageCondition,
      this.parapetorDamageSeverity,
      this.parapetorDamageExtent,
      this.parapetorDamageRemarks,
      this.parapetorStabilityCondition,
      this.parapetorStabilitySeverity,
      this.parapetorStabilityExtent,
      this.parapetorStabilityRemarks,
      this.parapetorCorrosionCondition,
      this.parapetorCorrosionSeverity,
      this.parapetorCorrosionExtent,
      this.parapetorCorrosionRemarks,
      this.parapetorCrackingCondition,
      this.parapetorCrackingSeverity,
      this.parapetorCrackingExtent,
      this.parapetorCrackingRemarks,
      this.parapetorSpallingCondition,
      this.parapetorSpallingSeverity,
      this.parapetorSpallingExtent,
      this.parapetorSpallingRemarks,
      this.parapetorOther,
      this.parapetorOtherCondition,
      this.parapetorOtherSeverity,
      this.parapetorOtherExtent,
      this.parapetorOtherRemarks,
      this.parapetorRating,
      this.jointType,
      this.jointTypeCondition,
      this.jointTypeSeverity,
      this.jointTypeExtent,
      this.jointTypeRemarks,
      this.jointNoiseCondition,
      this.jointNoiseSeverity,
      this.jointNoiseExtent,
      this.jointNoiseRemarks,
      this.jointAlignmentCondition,
      this.jointAlignmentSeverity,
      this.jointAlignmentExtent,
      this.jointAlignmentRemarks,
      this.jointLeakageCondition,
      this.jointLeakageSeverity,
      this.jointLeakageExtent,
      this.jointLeakageRemarks,
      this.jointOther,
      this.jointOtherCondition,
      this.jointOtherSeverity,
      this.jointOtherExtent,
      this.jointOtherRemarks,
      this.jointRating,
      this.abutmentDepressionCondition,
      this.abutmentDepressionSeverity,
      this.abutmentDepressionExtent,
      this.abutmentDepressionRemarks,
      this.abutmentOthers,
      this.abutmentOthersCondition,
      this.abutmentOthersSeverity,
      this.abutmentOthersnExtent,
      this.abutmentOthersRemarks,
      this.abutmentRating,
      this.rfSignCondition,
      this.rfSignSeverity,
      this.rfSignExtent,
      this.rfSignRemarks,
      this.rfOthers,
      this.rfOthersCondition,
      this.rfOthersSeverity,
      this.rfOthersExtent,
      this.rfOthersRemarks,
      this.rfRating});

  SuperstructureSecondary.fromJson(Map<String, dynamic> json) {
    deckStructureCondition = json['deck_structure_condition'];
    deckStructureSeverity = json['deck_structure_severity'];
    deckStructureExtent = json['deck_structure_extent'];
    deckStructureRemarks = json['deck_structure_remarks'];
    deckServiceCondition = json['deck_service_condition'];
    deckServiceSeverity = json['deck_service_severity'];
    deckServiceExtent = json['deck_service_extent'];
    deckServiceRemarks = json['deck_service_remarks'];
    deckOther = json['deck_other'];
    deckOtherCondition = json['deck_other_condition'];
    deckOtherSeverity = json['deck_other_severity'];
    deckOtherExtent = json['deck_other_extent'];
    deckOtherRemarks = json['deck_other_remarks'];
    deckRating = json['deck_rating'];
    parapetorDamageCondition = json['parapetor_damage_condition'];
    parapetorDamageSeverity = json['parapetor_damage_severity'];
    parapetorDamageExtent = json['parapetor_damage_extent'];
    parapetorDamageRemarks = json['parapetor_damage_remarks'];
    parapetorStabilityCondition = json['parapetor_stability_condition'];
    parapetorStabilitySeverity = json['parapetor_stability_severity'];
    parapetorStabilityExtent = json['parapetor_stability_extent'];
    parapetorStabilityRemarks = json['parapetor_stability_remarks'];
    parapetorCorrosionCondition = json['parapetor_corrosion_condition'];
    parapetorCorrosionSeverity = json['parapetor_corrosion_severity'];
    parapetorCorrosionExtent = json['parapetor_corrosion_extent'];
    parapetorCorrosionRemarks = json['parapetor_corrosion_remarks'];
    parapetorCrackingCondition = json['parapetor_cracking_condition'];
    parapetorCrackingSeverity = json['parapetor_cracking_severity'];
    parapetorCrackingExtent = json['parapetor_cracking_extent'];
    parapetorCrackingRemarks = json['parapetor_cracking_remarks'];
    parapetorSpallingCondition = json['parapetor_spalling_condition'];
    parapetorSpallingSeverity = json['parapetor_spalling_severity'];
    parapetorSpallingExtent = json['parapetor_spalling_extent'];
    parapetorSpallingRemarks = json['parapetor_spalling_remarks'];
    parapetorOther = json['parapetor_other'];
    parapetorOtherCondition = json['parapetor_other_condition'];
    parapetorOtherSeverity = json['parapetor_other_severity'];
    parapetorOtherExtent = json['parapetor_other_extent'];
    parapetorOtherRemarks = json['parapetor_other_remarks'];
    parapetorRating = json['parapetor_rating'];
    jointType = json['joint_type'];
    jointTypeCondition = json['joint_type_condition'];
    jointTypeSeverity = json['joint_type_severity'];
    jointTypeExtent = json['joint_type_extent'];
    jointTypeRemarks = json['joint_type_remarks'];
    jointNoiseCondition = json['joint_noise_condition'];
    jointNoiseSeverity = json['joint_noise_severity'];
    jointNoiseExtent = json['joint_noise_extent'];
    jointNoiseRemarks = json['joint_noise_remarks'];
    jointAlignmentCondition = json['joint_alignment_condition'];
    jointAlignmentSeverity = json['joint_alignment_severity'];
    jointAlignmentExtent = json['joint_alignment_extent'];
    jointAlignmentRemarks = json['joint_alignment_remarks'];
    jointLeakageCondition = json['joint_leakage_condition'];
    jointLeakageSeverity = json['joint_leakage_severity'];
    jointLeakageExtent = json['joint_leakage_extent'];
    jointLeakageRemarks = json['joint_leakage_remarks'];
    jointOther = json['joint_other'];
    jointOtherCondition = json['joint_other_condition'];
    jointOtherSeverity = json['joint_other_severity'];
    jointOtherExtent = json['joint_other_extent'];
    jointOtherRemarks = json['joint_other_remarks'];
    jointRating = json['joint_rating'];
    abutmentDepressionCondition = json['abutment_depression_condition'];
    abutmentDepressionSeverity = json['abutment_depression_severity'];
    abutmentDepressionExtent = json['abutment_depression_extent'];
    abutmentDepressionRemarks = json['abutment_depression_remarks'];
    abutmentOthers = json['abutment_others'];
    abutmentOthersCondition = json['abutment_others_condition'];
    abutmentOthersSeverity = json['abutment_others_severity'];
    abutmentOthersnExtent = json['abutment_othersn_extent'];
    abutmentOthersRemarks = json['abutment_others_remarks'];
    abutmentRating = json['abutment_rating'];
    rfSignCondition = json['rf_sign_condition'];
    rfSignSeverity = json['rf_sign_severity'];
    rfSignExtent = json['rf_sign_extent'];
    rfSignRemarks = json['rf_sign_remarks'];
    rfOthers = json['rf_others'];
    rfOthersCondition = json['rf_others_condition'];
    rfOthersSeverity = json['rf_others_severity'];
    rfOthersExtent = json['rf_others_extent'];
    rfOthersRemarks = json['rf_others_remarks'];
    rfRating = json['rf_rating'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['deck_structure_condition'] = deckStructureCondition;
    data['deck_structure_severity'] = deckStructureSeverity;
    data['deck_structure_extent'] = deckStructureExtent;
    data['deck_structure_remarks'] = deckStructureRemarks;
    data['deck_service_condition'] = deckServiceCondition;
    data['deck_service_severity'] = deckServiceSeverity;
    data['deck_service_extent'] = deckServiceExtent;
    data['deck_service_remarks'] = deckServiceRemarks;
    data['deck_other'] = deckOther;
    data['deck_other_condition'] = deckOtherCondition;
    data['deck_other_severity'] = deckOtherSeverity;
    data['deck_other_extent'] = deckOtherExtent;
    data['deck_other_remarks'] = deckOtherRemarks;
    data['deck_rating'] = deckRating;
    data['parapetor_damage_condition'] = parapetorDamageCondition;
    data['parapetor_damage_severity'] = parapetorDamageSeverity;
    data['parapetor_damage_extent'] = parapetorDamageExtent;
    data['parapetor_damage_remarks'] = parapetorDamageRemarks;
    data['parapetor_stability_condition'] = parapetorStabilityCondition;
    data['parapetor_stability_severity'] = parapetorStabilitySeverity;
    data['parapetor_stability_extent'] = parapetorStabilityExtent;
    data['parapetor_stability_remarks'] = parapetorStabilityRemarks;
    data['parapetor_corrosion_condition'] = parapetorCorrosionCondition;
    data['parapetor_corrosion_severity'] = parapetorCorrosionSeverity;
    data['parapetor_corrosion_extent'] = parapetorCorrosionExtent;
    data['parapetor_corrosion_remarks'] = parapetorCorrosionRemarks;
    data['parapetor_cracking_condition'] = parapetorCrackingCondition;
    data['parapetor_cracking_severity'] = parapetorCrackingSeverity;
    data['parapetor_cracking_extent'] = parapetorCrackingExtent;
    data['parapetor_cracking_remarks'] = parapetorCrackingRemarks;
    data['parapetor_spalling_condition'] = parapetorSpallingCondition;
    data['parapetor_spalling_severity'] = parapetorSpallingSeverity;
    data['parapetor_spalling_extent'] = parapetorSpallingExtent;
    data['parapetor_spalling_remarks'] = parapetorSpallingRemarks;
    data['parapetor_other'] = parapetorOther;
    data['parapetor_other_condition'] = parapetorOtherCondition;
    data['parapetor_other_severity'] = parapetorOtherSeverity;
    data['parapetor_other_extent'] = parapetorOtherExtent;
    data['parapetor_other_remarks'] = parapetorOtherRemarks;
    data['parapetor_rating'] = parapetorRating;
    data['joint_type'] = jointType;
    data['joint_type_condition'] = jointTypeCondition;
    data['joint_type_severity'] = jointTypeSeverity;
    data['joint_type_extent'] = jointTypeExtent;
    data['joint_type_remarks'] = jointTypeRemarks;
    data['joint_noise_condition'] = jointNoiseCondition;
    data['joint_noise_severity'] = jointNoiseSeverity;
    data['joint_noise_extent'] = jointNoiseExtent;
    data['joint_noise_remarks'] = jointNoiseRemarks;
    data['joint_alignment_condition'] = jointAlignmentCondition;
    data['joint_alignment_severity'] = jointAlignmentSeverity;
    data['joint_alignment_extent'] = jointAlignmentExtent;
    data['joint_alignment_remarks'] = jointAlignmentRemarks;
    data['joint_leakage_condition'] = jointLeakageCondition;
    data['joint_leakage_severity'] = jointLeakageSeverity;
    data['joint_leakage_extent'] = jointLeakageExtent;
    data['joint_leakage_remarks'] = jointLeakageRemarks;
    data['joint_other'] = jointOther;
    data['joint_other_condition'] = jointOtherCondition;
    data['joint_other_severity'] = jointOtherSeverity;
    data['joint_other_extent'] = jointOtherExtent;
    data['joint_other_remarks'] = jointOtherRemarks;
    data['joint_rating'] = jointRating;
    data['abutment_depression_condition'] = abutmentDepressionCondition;
    data['abutment_depression_severity'] = abutmentDepressionSeverity;
    data['abutment_depression_extent'] = abutmentDepressionExtent;
    data['abutment_depression_remarks'] = abutmentDepressionRemarks;
    data['abutment_others'] = abutmentOthers;
    data['abutment_others_condition'] = abutmentOthersCondition;
    data['abutment_others_severity'] = abutmentOthersSeverity;
    data['abutment_othersn_extent'] = abutmentOthersnExtent;
    data['abutment_others_remarks'] = abutmentOthersRemarks;
    data['abutment_rating'] = abutmentRating;
    data['rf_sign_condition'] = rfSignCondition;
    data['rf_sign_severity'] = rfSignSeverity;
    data['rf_sign_extent'] = rfSignExtent;
    data['rf_sign_remarks'] = rfSignRemarks;
    data['rf_others'] = rfOthers;
    data['rf_others_condition'] = rfOthersCondition;
    data['rf_others_severity'] = rfOthersSeverity;
    data['rf_others_extent'] = rfOthersExtent;
    data['rf_others_remarks'] = rfOthersRemarks;
    data['rf_rating'] = rfRating;
    return data;
  }
}
