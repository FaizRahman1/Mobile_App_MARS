import 'dart:convert';

class SuperstructureSecondaryModel {
  final String id;
  final String dateofinspection;
  final String dateoflastinspection;
  final String inspectedby;
  final String deckStructureCondition;
  final String deckStructureSeverity;
  final String deckStructureExtent;
  final String deckStructureRemarks;
  final String deckServiceCondition;
  final String deckServiceSeverity;
  final String deckServiceExtent;
  final String deckServiceRemarks;
  final String deckOther;
  final String deckOtherCondition;
  final String deckOtherSeverity;
  final String deckOtherExtent;
  final String deckOtherRemarks;
  final int deckRating;
  final String parapetorDamageCondition;
  final String parapetorDamageSeverity;
  final String parapetorDamageExtent;
  final String parapetorDamageRemarks;
  final String parapetorStabilityCondition;
  final String parapetorStabilitySeverity;
  final String parapetorStabilityExtent;
  final String parapetorStabilityRemarks;
  final String parapetorCorrosionCondition;
  final String parapetorCorrosionSeverity;
  final String parapetorCorrosionExtent;
  final String parapetorCorrosionRemarks;
  final String parapetorCrackingCondition;
  final String parapetorCrackingSeverity;
  final String parapetorCrackingExtent;
  final String parapetorCrackingRemarks;
  final String parapetorSpallingCondition;
  final String parapetorSpallingSeverity;
  final String parapetorSpallingExtent;
  final String parapetorSpallingRemarks;
  final String parapetorOther;
  final String parapetorOtherCondition;
  final String parapetorOtherSeverity;
  final String parapetorOtherExtent;
  final String parapetorOtherRemarks;
  final int parapetorRating;
  final String jointType;
  final String jointTypeCondition;
  final String jointTypeSeverity;
  final String jointTypeExtent;
  final String jointTypeRemarks;
  final String jointNoiseCondition;
  final String jointNoiseSeverity;
  final String jointNoiseExtent;
  final String jointNoiseRemarks;
  final String jointAlignmentCondition;
  final String jointAlignmentSeverity;
  final String jointAlignmentExtent;
  final String jointAlignmentRemarks;
  final String jointLeakageCondition;
  final String jointLeakageSeverity;
  final String jointLeakageExtent;
  final String jointLeakageRemarks;
  final String jointOther;
  final String jointOtherCondition;
  final String jointOtherSeverity;
  final String jointOtherExtent;
  final String jointOtherRemarks;
  final int jointRating;
  final String abutmentDepressionCondition;
  final String abutmentDepressionSeverity;
  final String abutmentDepressionExtent;
  final String abutmentDepressionRemarks;
  final String abutmentOthers;
  final String abutmentOthersCondition;
  final String abutmentOthersSeverity;
  final String abutmentOthersnExtent;
  final String abutmentOthersRemarks;
  final String abutmentRating;
  final String rfSignCondition;
  final String rfSignSeverity;
  final String rfSignExtent;
  final String rfSignRemarks;
  final String rfOthers;
  final String rfOthersCondition;
  final String rfOthersSeverity;
  final String rfOthersExtent;
  final String rfOthersRemarks;
  final String rfRating;

  SuperstructureSecondaryModel(
    this.id,
    this.dateofinspection,
    this.dateoflastinspection,
    this.inspectedby,
    this.deckStructureCondition,
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
    this.rfRating,
  );

