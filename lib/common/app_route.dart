import 'package:flutter/material.dart';

import '../ui/home/home_page.dart';
import '../ui/login/login_page.dart';
import '../ui/splash/splash_page.dart';

class AppRoute {
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();
  static NavigatorState get navigator => navigatorKey.currentState!;

  static final GlobalKey<ScaffoldMessengerState> messengerKey =
      GlobalKey<ScaffoldMessengerState>();
  static ScaffoldMessengerState get messenger => messengerKey.currentState!;

  static const String home = '/home';
  static const String login = '/login';
  static final Map<String, WidgetBuilder> routes = <String, WidgetBuilder>{
    home: (BuildContext context) {
      return const HomePage();
    },
    login: (BuildContext context) {
      return const LoginPage();
    },
  };

  static Route<dynamic>? onUnknownRoute(RouteSettings settings) {
    return MaterialPageRoute(
      builder: (BuildContext context) {
        return const SplashPage();
      },
      settings: settings,
    );
  }

  static Future<T?> to<T extends Object?>(
    Route<T> route,
  ) {
    return navigator.push<T>(route);
  }

  static Future<T?> toNamed<T extends Object?>(
    String route, {
    Object? arguments,
  }) {
    return navigator.pushNamed<T>(
      route,
      arguments: arguments,
    );
  }

  static Future<T?> off<T extends Object?, TO extends Object?>(
    Route<T> route, {
    TO? result,
  }) {
    return navigator.pushReplacement<T, TO>(
      route,
      result: result,
    );
  }

  static Future<T?> offNamed<T extends Object?, TO extends Object?>(
    String route, {
    TO? result,
    Object? arguments,
  }) {
    return navigator.pushReplacementNamed<T, TO>(
      route,
      result: result,
      arguments: arguments,
    );
  }

  static Future<T?> offAll<T extends Object?>(
    Route<T> route, {
    bool removeAll = true,
    RoutePredicate? predicate,
  }) {
    predicate ??= (Route<dynamic> otherRoute) {
      return !removeAll;
    };
    return navigator.pushAndRemoveUntil<T>(
      route,
      predicate,
    );
  }

  static Future<T?> offNamedAll<T extends Object?>(
    String route, {
    bool removeAll = true,
    RoutePredicate? predicate,
    Object? arguments,
  }) {
    predicate ??= (Route<dynamic> otherRoute) {
      return !removeAll;
    };
    return navigator.pushNamedAndRemoveUntil(
      route,
      predicate,
      arguments: arguments,
    );
  }

  static void back<T extends Object?>([
    T? result,
  ]) {
    return navigator.pop(result);
  }

  static void clearSnackBars() {
    return messenger.clearSnackBars();
  }

  static ScaffoldFeatureController<SnackBar, SnackBarClosedReason> snackBar({
    SnackBar? snackBar,
    String? content,
    String? label,
    VoidCallback? onPressed,
  }) {
    clearSnackBars();
    snackBar ??= SnackBar(
      content: Text('$content'),
      action: label == null
          ? null
          : SnackBarAction(
              label: label,
              onPressed: onPressed ?? () {},
            ),
    );
    return messenger.showSnackBar(snackBar);
  }

  static void clearBanners() {
    return messenger.clearMaterialBanners();
  }

  static ScaffoldFeatureController<MaterialBanner, MaterialBannerClosedReason> banner({
    MaterialBanner? banner,
    String? content,
    String? label,
    VoidCallback? onPressed,
  }) {
    clearBanners();
    banner ??= MaterialBanner(
      content: Text('$content'),
      actions: <Widget>[
        TextButton(
          onPressed: onPressed,
          child: Text('$label'),
        ),
      ],
    );
    return messenger.showMaterialBanner(banner);
  }
}
