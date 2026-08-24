part of 't_dd_bloc.dart';

abstract class TDdState extends Equatable {
  const TDdState();

  @override
  List<Object> get props => [];
}

class TDdInitial extends TDdState {}

class TDdLoading extends TDdState {}

class TDdLoaded extends TDdState {
  final TDeckSlopeModel tdeckdrainageModel;
  const TDdLoaded(this.tdeckdrainageModel);
}

class TDdError extends TDdState {
  final String? message;
  const TDdError(this.message);
}
