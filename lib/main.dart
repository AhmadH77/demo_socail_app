//@dart=2.9
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:social_app_demo/provider/auth_provider.dart';
import 'package:social_app_demo/provider/currentPage.dart';
import 'package:social_app_demo/route_generator.dart';
import 'package:social_app_demo/ui/splash_screen/splash_screen_page.dart';

import 'constants/theme_color.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((value) => runApp(VasukamApp()));
}

class VasukamApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CurrentPage()),
        //authentication
        ChangeNotifierProvider.value(value: AuthProvider()),

        StreamProvider<User>.value(
          value: FirebaseAuth.instance.authStateChanges(),
          initialData: FirebaseAuth.instance.currentUser,
        ),
      ],
      child: MaterialApp(
        title: 'Social App Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'regular',
//         primarySwatch: createMaterialColor(Constants.orangeLight),
          primarySwatch: createMaterialColor(ThemeColors.middleCURVE),
        ),
        //home: MainScreen(),
        initialRoute: SplashScreenPage.routeName,
        onGenerateRoute: RouteGenerator.generateRoute,
      ),
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
