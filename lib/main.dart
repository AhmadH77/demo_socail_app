//@dart=2.9
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:social_app_demo/provider/create_dialog.dart';
import 'package:social_app_demo/provider/currentPage.dart';
import 'package:social_app_demo/provider/live_page_controller.dart';
import 'package:social_app_demo/provider/shortieCurrentPage.dart';
import 'package:social_app_demo/screens/mainScreen.dart';
import 'package:social_app_demo/ui/splash_screen/splash_screen_page.dart';
import 'package:social_app_demo/util/const.dart';

import 'constants/theme_color.dart';

void main() {

  runApp(
      MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CurrentPage()),
        ChangeNotifierProvider(create: (_) => ShortieCurrentPage()),
        ChangeNotifierProvider(create: (_) => CreateDialogProvider()),
        ChangeNotifierProvider(create: (_) => LivePageController()),
      ],
      child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(
        statusBarIconBrightness: Brightness.light
    ));
    return MaterialApp(
      title: 'Social App Demo',
      theme: ThemeData(
        fontFamily: 'regular',
        // primarySwatch: createMaterialColor(Constants.orangeLight),
        primarySwatch: createMaterialColor(ThemeColors.middleCURVE),
      ),
      home:
      SplashScreenPage()
      // MainScreen(index: 0,),
    );
  }
  MaterialColor createMaterialColor(Color color) {
    List strengths = <double>[.05];
    Map swatch = <int, Color>{};
    final int r = color.red, g = color.green, b = color.blue;

    for (int i = 1; i < 10; i++) {
      strengths.add(0.1 * i);
    }
    strengths.forEach((strength) {
      final double ds = 0.5 - strength;
      swatch[(strength * 1000).round()] = Color.fromRGBO(
        r + ((ds < 0 ? r : (255 - r)) * ds).round(),
        g + ((ds < 0 ? g : (255 - g)) * ds).round(),
        b + ((ds < 0 ? b : (255 - b)) * ds).round(),
        1,
      );
    });
    return MaterialColor(color.value, swatch);
  }
}

