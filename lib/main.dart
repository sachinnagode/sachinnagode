import 'package:flutter/material.dart';
import 'package:sachin_nagwade/routes.dart';
import 'package:url_strategy/url_strategy.dart' show setPathUrlStrategy;

void main() {
  setPathUrlStrategy();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: (settings) => Routes.generateRoute(settings),
      initialRoute: '/',
    );
  }
}
