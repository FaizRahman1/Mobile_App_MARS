part of 'bridgeinventory_bloc.dart';

abstract class BridgeinventoryEvent extends Equatable {
  const BridgeinventoryEvent();

  @override
  List<Object> get props => [];
}

class GetBridgeinventory extends BridgeinventoryEvent {}
