part of 'bridgepi_bloc.dart';

abstract class BridgepiEvent extends Equatable {
  const BridgepiEvent();

  @override
  List<Object> get props => [];
}

class GetBridgepiList extends BridgepiEvent {}
