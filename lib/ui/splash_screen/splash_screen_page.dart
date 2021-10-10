import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';
import 'package:social_app_demo/constants/dimens.dart';
import 'package:social_app_demo/constants/strings.dart';
import 'package:social_app_demo/ui/onboarding/onboarding_screen.dart';

class SplashScreenPage extends StatefulWidget {
  static const routeName = '/splashScreenPage';

  const SplashScreenPage({Key? key}) : super(key: key);

  @override
  State<SplashScreenPage> createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 3)).then((value) {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => OnboardingPage(),
      ));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        color: Colors.black,
        child: Stack(
          children: [
            Align(
              child: Image.asset('assets/images/splash.png'),
              alignment: Alignment.center,
            ),
            Align(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: sixtyDp),
                child: Text(
                  appName,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: thirtyDp,
                      fontWeight: FontWeight.w400),
                ),
              ),
              alignment: Alignment.bottomCenter,
            )
          ],
        ),
      ),
    );
  }
}
