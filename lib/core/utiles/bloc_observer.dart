
import '../../exports.dart';

class MyBlocObserver extends BlocObserver {
  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);
    'onCreate -- ${bloc.runtimeType}'.logIfDebug();
  }

  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    'onEvent -- ${bloc.runtimeType} -- $event'.logIfDebug();
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    'onChange -- ${bloc.runtimeType} -- $change'.logIfDebug();
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    'onTransition -- ${bloc.runtimeType} -- $transition'.logIfDebug();
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    'onError -- ${bloc.runtimeType} -- $error -- $stackTrace'.logIfDebug();
    super.onError(bloc, error, stackTrace);
  }

  @override
  void onClose(BlocBase bloc) {
    'onClose -- ${bloc.runtimeType}'.logIfDebug();
    super.onClose(bloc);
  }
}
