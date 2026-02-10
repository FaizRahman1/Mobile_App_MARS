// File: lib/bloc/bridgeidlist_bloc.dart
import 'package:bloc/bloc.dart';
import 'package:bridgeinsp_new/models/bridgeidlist_model.dart';
import 'package:bridgeinsp_new/resources/bridgeidlist_repository.dart';
import 'package:equatable/equatable.dart';

// --- REVERTED: Remove part declarations and define events/states inline or in separate files without part ---
// For this reverted version, we'll put the old event/state back inline if needed,
// or assume they are in separate files not using part/part-of for this specific revert.
// Let's assume the old event/state structure exists or is defined inline here.

// Old Event (if not in separate file)
abstract class BridgeidlistEvent extends Equatable {
  const BridgeidlistEvent();

  @override
  List<Object> get props => [];
}

class GetBridgeidList extends BridgeidlistEvent {
  final String id;

  const GetBridgeidList({required this.id});

  @override
  List<Object> get props => [id];
}

// Old State (if not in separate file)
abstract class BridgeidlistState extends Equatable {
  const BridgeidlistState();

  @override
  List<Object> get props => [];
}

class BridgeidlistInitial extends BridgeidlistState {}

class BridgeidlistLoading extends BridgeidlistState {}

class BridgeidlistLoaded extends BridgeidlistState {
  final BridgeidlistModel bridgeidlistModel;

  // --- FIX: Use named parameter syntax in constructor ---
  const BridgeidlistLoaded({required this.bridgeidlistModel});
  // --- END OF FIX ---

  @override
  List<Object> get props => [bridgeidlistModel];
}

class BridgeidlistError extends BridgeidlistState {
  final String message;

  const BridgeidlistError(this.message);

  @override
  List<Object> get props => [message];
}

// --- END OF OLD STRUCTURE ---

class BridgeidlistBloc extends Bloc<BridgeidlistEvent, BridgeidlistState> {
  BridgeidlistBloc() : super(BridgeidlistInitial()) {
    final ApiRepositoryBridgeidlist apiRepositoryBridgeidlist =
        ApiRepositoryBridgeidlist();

    on<GetBridgeidList>((event, emit) async {
      try {
        emit(BridgeidlistLoading());
        // --- REVERTED: Call repository without page/size ---
        final mList = await apiRepositoryBridgeidlist.fetchBridgeidlist(event.id);
        // --- FIX: Use named parameter syntax when emitting ---
        emit(BridgeidlistLoaded(bridgeidlistModel: mList!));
        // --- END OF FIX ---
        if (mList.error != null) {
          emit(BridgeidlistError(mList.error!));
        }
      } on NetworkError {
        emit(const BridgeidlistError(
            "Failed to fetch data. Is your device online?"));
      }
    });
  }
}