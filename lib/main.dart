//@dart=2.9
import 'package:flutter/material.dart';
import 'package:social_app_demo/screens/mainScreen.dart';
import 'package:social_app_demo/util/const.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Social App Demo',
      theme: ThemeData(
        primarySwatch: Constants.orangeLight,
      ),
      home: MainScreen(),
    );
  }
}
