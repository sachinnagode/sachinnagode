import 'package:flutter/material.dart';
import 'package:sachin_nagwade/mobile/about_mobile.dart';
import 'package:sachin_nagwade/mobile/blog_mobile.dart';
import 'package:sachin_nagwade/mobile/landing_page_mobile.dart';
import 'package:sachin_nagwade/mobile/works_mobile.dart';
import 'package:sachin_nagwade/web/about_web.dart';
import 'package:sachin_nagwade/web/blog_web.dart';
import 'package:sachin_nagwade/web/contact_web.dart';
import 'package:sachin_nagwade/web/landing_page_web.dart';
import 'package:sachin_nagwade/web/works_web.dart';

import 'mobile/contact_mobile.dart';

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
      case "/contact":
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => LayoutBuilder(
            builder: (context, constraints) {
              if (constraints.maxWidth > 800) {
                return ContactWeb();
              }
              return ContactMobile();
            },
          ),
        );
      case "/about":
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => LayoutBuilder(
            builder: (context, constraints) {
              if (constraints.maxWidth > 800) {
                return AboutWeb();
              }
              return AboutMobile();
            },
          ),
        );
      case "/blog":
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => LayoutBuilder(
            builder: (context, constraints) {
              if (constraints.maxWidth > 800) {
                return BlogWeb();
              }
              return BlogMobile();
            },
          ),
        );
      case "/works":
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => LayoutBuilder(
            builder: (context, constraints) {
              if (constraints.maxWidth > 800) {
                return WorksWeb();
              }
              return WorksMobile();
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
