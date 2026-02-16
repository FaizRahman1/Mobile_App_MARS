part of 'datasend_bloc.dart';

abstract class DatasendEvent {}

class SendData extends DatasendEvent {
  final BrPostModel inspection;

  SendData(this.inspection);
}
