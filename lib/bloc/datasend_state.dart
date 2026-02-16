part of 'datasend_bloc.dart';

abstract class DatasendState {
  const DatasendState();
}

class DatasendInitial extends DatasendState {}

class DatasendLoading extends DatasendState {}

class DatasendLoaded extends DatasendState {
  final AlertDialog dialog;

  const DatasendLoaded(this.dialog);
}

class DatasendError extends DatasendState {
  final String message;

  const DatasendError(this.message);
}
