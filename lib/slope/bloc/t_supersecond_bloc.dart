import 'package:bloc/bloc.dart';
import 'package:bridgeinsp_new/slope/slmodels/t_secondary_model.dart';
import 'package:bridgeinsp_new/slope/services/t_supersecond_repository.dart';
import 'package:equatable/equatable.dart';

part 't_supersecond_event.dart';
part 't_supersecond_state.dart';

class TSupersecondBloc extends Bloc<TSupersecondEvent, TSupersecondState> {
  late SuperstructureSecondaryModel data;
  final SuperstructureSecondaryRepository superstructureSecondaryRepository;

  TSupersecondBloc(this.superstructureSecondaryRepository)
      : super(InitialState()) {
    on<TSupersecondEvent>((event, emit) async {
      if (event is SendData) {
        emit(TSupersecondLoading());
        await Future.delayed(const Duration(seconds: 3), () async {
          data = await superstructureSecondaryRepository.fetchSupersecond(
              event.id,
              event.dateofinspection,
              event.dateoflastinspection,
              event.inspectedby,
              event.deckStructureCondition,
              event.deckStructureSeverity,
              event.deckStructureExtent,
              event.deckStructureRemarks,
              event.deckServiceCondition,
              event.deckServiceSeverity,
              event.deckServiceExtent,
              event.deckServiceRemarks,
              event.deckOther,
              event.deckOtherCondition,
              event.deckOtherSeverity,
              event.deckOtherExtent,
              event.deckOtherRemarks,
              event.deckRating,
              event.parapetorDamageCondition,
              event.parapetorDamageSeverity,
              event.parapetorDamageExtent,
              event.parapetorDamageRemarks,
              event.parapetorStabilityCondition,
              event.parapetorStabilitySeverity,
              event.parapetorStabilityExtent,
              event.parapetorStabilityRemarks,
              event.parapetorCorrosionCondition,
              event.parapetorCorrosionSeverity,
              event.parapetorCorrosionExtent,
              event.parapetorCorrosionRemarks,
              event.parapetorCrackingCondition,
              event.parapetorCrackingSeverity,
              event.parapetorCrackingExtent,
              event.parapetorCrackingRemarks,
              event.parapetorSpallingCondition,
              event.parapetorSpallingSeverity,
              event.parapetorSpallingExtent,
              event.parapetorSpallingRemarks,
              event.parapetorOther,
              event.parapetorOtherCondition,
              event.parapetorOtherSeverity,
              event.parapetorOtherExtent,
              event.parapetorOtherRemarks,
              event.parapetorRating,
              event.jointType,
              event.jointTypeCondition,
              event.jointTypeSeverity,
              event.jointTypeExtent,
              event.jointTypeRemarks,
              event.jointNoiseCondition,
              event.jointNoiseSeverity,
              event.jointNoiseExtent,
              event.jointNoiseRemarks,
              event.jointAlignmentCondition,
              event.jointAlignmentSeverity,
              event.jointAlignmentExtent,
              event.jointAlignmentRemarks,
              event.jointLeakageCondition,
              event.jointLeakageSeverity,
              event.jointLeakageExtent,
              event.jointLeakageRemarks,
              event.jointOther,
              event.jointOtherCondition,
              event.jointOtherSeverity,
              event.jointOtherExtent,
              event.jointOtherRemarks,
              event.jointRating,
              event.abutmentDepressionCondition,
              event.abutmentDepressionSeverity,
              event.abutmentOthersRemarks,
              event.abutmentRating,
              event.rfSignCondition,
              event.rfSignSeverity,
              event.rfSignExtent,
              event.rfSignRemarks,
              event.rfOthers,
              event.rfOthersCondition,
              event.rfOthersSeverity,
              event.rfOthersExtent,
              event.rfOthersRemarks,
              event.rfRating,
              event.status);
          emit(TSupersecondLoaded());
        });
      }
    });
  }
}