  SuperstructureSecondaryModel copyWith({
    String? id,
    String? dateofinspection,
    String? dateoflastinspection,
    String? inspectedby,
    String? deckStructureCondition,
    String? deckStructureSeverity,
    String? deckStructureExtent,
    String? deckStructureRemarks,
    String? deckServiceCondition,
    String? deckServiceSeverity,
    String? deckServiceExtent,
    String? deckServiceRemarks,
    String? deckOther,
    String? deckOtherCondition,
    String? deckOtherSeverity,
    String? deckOtherExtent,
    String? deckOtherRemarks,
    int? deckRating,
    String? parapetorDamageCondition,
    String? parapetorDamageSeverity,
    String? parapetorDamageExtent,
    String? parapetorDamageRemarks,
    String? parapetorStabilityCondition,
    String? parapetorStabilitySeverity,
    String? parapetorStabilityExtent,
    String? parapetorStabilityRemarks,
    String? parapetorCorrosionCondition,
    String? parapetorCorrosionSeverity,
    String? parapetorCorrosionExtent,
    String? parapetorCorrosionRemarks,
    String? parapetorCrackingCondition,
    String? parapetorCrackingSeverity,
    String? parapetorCrackingExtent,
    String? parapetorCrackingRemarks,
    String? parapetorSpallingCondition,
    String? parapetorSpallingSeverity,
    String? parapetorSpallingExtent,
    String? parapetorSpallingRemarks,
    String? parapetorOther,
    String? parapetorOtherCondition,
    String? parapetorOtherSeverity,
    String? parapetorOtherExtent,
    String? parapetorOtherRemarks,
    int? parapetorRating,
    String? jointType,
    String? jointTypeCondition,
    String? jointTypeSeverity,
    String? jointTypeExtent,
    String? jointTypeRemarks,
    String? jointNoiseCondition,
    String? jointNoiseSeverity,
    String? jointNoiseExtent,
    String? jointNoiseRemarks,
    String? jointAlignmentCondition,
    String? jointAlignmentSeverity,
    String? jointAlignmentExtent,
    String? jointAlignmentRemarks,
    String? jointLeakageCondition,
    String? jointLeakageSeverity,
    String? jointLeakageExtent,
    String? jointLeakageRemarks,
    String? jointOther,
    String? jointOtherCondition,
    String? jointOtherSeverity,
    String? jointOtherExtent,
    String? jointOtherRemarks,
    int? jointRating,
    String? abutmentDepressionCondition,
    String? abutmentDepressionSeverity,
    String? abutmentDepressionExtent,
    String? abutmentDepressionRemarks,
    String? abutmentOthers,
    String? abutmentOthersCondition,
    String? abutmentOthersSeverity,
    String? abutmentOthersnExtent,
    String? abutmentOthersRemarks,
    String? abutmentRating,
    String? rfSignCondition,
    String? rfSignSeverity,
    String? rfSignExtent,
    String? rfSignRemarks,
    String? rfOthers,
    String? rfOthersCondition,
    String? rfOthersSeverity,
    String? rfOthersExtent,
    String? rfOthersRemarks,
    String? rfRating,
  }) {
    return SuperstructureSecondaryModel(
      id ?? this.id,
      dateofinspection ?? this.dateofinspection,
      dateoflastinspection ?? this.dateoflastinspection,
      inspectedby ?? this.inspectedby,
      deckStructureCondition ?? this.deckStructureCondition,
      deckStructureSeverity ?? this.deckStructureSeverity,
      deckStructureExtent ?? this.deckStructureExtent,
      deckStructureRemarks ?? this.deckStructureRemarks,
      deckServiceCondition ?? this.deckServiceCondition,
      deckServiceSeverity ?? this.deckServiceSeverity,
      deckServiceExtent ?? this.deckServiceExtent,
      deckServiceRemarks ?? this.deckServiceRemarks,
      deckOther ?? this.deckOther,
      deckOtherCondition ?? this.deckOtherCondition,
      deckOtherSeverity ?? this.deckOtherSeverity,
      deckOtherExtent ?? this.deckOtherExtent,
      deckOtherRemarks ?? this.deckOtherRemarks,
      deckRating ?? this.deckRating,
      parapetorDamageCondition ?? this.parapetorDamageCondition,
      parapetorDamageSeverity ?? this.parapetorDamageSeverity,
      parapetorDamageExtent ?? this.parapetorDamageExtent,
      parapetorDamageRemarks ?? this.parapetorDamageRemarks,
      parapetorStabilityCondition ?? this.parapetorStabilityCondition,
      parapetorStabilitySeverity ?? this.parapetorStabilitySeverity,
      parapetorStabilityExtent ?? this.parapetorStabilityExtent,
      parapetorStabilityRemarks ?? this.parapetorStabilityRemarks,
      parapetorCorrosionCondition ?? this.parapetorCorrosionCondition,
      parapetorCorrosionSeverity ?? this.parapetorCorrosionSeverity,
      parapetorCorrosionExtent ?? this.parapetorCorrosionExtent,
      parapetorCorrosionRemarks ?? this.parapetorCorrosionRemarks,
      parapetorCrackingCondition ?? this.parapetorCrackingCondition,
      parapetorCrackingSeverity ?? this.parapetorCrackingSeverity,
      parapetorCrackingExtent ?? this.parapetorCrackingExtent,
      parapetorCrackingRemarks ?? this.parapetorCrackingRemarks,
      parapetorSpallingCondition ?? this.parapetorSpallingCondition,
      parapetorSpallingSeverity ?? this.parapetorSpallingSeverity,
      parapetorSpallingExtent ?? this.parapetorSpallingExtent,
      parapetorSpallingRemarks ?? this.parapetorSpallingRemarks,
      parapetorOther ?? this.parapetorOther,
      parapetorOtherCondition ?? this.parapetorOtherCondition,
      parapetorOtherSeverity ?? this.parapetorOtherSeverity,
      parapetorOtherExtent ?? this.parapetorOtherExtent,
      parapetorOtherRemarks ?? this.parapetorOtherRemarks,
      parapetorRating ?? this.parapetorRating,
      jointType ?? this.jointType,
      jointTypeCondition ?? this.jointTypeCondition,
      jointTypeSeverity ?? this.jointTypeSeverity,
      jointTypeSeverity ?? this.jointTypeExtent,
      jointTypeRemarks ?? this.jointTypeRemarks,
      jointNoiseCondition ?? this.jointNoiseCondition,
      jointNoiseSeverity ?? this.jointNoiseSeverity,
      jointNoiseExtent ?? this.jointNoiseExtent,
      jointNoiseRemarks ?? this.jointNoiseRemarks,
      jointAlignmentCondition ?? this.jointAlignmentCondition,
      jointAlignmentSeverity ?? this.jointAlignmentSeverity,
      jointAlignmentExtent ?? this.jointAlignmentExtent,
      jointAlignmentRemarks ?? this.jointAlignmentRemarks,
      jointLeakageCondition ?? this.jointLeakageCondition,
      jointLeakageSeverity ?? this.jointLeakageSeverity,
      jointLeakageExtent ?? this.jointLeakageExtent,
      jointLeakageRemarks ?? this.jointLeakageRemarks,
      jointOther ?? this.jointOther,
      jointOtherCondition ?? this.jointOtherCondition,
      jointOtherSeverity ?? this.jointOtherSeverity,
      jointOtherExtent ?? this.jointOtherExtent,
      jointOtherRemarks ?? this.jointOtherRemarks,
      jointRating ?? this.jointRating,
      abutmentDepressionCondition ?? this.abutmentDepressionCondition,
      abutmentDepressionSeverity ?? this.abutmentDepressionSeverity,
      abutmentDepressionExtent ?? this.abutmentDepressionExtent,
      abutmentDepressionRemarks ?? this.abutmentDepressionRemarks,
      abutmentOthers ?? this.abutmentOthers,
      abutmentOthersCondition ?? this.abutmentOthersCondition,
      abutmentOthersSeverity ?? this.abutmentOthersSeverity,
      abutmentOthersnExtent ?? this.abutmentOthersnExtent,
      abutmentOthersRemarks ?? this.abutmentOthersRemarks,
      abutmentRating ?? this.abutmentRating,
      rfSignCondition ?? this.rfSignCondition,
      rfSignSeverity ?? this.rfSignSeverity,
      rfSignExtent ?? this.rfSignExtent,
      rfSignRemarks ?? this.rfSignRemarks,
      rfOthers ?? this.rfOthers,
      rfOthersCondition ?? this.rfOthersCondition,
      rfOthersSeverity ?? this.rfOthersSeverity,
      rfOthersExtent ?? this.rfOthersExtent,
      rfOthersRemarks ?? this.rfOthersRemarks,
      rfRating ?? this.rfRating,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'dateofinspection': dateofinspection,
      'dateoflastinspection': dateoflastinspection,
      'inspectedby': inspectedby,
      'deck_structure_condition': deckStructureCondition,
      'deck_structure_severity': deckStructureSeverity,
      'deck_structure_extent': deckStructureExtent,
      'deck_structure_remarks': deckStructureRemarks,
      'deck_service_condition': deckServiceCondition,
      'deck_service_severity': deckServiceSeverity,
      'deck_service_extent': deckServiceExtent,
      'deck_service_remarks': deckServiceRemarks,
      'deck_other': deckOther,
      'deck_other_condition': deckOtherCondition,
      'deck_other_severity': deckOtherSeverity,
      'deck_other_extent': deckOtherExtent,
      'deck_other_remarks': deckOtherRemarks,
      'deck_rating': deckRating,
      'parapetor_damage_condition': parapetorDamageCondition,
      'parapetor_damage_severity': parapetorDamageSeverity,
      'parapetor_damage_extent': parapetorDamageExtent,
      'parapetor_damage_remarks': parapetorDamageRemarks,
      'parapetor_stability_condition': parapetorStabilityCondition,
      'parapetor_stability_severity': parapetorStabilitySeverity,
      'parapetor_stability_extent': parapetorStabilityExtent,
      'parapetor_stability_remarks': parapetorStabilityRemarks,
      'parapetor_corrosion_condition': parapetorCorrosionCondition,
      'parapetor_corrosion_severity': parapetorCorrosionSeverity,
      'parapetor_corrosion_extent': parapetorCorrosionExtent,
      'parapetor_corrosion_remarks': parapetorCorrosionRemarks,
      'parapetor_cracking_condition': parapetorCrackingCondition,
      'parapetor_cracking_severity': parapetorCrackingSeverity,
      'parapetor_cracking_extent': parapetorCrackingExtent,
      'parapetor_cracking_remarks': parapetorCrackingRemarks,
      'parapetor_spalling_condition': parapetorSpallingCondition,
      'parapetor_spalling_severity': parapetorSpallingSeverity,
      'parapetor_spalling_extent': parapetorSpallingExtent,
      'parapetor_spalling_remarks': parapetorSpallingRemarks,
      'parapetor_other': parapetorOther,
      'parapetor_other_condition': parapetorOtherCondition,
      'parapetor_other_severity': parapetorOtherSeverity,
      'parapetor_other_extent': parapetorOtherExtent,
      'parapetor_other_remarks': parapetorOtherRemarks,
      'parapetor_rating': parapetorRating,
      'joint_type': jointType,
      'joint_type_condition': jointTypeCondition,
      'joint_type_severity': jointTypeSeverity,
      'joint_type_extent': jointTypeExtent,
      'joint_type_remarks': jointTypeRemarks,
      'joint_noise_condition': jointNoiseCondition,
      'joint_noise_severity': jointNoiseSeverity,
      'joint_noise_extent': jointNoiseExtent,
      'joint_noise_remarks': jointNoiseRemarks,
      'joint_alignment_condition': jointAlignmentCondition,
      'joint_alignment_severity': jointAlignmentSeverity,
      'joint_alignment_extent': jointAlignmentExtent,
      'joint_alignment_remarks': jointAlignmentRemarks,
      'joint_leakage_condition': jointLeakageCondition,
      'joint_leakage_severity': jointLeakageSeverity,
      'joint_leakage_extent': jointLeakageExtent,
      'joint_leakage_remarks': jointLeakageRemarks,
      'joint_other': jointOther,
      'joint_other_condition': jointOtherCondition,
      'joint_other_severity': jointOtherSeverity,
      'joint_other_extent': jointOtherExtent,
      'joint_other_remarks': jointOtherRemarks,
      'joint_rating': jointRating,
      'abutment_depression_condition': abutmentDepressionCondition,
      'abutment_depression_severity': abutmentDepressionSeverity,
      'abutment_others_remarks': abutmentOthersRemarks,
      'abutment_rating': abutmentRating,
      'rf_sign_condition': rfSignCondition,
      'rf_sign_severity': rfSignSeverity,
      'rf_sign_extent': rfSignExtent,
      'rf_sign_remarks': rfSignRemarks,
      'rf_others': rfOthers,
      'rf_others_condition': rfOthersCondition,
      'rf_others_severity': rfOthersSeverity,
      'rf_others_extent': rfOthersExtent,
      'rf_others_remarks': rfOthersRemarks,
      'rf_rating': rfRating,
    };
  }

