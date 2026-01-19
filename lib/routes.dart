import 'package:flutter/material.dart';
import 'package:sachin_nagwade/mobile/landing_page_mobile.dart';
import 'package:sachin_nagwade/web/landing_page_web.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case "/":
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => LayoutBuilder(
            builder: (context, constraints) {
              if (constraints.maxWidth > 800) {
                return LandingPageWeb();
              }
              return LandingPageMobile();
            },
          ),
        );
      default:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => LayoutBuilder(
            builder: (context, constraints) {
              if (constraints.maxWidth > 800) {
                return LandingPageWeb();
              }
              return LandingPageMobile();
            },
          ),
        );
    }
  }
}
