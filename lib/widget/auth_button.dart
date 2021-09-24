import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:social_app_demo/constants/dimens.dart';

class AuthButton extends StatelessWidget {
  final buttonName;
  final Function() onButtonTapped;

  const AuthButton(
      {Key? key, required this.buttonName, required this.onButtonTapped})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: eightyDp, vertical: twentyDp),
      height: fortyDp,
      child: MaterialButton(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(twentyDp)),
        minWidth: MediaQuery.of(context).size.width,
        height: fiftyDp,
        onPressed: onButtonTapped,
        child: Text(
          buttonName,
          style: TextStyle(
              color: Colors.black,
              fontSize: sixteenDp,
              fontWeight: FontWeight.bold),
        ),
        color: Colors.white,
      ),
    );
  }
}
