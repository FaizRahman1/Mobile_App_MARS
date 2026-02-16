import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:bridgeinsp_new/models/brpost_model.dart';
import 'package:bridgeinsp_new/resources/datasent_repository.dart';

part 'datasend_event.dart';
part 'datasend_state.dart';

class DatasendBloc extends Bloc<DatasendEvent, DatasendState> {
  final DatasendRepos datasendRepos;

  DatasendBloc(this.datasendRepos) : super(DatasendInitial()) {
    on<SendData>(_onSendData);
  }

  Future<void> _onSendData(SendData event, Emitter<DatasendState> emit) async {
    emit(DatasendLoading());

    try {
      debugPrint("bloc received: sending ${event.inspection.id}");

      final AlertDialog dialog =
          await datasendRepos.senddetaillist(event.inspection);

      emit(DatasendLoaded(dialog));
    } catch (e) {
      debugPrint("SendData error: $e");
      emit(DatasendError(e.toString()));
    }
  }
}
