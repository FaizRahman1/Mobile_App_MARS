part of 't_supersecond_bloc.dart';

abstract class TSupersecondState extends Equatable {}

class InitialState extends TSupersecondState {
  @override
  List<Object> get props => [];
}

class TSupersecondLoading extends TSupersecondState {
  @override
  List<Object?> get props => [];
}

class TSupersecondLoaded extends TSupersecondState {
  @override
  List<Object?> get props => [];

  /*final SuperstructureSecondaryModel data;

  const TSupersecondLoaded(this.data);
  */
}

class TSupersecondError extends TSupersecondState {
  final String error;

  TSupersecondError(this.error);

  @override
  List<Object?> get props => [error];
}
