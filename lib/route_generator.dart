import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:social_app_demo/screens/mainScreen.dart';
import 'package:social_app_demo/ui/auth/config_page.dart';
import 'package:social_app_demo/ui/home/home_page/home_page.dart';
import 'package:social_app_demo/ui/splash_screen/splash_screen_page.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case ConfigPage.routeName:
        return MaterialPageRoute(builder: (_) => ConfigPage());

      case HomePage.routeName:
        return MaterialPageRoute(builder: (_) => HomePage());

      case MainScreen.routeName:
        return MaterialPageRoute(builder: (_) => MainScreen());
      case SplashScreenPage.routeName:
        return MaterialPageRoute(builder: (_) => SplashScreenPage());

      default:
        return _errorRoute();
    }
  }

  //error page ..
  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        body: Center(
          child: Text("Page not Found"),
        ),
      );
    });
  }
}
