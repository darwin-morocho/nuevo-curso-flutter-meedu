import 'package:flutter/material.dart';
import 'package:flutter_meedu/router.dart' as router;

import 'ui/routes/app_routes.dart';
import 'ui/routes/routes.dart';

class MyApp extends StatelessWidget {
  final String? initialRoute;
  final Map<String, Widget Function(BuildContext)>? routes;

  const MyApp({
    Key? key,
    this.initialRoute,
    this.routes,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      key: router.appKey,
      title: 'Hello world',
      navigatorKey: router.navigatorKey,
      navigatorObservers: [
        router.observer,
      ],
      routes: routes ?? appRoutes,
      initialRoute: initialRoute ?? Routes.SPLASH,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
