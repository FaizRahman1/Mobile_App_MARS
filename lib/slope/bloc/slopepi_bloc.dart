import 'package:bloc/bloc.dart';
import 'package:bridgeinsp_new/slope/slmodels/slopeinspection_model.dart';
import 'package:bridgeinsp_new/slope/resources/slopeinspection_repository.dart';
import 'package:equatable/equatable.dart';

part 'slopepi_event.dart';
part 'slopepi_state.dart';

class SlopepiBloc extends Bloc<SlopepiEvent, SlopepiState> {
  final String? utl;
  final DateTime? date;

  SlopepiBloc({required this.utl, required this.date})
      : super(SlopepiInitial()) {
    final ApiRepositorySlopepi ApiRepository =
        ApiRepositorySlopepi(url1: utl, date1: date);

    on<GetSlopegepiList>((event, emit) async {
      try {
        emit(SlopepiLoading());
        final mdetail = await ApiRepository.GetSlopepiList();
        emit(SlopepiLoaded(mdetail));
        if (mdetail.error != null) {
          emit(SlopepiError(mdetail.error));
        }
      } on NetworkError {
        emit(const SlopepiError(
            "Failed to fetch data. is your device online?"));
      }
    });
  }
}


