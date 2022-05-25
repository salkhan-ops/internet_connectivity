import 'package:bloc/bloc.dart';

class NetworkObserver extends BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    print('${bloc.runtimeType},$change');
  }
}
