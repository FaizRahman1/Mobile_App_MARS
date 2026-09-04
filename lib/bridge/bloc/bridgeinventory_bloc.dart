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
        if (mInventory == null) {
          emit(const BridgeinventoryError('No bridge data was returned.'));
          return;
        }
        final error = mInventory.error;
        if (error != null) {
          emit(BridgeinventoryError(error));
        } else {
          emit(BridgeinventoryLoaded(mInventory));
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
