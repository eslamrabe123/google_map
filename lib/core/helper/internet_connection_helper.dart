import '../../exports.dart';

class InternetConnectionHelper {
  InternetConnectionHelper._();
  static InternetConnectionHelper instance = InternetConnectionHelper._();

  final InternetConnectionChecker internetConnection =
      InternetConnectionChecker.instance;
  StreamSubscription<InternetConnectionStatus>? _subscription;

  void startListeningToConnection() async {
    _subscription = internetConnection.onStatusChange
        .listen((InternetConnectionStatus status) {
      "internet status $status".logIfDebug();
      if (status == InternetConnectionStatus.connected) {
        CustomNavigator.push(Routes.splash, clean: true);
      }
    });
  }

  void checkConnection() async {
    if (await internetConnection.hasConnection == false) {
      // TODO Create noInternetScreen And Navigate
      // CustomNavigator.push(Routes.noInternetConnectionScreen, clean: true);
    }
  }

  void disposeInternetConnection() {
    internetConnection.dispose();
  }

  void stopListeningToAllConnection() {
    internetConnection.dispose();
    _subscription?.cancel();
  }
}
