part of 'bridgeinventory_bloc.dart';

abstract class BridgeinventoryState extends Equatable {
  const BridgeinventoryState();

  @override
  List<Object> get props => [];
}

class BridgeinventoryInitial extends BridgeinventoryState {}

class BridgeinventoryLoading extends BridgeinventoryState {}

class BridgeinventoryLoaded extends BridgeinventoryState {
  final BridgeinventoryModel bridgeinventoryModel;
  const BridgeinventoryLoaded(this.bridgeinventoryModel);
}

class BridgeinventoryError extends BridgeinventoryState {
  final String? message;
  const BridgeinventoryError(this.message);
}
