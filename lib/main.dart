import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connectivity/bloc/network_bloc.dart';
import 'package:internet_connectivity/network_observer.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

main() {
  BlocOverrides.runZoned(() => runApp(MyApp()),
      blocObserver: NetworkObserver());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider<NetworkBloc>(
        create: (context) => NetworkBloc()..add(ObserveNetwork()), //adding events
        lazy: false,
        child: InternetConnected(),
      ),
    );
  }
}

class InternetConnected extends StatefulWidget {
  const InternetConnected({super.key});

  @override
  State<InternetConnected> createState() => _InternetConnectedState();
}

class _InternetConnectedState extends State<InternetConnected> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Checking Internet'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [BlocBuilder<NetworkBloc, NetworkState>(
            builder: (context, state) {

              if(state is NetworkDisconnected){
                return Text('Network disconnected',style: TextStyle(fontSize:30,));
              } else if( state is NetworkConnected){
                return Text('Network connected',style: TextStyle(fontSize:30,));
              }

              return const SizedBox.shrink();
            },
          )
          ],
        ),
      ),
    );
  }
}
