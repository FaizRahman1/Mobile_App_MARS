import 'package:bloc/bloc.dart';
import 'package:bridgeinsp_new/models/bridgeinspection_model.dart';
import 'package:bridgeinsp_new/resources/bridgeinspection_repository.dart';
import 'package:equatable/equatable.dart';

part 'bridgepi_event.dart';
part 'bridgepi_state.dart';

class BridgepiBloc extends Bloc<BridgepiEvent, BridgepiState> {
  final String? utl;
  final DateTime? date;

  BridgepiBloc({required this.utl, required this.date})
      : super(BridgepiInitial()) {
    final ApiRepositoryBridgepi ApiRepository =
        ApiRepositoryBridgepi(url1: utl, date1: date);

    on<GetBridgepiList>((event, emit) async {
      try {
        emit(BridgepiLoading());
        final mdetail = await ApiRepository.GetBridgepiList();
        emit(BridgepiLoaded(mdetail!));
        if (mdetail.error != null) {
          emit(BridgepiError(mdetail.error));
        }
      } on NetworkError {
        emit(const BridgepiError(
            "Failed to fetch data. is your device online?"));
      }
      // TODO: implement event handler
    });
  }
}
