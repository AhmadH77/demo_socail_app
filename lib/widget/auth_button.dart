import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:social_app_demo/constants/dimens.dart';

class AuthButton extends StatelessWidget {
  final buttonName;
  final bool isAuth;
  final Function() onButtonTapped;

  const AuthButton(
      {Key? key,
      required this.buttonName,
      required this.onButtonTapped,
      required this.isAuth})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          right: isAuth ? tenDp : hundredDp,
          top: isAuth ? 5 : twentyDp,
          left: isAuth ? 0 : hundredDp),
      height: fortyDp,
      child: MaterialButton(
        shape: RoundedRectangleBorder(
            side: BorderSide(
                color: isAuth ? Colors.white : Colors.white,
                width: isAuth ? 2 : 0),
            borderRadius: BorderRadius.circular(twentyDp)),
        minWidth: MediaQuery.of(context).size.width,
        height: fiftyDp,
        onPressed: onButtonTapped,
        child: Text(
          buttonName,
          style: TextStyle(
              color: isAuth ? Colors.white : Colors.black,
              fontSize: sixteenDp,
              fontWeight: FontWeight.bold),
        ),
        color: isAuth ? Colors.transparent : Colors.white,
      ),
    );
  }
}
