import "package:flutter/material.dart";

import "exports.dart";

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await setupLocator();

  // bloc observer
  Bloc.observer = MyBlocObserver();

  runApp(
    EasyLocalization(
      startLocale: const Locale('en', 'US'),
      supportedLocales: const [Locale('ar', 'EG'), Locale('en', 'US')],
      saveLocale: true,
      path: 'assets/translations',
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        title: '',
        themeAnimationDuration: const Duration(milliseconds: 700),
        themeAnimationCurve: Curves.easeInOutCubic,
        navigatorKey: CustomNavigator.navigatorState,
        onGenerateRoute: CustomNavigator.onCreateRoute,
        navigatorObservers: [
          CustomNavigator.routeObserver,
        ],
        scaffoldMessengerKey: CustomNavigator.scaffoldState,
        debugShowCheckedModeBanner: false,
        locale: context.locale,
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        builder: (_, child) {
          final botToastBuilder = BotToastInit();
          final smartDialog = FlutterSmartDialog.init();
          child = smartDialog(context, child);
          child = botToastBuilder(context, child);
          return child;
        },
        theme: ThemesManger.appLightTheme,
        darkTheme: ThemesManger.appDarkTheme,
        initialRoute: '/',
      ),
    );
  }
}

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
