import 'package:bloc/bloc.dart';
import 'package:bridgeinsp_new/drainage/Drmodels/drainageinventory_model.dart';
import 'package:bridgeinsp_new/drainage/resources/drainageinventory_repository.dart';
import 'package:equatable/equatable.dart';

part 'drainageinventory_event.dart';
part 'drainageinventory_state.dart';

class DrainageinventoryBloc
    extends Bloc<DrainageinventoryEvent, DrainageinventoryState> {
  final String? utl;

  DrainageinventoryBloc({required this.utl}) : super(DrainageinventoryInitial()) {
    final ApiRepositoryDrainageinventory apiRepositoryDrainageinventory =
        ApiRepositoryDrainageinventory(url: utl);

    on<GetDrainageinventory>((event, emit) async {
      try {
        emit(DrainageinventoryLoading());
        final mInventory = await apiRepositoryDrainageinventory.fetchDrainageinv();
        emit(DrainageinventoryLoaded(mInventory!));
        if (mInventory.error != null) {
          emit(DrainageinventoryError(mInventory.error));
        }
      } on NetworkError {
        emit(const DrainageinventoryError(
            "Failed to fetch data. is your device online?"));
      }
    });
  }
}
