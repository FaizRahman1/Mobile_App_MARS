part of 'slopeinventory_bloc.dart';

abstract class SlopeinventoryEvent extends Equatable {
  const SlopeinventoryEvent();

  @override
  List<Object?> get props => [];
}

class GetSlopeinventory extends SlopeinventoryEvent {
  const GetSlopeinventory();
}