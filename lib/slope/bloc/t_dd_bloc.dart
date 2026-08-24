import 'package:bloc/bloc.dart';
import 'package:bridgeinsp_new/slope/slmodels/t_dd_model.dart';
import 'package:bridgeinsp_new/slope/resources/t_dd_repository.dart';
import 'package:equatable/equatable.dart';

part 't_dd_event.dart';
part 't_dd_state.dart';

class TDdBloc extends Bloc<TDdEvent, TDdState> {
  TDdBloc() : super(TDdInitial()) {
    final ApiRepositoryTDeckSlope apiRepositoryDeckSlope =
        ApiRepositoryTDeckSlope();

    on<GetTDeckSlopeList>((event, emit) async {
      try {
        emit(TDdLoading());
        final mList = await apiRepositoryDeckSlope.fetchTDeckSlope();
        emit(TDdLoaded(mList as TDeckSlopeModel));
        if (mList.error != null) {
          emit(TDdError(mList.error));
        }
      } on NetworkError {
        emit(const TDdError("Failed to fetch data"));
      }
    });
  }
}
