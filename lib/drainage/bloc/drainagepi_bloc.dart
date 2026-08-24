import 'package:bloc/bloc.dart';
import 'package:bridgeinsp_new/drainage/Drmodels/Drainageinspection_model.dart';
import 'package:bridgeinsp_new/drainage/resources/drainageinspection_repository.dart';
import 'package:equatable/equatable.dart';

part 'drainagepi_event.dart';
part 'drainagepi_state.dart';

class DrainagepiBloc extends Bloc<DrainagepiEvent, DrainagepiState> {
  final String? utl;
  final DateTime? date;

  DrainagepiBloc({required this.utl, required this.date})
      : super(DrainagepiInitial()) {
    final ApiRepositoryDrainagepi ApiRepository =
        ApiRepositoryDrainagepi(url1: utl, date1: date);

    on<GetDrainagepiList>((event, emit) async {
      try {
        emit(DrainagepiLoading());
        final mdetail = await ApiRepository.GetDrainagepiList();
        emit(DrainagepiLoaded(mdetail!));
        if (mdetail.error != null) {
          emit(DrainagepiError(mdetail.error));
        }
      } on NetworkError {
        emit(const DrainagepiError(
            "Failed to fetch data. is your device online?"));
      }
      // TODO: implement event handler
    });
  }
}
