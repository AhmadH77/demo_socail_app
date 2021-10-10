import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:social_app_demo/screens/mainScreen.dart';
import 'package:social_app_demo/ui/onboarding/onboarding_screen.dart';

class ConfigPage extends StatefulWidget {
  static const routeName = '/configPage';

  const ConfigPage({Key? key}) : super(key: key);

  @override
  _ConfigPageState createState() => _ConfigPageState();
}

class _ConfigPageState extends State<ConfigPage> {
  bool? isLoggedIn;

  @override
  void initState() {
    var user = Provider.of<User?>(context, listen: false);
    isLoggedIn = user != null;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => true,
      child: Container(
        child: SafeArea(
            top: false,
            bottom: false,
            child:
                Scaffold(body: isLoggedIn! ? OnboardingPage() : MainScreen())),
      ),
    );
  }
}
