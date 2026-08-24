part of 'drainageinventory_bloc.dart';

abstract class DrainageinventoryState extends Equatable {
  const DrainageinventoryState();

  @override
  List<Object> get props => [];
}

class DrainageinventoryInitial extends DrainageinventoryState {}

class DrainageinventoryLoading extends DrainageinventoryState {}

class DrainageinventoryLoaded extends DrainageinventoryState {
  final DrainageinventoryModel drainageinventoryModel;
  const DrainageinventoryLoaded(this.drainageinventoryModel);
}

class DrainageinventoryError extends DrainageinventoryState {
  final String? message;
  const DrainageinventoryError(this.message);
}
