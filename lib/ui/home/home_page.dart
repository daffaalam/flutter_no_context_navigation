import 'package:flutter/material.dart';

import '../../common/app_route.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  Widget _button({
    required VoidCallback onPressed,
    required String label,
  }) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(label),
      ),
    );
  }

  List<Widget> _children() {
    return <Widget>[
      _button(
        onPressed: () {
          AppRoute.snackBar(
            content: 'Hello World',
          );
        },
        label: 'Show SnackBar',
      ),
      _button(
        onPressed: AppRoute.clearSnackBars,
        label: 'Clear SnackBars',
      ),
      _button(
        onPressed: () {
          AppRoute.banner(
            content: 'Hello World',
            label: 'OK',
            onPressed: AppRoute.clearBanners,
          );
        },
        label: 'Show MaterialBanner',
      ),
      _button(
        onPressed: AppRoute.clearBanners,
        label: 'Clear Banners',
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Application'),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              AppRoute.toNamed(AppRoute.login);
            },
            child: const Text('LOGIN'),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(8.0),
        children: _children(),
      ),
    );
  }
}
