import 'package:bloc/bloc.dart';
import 'package:bridgeinsp_new/slope/slmodels/slopeidlist_model.dart';
import 'package:bridgeinsp_new/slope/resources/slopeidlist_repository.dart';
import 'package:equatable/equatable.dart';

abstract class SlopeidlistEvent extends Equatable {
  const SlopeidlistEvent();

  @override
  List<Object> get props => [];
}

class GetSlopeidList extends SlopeidlistEvent {
  final String id;

  const GetSlopeidList({
    required this.id,
  });

  @override
  List<Object> get props => [id];
}

abstract class SlopeidlistState extends Equatable {
  const SlopeidlistState();

  @override
  List<Object> get props => [];
}

class SlopeidlistInitial extends SlopeidlistState {
  const SlopeidlistInitial();
}

class SlopeidlistLoading extends SlopeidlistState {
  const SlopeidlistLoading();
}

class SlopeidlistLoaded extends SlopeidlistState {
  final SlopeidlistModel slopeidlistModel;

  const SlopeidlistLoaded({
    required this.slopeidlistModel,
  });

  @override
  List<Object> get props => [slopeidlistModel];
}

class SlopeidlistError extends SlopeidlistState {
  final String message;

  const SlopeidlistError(this.message);

  @override
  List<Object> get props => [message];
}

class SlopeidlistBloc
    extends Bloc<SlopeidlistEvent, SlopeidlistState> {
  final ApiRepositorySlopeidlist repository;

  SlopeidlistBloc({
    ApiRepositorySlopeidlist? repository,
  })  : repository =
            repository ?? ApiRepositorySlopeidlist(),
        super(const SlopeidlistInitial()) {
    on<GetSlopeidList>(_onGetSlopeidList);
  }

  Future<void> _onGetSlopeidList(
    GetSlopeidList event,
    Emitter<SlopeidlistState> emit,
  ) async {
    emit(const SlopeidlistLoading());

    try {
      final SlopeidlistModel result =
          await repository.fetchSlopelist(event.id);

      if (result.error != null &&
          result.error!.trim().isNotEmpty) {
        emit(SlopeidlistError(result.error!));
        return;
      }

      emit(
        SlopeidlistLoaded(
          slopeidlistModel: result,
        ),
      );
    } on NetworkError {
      emit(
        const SlopeidlistError(
          'Failed to fetch data. Is your device online?',
        ),
      );
    } catch (error) {
      emit(
        SlopeidlistError(
          'Failed to fetch slope data: $error',
        ),
      );
    }
  }
}
