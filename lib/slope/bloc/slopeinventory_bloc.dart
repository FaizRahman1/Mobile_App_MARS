import 'package:bloc/bloc.dart';
import 'package:bridgeinsp_new/slope/slmodels/slopeinventory_model.dart';
import 'package:bridgeinsp_new/slope/resources/slopeinventory_repository.dart';
import 'package:equatable/equatable.dart';

part 'slopeinventory_event.dart';
part 'slopeinventory_state.dart';

class SlopeinventoryBloc
    extends Bloc<SlopeinventoryEvent, SlopeinventoryState> {
  final String? utl;

  SlopeinventoryBloc({required this.utl})
      : super(SlopeinventoryInitial()) {
    final ApiRepositorySlopeinventory apiRepositoryslopeinventory =
        ApiRepositorySlopeinventory(url: utl);

    on<GetSlopeinventory>((event, emit) async {
      try {
        emit(SlopeinventoryLoading());

        final SlopeinventoryModel mInventory =
            await apiRepositoryslopeinventory.fetchSlopeinv();

        if (mInventory.error != null) {
          emit(SlopeinventoryError(mInventory.error));
        } else {
          emit(SlopeinventoryLoaded(mInventory));
        }
      } on NetworkError {
        emit(
          const SlopeinventoryError(
            "Failed to fetch data. Is your device online?",
          ),
        );
      } catch (error) {
        emit(
          SlopeinventoryError(
            "Failed to load slope inventory: $error",
          ),
        );
      }
    });
  }
}