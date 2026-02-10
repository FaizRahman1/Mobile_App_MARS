import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:bridgeinsp_new/models/brpost_model.dart';
import 'package:bridgeinsp_new/resources/datasent_repository.dart';

part 'datasend_event.dart';
part 'datasend_state.dart';

class DatasendBloc extends Bloc<DatasendEvent, DatasendState> {
  late AlertDialog data;
  final DatasendRepos DatasendReposs;

  DatasendBloc(this.DatasendReposs) : super(DatasendInitial()) {
    on<DatasendEvent>((event, emit) async {
      if (event is SendData) {
        emit(DatasendLoading());
        await Future.delayed(const Duration(seconds: 3), () async {
          print("bloc received");
          data = (await DatasendReposs.senddetaillist(event.name));
          emit(DatasendLoaded(data as brpostmodel));
        });
      }
    });
  }
}
