part of 'bridgepi_bloc.dart';

abstract class BridgepiState extends Equatable {
  const BridgepiState();

  @override
  List<Object> get props => [];
}

class BridgepiInitial extends BridgepiState {}

class BridgepiLoading extends BridgepiState {}

class BridgepiLoaded extends BridgepiState {
  final BridgeinspectionModel bridgeinspectionModel;
  const BridgepiLoaded(this.bridgeinspectionModel);
}

class BridgepiError extends BridgepiState {
  final String? message;
  const BridgepiError(this.message);
}
