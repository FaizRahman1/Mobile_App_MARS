import 'package:bloc/bloc.dart';
import 'package:bridgeinsp_new/slope/resources/datasent_repository.dart';
import 'package:bridgeinsp_new/slope/slmodels/slopepost_model.dart';
import 'package:flutter/material.dart';

part 'datasend_event.dart';
part 'datasend_state.dart';

class DatasendBloc extends Bloc<DatasendEvent, DatasendState> {
  final SLDatasendRepos datasendRepos;

  DatasendBloc(this.datasendRepos) : super(DatasendInitial()) {
    on<SendData>(_onSendData);
  }

  Future<void> _onSendData(
    SendData event,
    Emitter<DatasendState> emit,
  ) async {
    emit(DatasendLoading());

    try {
      debugPrint(
        'Bloc received: sending ${event.inspection.id}',
      );

      final AlertDialog dialog =
          await datasendRepos.senddetaillist(
        event.inspection,
      );

      emit(DatasendLoaded(dialog));
    } catch (error, stackTrace) {
      debugPrint('SendData error: $error');
      debugPrintStack(stackTrace: stackTrace);

      emit(
        DatasendError(
          error.toString(),
        ),
      );
    }
  }
}
