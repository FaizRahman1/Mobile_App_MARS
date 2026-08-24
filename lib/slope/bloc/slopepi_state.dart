part of 'slopepi_bloc.dart';

abstract class SlopepiState extends Equatable {
  const SlopepiState();

  @override
  List<Object?> get props => [];
}

class SlopepiInitial extends SlopepiState {}

class SlopepiLoading extends SlopepiState {}

class SlopepiLoaded extends SlopepiState {
  final SlopeinspectionModel slopeInspectionModel;

  const SlopepiLoaded(this.slopeInspectionModel);

  @override
  List<Object?> get props => [slopeInspectionModel];
}

class SlopepiError extends SlopepiState {
  final String? message;

  const SlopepiError(this.message);

  @override
  List<Object?> get props => [message];
}