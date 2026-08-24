part of 't_dd_bloc.dart';

abstract class TDdEvent extends Equatable {
  const TDdEvent();

  @override
  List<Object> get props => [];
}

class GetTDeckSlopeList extends TDdEvent {}
