import 'package:connectivity_plus/connectivity_plus.dart';
import '../bloc/network_bloc.dart';

class NetworkHelper {
  static void observeNetwork() {
    Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      if (result == ConnectivityResult.none) {
        NetworkBloc().add(NotifyNetwork());
      } else {
        NetworkBloc().add(NotifyNetwork(isConnected: true));
      }
    });
  }
}
