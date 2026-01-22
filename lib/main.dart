import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:sachin_nagwade/firebase_options_local.dart';
import 'package:sachin_nagwade/routes.dart';
import 'package:url_strategy/url_strategy.dart' show setPathUrlStrategy;

import 'Constants.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
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
      initialRoute: Tabs.HOME_ROUTE,
    );
  }
}
