part of 'slopepi_bloc.dart';

abstract class SlopepiEvent extends Equatable {
  const SlopepiEvent();

  @override
  List<Object> get props => [];
}

class GetSlopegepiList extends SlopepiEvent {}
