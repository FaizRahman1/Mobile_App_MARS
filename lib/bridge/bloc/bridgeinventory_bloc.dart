import 'package:bloc/bloc.dart';
import 'package:bridgeinsp_new/bridge/brmodels/bridgeinventory_model.dart';
import 'package:bridgeinsp_new/bridge/resources/bridgeinventory_repository.dart';
import 'package:equatable/equatable.dart';

part 'bridgeinventory_event.dart';
part 'bridgeinventory_state.dart';

class BridgeinventoryBloc
    extends Bloc<BridgeinventoryEvent, BridgeinventoryState> {
  final String? utl;

  BridgeinventoryBloc({required this.utl}) : super(BridgeinventoryInitial()) {
    final ApiRepositoryBridgeinventory apiRepositoryBridgeinventory =
        ApiRepositoryBridgeinventory(url: utl);

    on<GetBridgeinventory>((event, emit) async {
      try {
        emit(BridgeinventoryLoading());
        final mInventory = await apiRepositoryBridgeinventory.fetchBridgeinv();
        if (mInventory?.error != null) {
          emit(BridgeinventoryError(mInventory.error));
        } else if (mInventory != null) {
          emit(BridgeinventoryLoaded(mInventory));
        } else {
          emit(const BridgeinventoryError('No bridge data was returned.'));
        }
      } catch (_) {
        emit(
          const BridgeinventoryError(
            'Failed to fetch data. Is your device online?',
          ),
        );
      }
    });
  }
}
