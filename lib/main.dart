import 'package:flutter/material.dart';

import 'common/app_route.dart';
import 'ui/splash/splash_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: AppRoute.navigatorKey,
      scaffoldMessengerKey: AppRoute.messengerKey,
      home: const SplashPage(),
      routes: AppRoute.routes,
      onUnknownRoute: AppRoute.onUnknownRoute,
    );
  }
}
