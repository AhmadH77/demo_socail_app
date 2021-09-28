import 'package:flutter/material.dart';
import 'package:social_app_demo/constants/dimens.dart';

class AuthError extends StatelessWidget {
  final message;

  const AuthError({Key? key, this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      //todo only show this when OTP IS INVALID
      margin: EdgeInsets.only(top: twentyDp, left: sixteenDp, right: sixteenDp),
      padding: EdgeInsets.all(fourDp),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(sixteenDp),
          color: Colors.transparent.withOpacity(0.2)),
      child: Center(
        child: Text(
          message,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
