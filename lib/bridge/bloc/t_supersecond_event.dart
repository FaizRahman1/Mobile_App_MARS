part of 't_supersecond_bloc.dart';

abstract class TSupersecondEvent extends Equatable {
  //const TSupersecondEvent();

  @override
  List<Object> get props => [];
}

class SendData extends TSupersecondEvent {
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
  final String deckRating;
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
  final String parapetorRating;
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
  final String jointRating;
  final String abutmentDepressionCondition;
  final String abutmentDepressionSeverity;
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
  final String status;

  SendData(
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
      this.status);
}
