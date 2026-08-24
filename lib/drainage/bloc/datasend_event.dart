part of 'datasend_bloc.dart';

@immutable
abstract class DatasendEvent {}

class SendData extends DatasendEvent {
  final DRPostModel inspection;

  SendData(this.inspection);
}