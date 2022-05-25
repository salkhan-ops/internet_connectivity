import 'package:bloc/bloc.dart';
import '../helper/network_helper.dart';

part 'network_event.dart';
part 'network_state.dart';

class NetworkBloc extends Bloc<NetworkEvent, NetworkState> {
  NetworkBloc._() : super(NetworkInitial()) {
    on<ObserveNetwork>(_observe);
    on<NotifyNetwork>(_notifyStatus);
  }

  static final NetworkBloc _instance = NetworkBloc._();
  factory NetworkBloc() => _instance;
  void _observe(event, emit) {
    NetworkHelper.observeNetwork();
  }

  void _notifyStatus(NotifyNetwork event, emit) {
    event.isConnected ? emit(NetworkConnected()) : emit(NetworkDisconnected());
  }
}
