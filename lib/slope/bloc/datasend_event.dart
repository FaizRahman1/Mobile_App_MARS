part of 'datasend_bloc.dart';

@immutable
abstract class DatasendEvent {}

class SendData extends DatasendEvent {
  final SLPostModel inspection;

  SendData(this.inspection);
}