import 'package:flutter/material.dart';
import 'package:social_app_demo/constants/dimens.dart';

class AppActions {
  //get date
  static Future<DateTime?> selectDate(BuildContext context) => showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100));

  static popActivity(BuildContext context) {
    return Navigator.of(context).pop();
  }

  static pushReplacementNamedActivity(
      BuildContext context, String routeName, Object args) {
    if (args == null) {
      return Navigator.of(context).pushNamedAndRemoveUntil(
        routeName,
        (route) => false,
      );
    } else {
      return Navigator.of(context).pushNamedAndRemoveUntil(
          routeName, (route) => false,
          arguments: args);
    }
  }

  //box shadow
  static BoxShadow boxShadow() {
    return BoxShadow(
      color: Colors.grey.withOpacity(0.3),
      blurRadius: twentyDp, // soften the shadow
      spreadRadius: 5.0, //extend the shadow
      offset: const Offset(
        1.0, // Move to right 10  horizontally
        1.0, // Move to bottom 10 Vertically
      ),
    );
  }

//snack bar
/*  static SnackBar showSnackBar(String content) {
    SnackBar snackBar = SnackBar(
      content: Text(
        content,
        style: const TextStyle(color: Colors.white),
      ),
      backgroundColor: AppColors.appRed,
      elevation: 0,
      padding: const EdgeInsets.all(twentyFiveDp),
      duration: const Duration(seconds: 3),
    );

    return snackBar;
  }*/
}
