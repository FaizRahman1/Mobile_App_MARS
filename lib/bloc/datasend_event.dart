part of 'datasend_bloc.dart';

abstract class DatasendEvent {}

class SendData extends DatasendEvent {
  final brpostmodel name;

  SendData(this.name);
}