  factory SuperstructureSecondaryModel.fromMap(Map<String, dynamic> map) {
    return SuperstructureSecondaryModel(
      map['id'] ?? '',
      map['dateofinspection'] ?? '',
      map['dateoflastinspection'] ?? '',
      map['inspectedby'] ?? '',
      map['deck_structure_condition'] ?? '',
      map['deck_structure_severity'] ?? '',
      map['deck_structure_extent'] ?? '',
      map['deck_structure_remarks'] ?? '',
      map['deck_service_condition'] ?? '',
      map['deck_service_severity'] ?? '',
      map['deck_service_extent'] ?? '',
      map['deck_service_remarks'] ?? '',
      map['deck_other'] ?? '',
      map['deck_other_condition'] ?? '',
      map['deck_other_severity'] ?? '',
      map['deck_other_extent'] ?? '',
      map['deck_other_remarks'] ?? '',
      map['deck_rating'] ?? '',
      map['parapetor_damage_condition'] ?? '',
      map['parapetor_damage_severity'] ?? '',
      map['parapetor_damage_extent'] ?? '',
      map['parapetor_damage_remarks'] ?? '',
      map['parapetor_stability_condition'] ?? '',
      map['parapetor_stability_severity'] ?? '',
      map['parapetor_stability_extent'] ?? '',
      map['parapetor_stability_remarks'] ?? '',
      map['parapetor_corrosion_condition'] ?? '',
      map['parapetor_corrosion_severity'] ?? '',
      map['parapetor_corrosion_extent'] ?? '',
      map['parapetor_corrosion_remarks'] ?? '',
      map['parapetor_cracking_condition'] ?? '',
      map['parapetor_cracking_severity'] ?? '',
      map['parapetor_cracking_extent'] ?? '',
      map['parapetor_cracking_remarks'] ?? '',
      map['parapetor_spalling_condition'] ?? '',
      map['parapetor_spalling_severity'] ?? '',
      map['parapetor_spalling_extent'] ?? '',
      map['parapetor_spalling_remarks'] ?? '',
      map['parapetor_other'] ?? '',
      map['parapetor_other_condition'] ?? '',
      map['parapetor_other_severity'] ?? '',
      map['parapetor_other_extent'] ?? '',
      map['parapetor_other_remarks'] ?? '',
      map['parapetor_rating'] ?? '',
      map['joint_type'] ?? '',
      map['joint_type_condition'] ?? '',
      map['joint_type_severity'] ?? '',
      map['joint_type_extent'] ?? '',
      map['joint_type_remarks'] ?? '',
      map['joint_noise_condition'] ?? '',
      map['joint_noise_severity'] ?? '',
      map['joint_noise_extent'] ?? '',
      map['joint_noise_remarks'] ?? '',
      map['joint_alignment_condition'] ?? '',
      map['joint_alignment_severity'] ?? '',
      map['joint_alignment_extent'] ?? '',
      map['joint_alignment_remarks'] ?? '',
      map['joint_leakage_condition'] ?? '',
      map['joint_leakage_severity'] ?? '',
      map['joint_leakage_extent'] ?? '',
      map['joint_leakage_remarks'] ?? '',
      map['joint_other'] ?? '',
      map['joint_other_condition'] ?? '',
      map['joint_other_severity'] ?? '',
      map['joint_other_extent'] ?? '',
      map['joint_other_remarks'] ?? '',
      map['joint_rating'] ?? '',
      map['abutment_depression_condition'] ?? '',
      map['abutment_depression_severity'] ?? '',
      map['abutment_depression_extent'] ?? '',
      map['abutment_depression_remarks'] ?? '',
      map['abutment_others'] ?? '',
      map['abutment_others_condition'] ?? '',
      map['abutment_others_severity'] ?? '',
      map['abutment_othersn_extent'] ?? '',
      map['abutment_others_remarks'] ?? '',
      map['abutment_rating'] ?? '',
      map['rf_sign_condition'] ?? '',
      map['rf_sign_severity'] ?? '',
      map['rf_sign_extent'] ?? '',
      map['rf_sign_remarks'] ?? '',
      map['rf_others'] ?? '',
      map['rf_others_condition'] ?? '',
      map['rf_others_severity'] ?? '',
      map['rf_others_extent'] ?? '',
      map['rf_others_remarks'] ?? '',
      map['rf_rating'] ?? '',
    );
  }

  String toJSon() => json.encode(toMap());

  factory SuperstructureSecondaryModel.fromJson(String source) =>
      SuperstructureSecondaryModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'SuperstructureSecondaryModel(id: $id, dateofinspection: $dateofinspection, dateoflastinspection: $dateoflastinspection, inspectedby: $inspectedby, deckStructureCondition : $deckStructureCondition,deckStructureSeverity : $deckStructureSeverity)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is SuperstructureSecondaryModel &&
        other.id == id &&
        other.dateofinspection == dateofinspection &&
        other.dateofinspection == dateoflastinspection &&
        other.inspectedby == inspectedby &&
        other.abutmentDepressionCondition == abutmentDepressionCondition;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        dateofinspection.hashCode ^
        dateoflastinspection.hashCode ^
        inspectedby.hashCode ^
        abutmentDepressionCondition.hashCode;
  }
}
