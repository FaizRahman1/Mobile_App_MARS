part of 'slopeinventory_bloc.dart';

abstract class SlopeinventoryState extends Equatable {
  const SlopeinventoryState();

  @override
  List<Object> get props => [];
}

class SlopeinventoryInitial extends SlopeinventoryState {}

class SlopeinventoryLoading extends SlopeinventoryState {}

class SlopeinventoryLoaded extends SlopeinventoryState {
  final SlopeinventoryModel slopeinventoryModel;
  const SlopeinventoryLoaded(this.slopeinventoryModel);
}

class SlopeinventoryError extends SlopeinventoryState {
  final String? message;
  const SlopeinventoryError(this.message);  
}
