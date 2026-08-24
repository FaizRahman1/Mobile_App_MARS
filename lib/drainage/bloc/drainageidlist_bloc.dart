import 'package:bloc/bloc.dart';
import 'package:bridgeinsp_new/drainage/Drmodels/Drainageidlist_model.dart';
import 'package:bridgeinsp_new/drainage/resources/drainageidlist_repository.dart';
import 'package:equatable/equatable.dart';

abstract class DrainageidlistEvent extends Equatable {
  const DrainageidlistEvent();

  @override
  List<Object> get props => [];
}

class GetDrainageidList extends DrainageidlistEvent {
  final String id;

  const GetDrainageidList({required this.id});

  @override
  List<Object> get props => [id];
}

abstract class DrainageidlistState extends Equatable {
  const DrainageidlistState();

  @override
  List<Object> get props => [];
}

class DrainageidlistInitial extends DrainageidlistState {}

class DrainageidlistLoading extends DrainageidlistState {}

class DrainageidlistLoaded extends DrainageidlistState {
  final DrainageidlistModel drainageidlistModel;

  const DrainageidlistLoaded({required this.drainageidlistModel});

  @override
  List<Object> get props => [drainageidlistModel];
}

class DrainageidlistError extends DrainageidlistState {
  final String message;

  const DrainageidlistError(this.message);

  @override
  List<Object> get props => [message];
}

class DrainageidlistBloc extends Bloc<DrainageidlistEvent, DrainageidlistState> {
  DrainageidlistBloc() : super(DrainageidlistInitial()) {
    final ApiRepositoryDrainageidlist apiRepositoryDrainageidlist =
        ApiRepositoryDrainageidlist();

    on<GetDrainageidList>((event, emit) async {
      try {
        emit(DrainageidlistLoading());

        final mList =
            await apiRepositoryDrainageidlist.fetchDrainagedlist(event.id);

        if (mList.error != null) {
          emit(DrainageidlistError(mList.error!));
        } else {
          emit(DrainageidlistLoaded(drainageidlistModel: mList));
        }
      } on NetworkError {
        emit(const DrainageidlistError(
            "Failed to fetch data. Is your device online?"));
      }
    });
  }
}