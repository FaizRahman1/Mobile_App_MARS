part of 'drainagepi_bloc.dart';

abstract class DrainagepiState extends Equatable {
  const DrainagepiState();

  @override
  List<Object> get props => [];
}

class DrainagepiInitial extends DrainagepiState {}

class DrainagepiLoading extends DrainagepiState {}

class DrainagepiLoaded extends DrainagepiState {
  final DrainageinspectionModel drainageinspectionModel;
  const DrainagepiLoaded(this.drainageinspectionModel);
}

class DrainagepiError extends DrainagepiState {
  final String? message;
  const DrainagepiError(this.message);
}
