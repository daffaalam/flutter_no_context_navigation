import 'package:flutter/material.dart';

import '../../common/app_route.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  Future<void> _initialize() async {
    await Future.delayed(
      const Duration(
        seconds: 3,
      ),
    );
    AppRoute.offNamed(AppRoute.home);
  }

  @override
  void initState() {
    super.initState();
    _initialize();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: const <Widget>[
            FlutterLogo(
              style: FlutterLogoStyle.horizontal,
              size: 128.0,
            ),
            CircularProgressIndicator.adaptive(),
          ],
        ),
      ),
    );
  }
}
