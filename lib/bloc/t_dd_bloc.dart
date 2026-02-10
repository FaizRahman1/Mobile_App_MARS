import 'package:bloc/bloc.dart';
import 'package:bridgeinsp_new/models/t_dd_model.dart';
import 'package:bridgeinsp_new/resources/t_dd_repository.dart';
import 'package:equatable/equatable.dart';

part 't_dd_event.dart';
part 't_dd_state.dart';

class TDdBloc extends Bloc<TDdEvent, TDdState> {
  TDdBloc() : super(TDdInitial()) {
    final ApiRepositoryTDeckDrainage apiRepositoryDeckDrainage =
        ApiRepositoryTDeckDrainage();

    on<GetTDeckDrainageList>((event, emit) async {
      try {
        emit(TDdLoading());
        final mList = await apiRepositoryDeckDrainage.fetchTDeckDrainage();
        emit(TDdLoaded(mList));
        if (mList.error != null) {
          emit(TDdError(mList.error));
        }
      } on NetworkError {
        emit(const TDdError("Failed to fetch data"));
      }
    });
  }
}
