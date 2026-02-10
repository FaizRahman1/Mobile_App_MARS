part of 'datasend_bloc.dart';

abstract class DatasendState {
  const DatasendState();

  @override
  List<Object> get props => [];
}

class DatasendInitial extends DatasendState {}

class DatasendLoading extends DatasendState {}

class DatasendLoaded extends DatasendState {
  final brpostmodel data;

  DatasendLoaded(this.data);
}

class DatasendError extends DatasendState {}
