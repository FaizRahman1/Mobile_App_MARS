part of 'drainagepi_bloc.dart';

abstract class DrainagepiEvent extends Equatable {
  const DrainagepiEvent();

  @override
  List<Object> get props => [];
}

class GetDrainagepiList extends DrainagepiEvent {}
