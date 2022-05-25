part of 'network_bloc.dart';

abstract class NetworkEvent {}

class ObserveNetwork extends NetworkEvent{}

class NotifyNetwork extends NetworkEvent{
  final bool isConnected;

  NotifyNetwork({this.isConnected=false});
}
