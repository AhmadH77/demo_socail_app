import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:social_app_demo/constants/dimens.dart';

class AuthButton extends StatefulWidget {
  final buttonName;
  final bool isAuth;
  final Function()? onButtonTapped;

  const AuthButton(
      {Key? key,
      required this.buttonName,
      required this.onButtonTapped,
      required this.isAuth})
      : super(key: key);

  @override
  State<AuthButton> createState() => _AuthButtonState();
}

class _AuthButtonState extends State<AuthButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          right: widget.isAuth ? tenDp : hundredDp,
          top: widget.isAuth ? 5 : twentyDp,
          left: widget.isAuth ? 0 : hundredDp),
      height: fortyDp,
      child: MaterialButton(
        shape: RoundedRectangleBorder(
            side: BorderSide(
                color: widget.isAuth ? Colors.white : Colors.white,
                width: widget.isAuth ? 2 : 0),
            borderRadius: BorderRadius.circular(twentyDp)),
        minWidth: MediaQuery.of(context).size.width,
        height: fiftyDp,
        onPressed: widget.onButtonTapped,
        child: Text(
          widget.buttonName,
          style: TextStyle(
              color: widget.isAuth ? Colors.white : Colors.black,
              fontSize: sixteenDp,
              fontWeight: FontWeight.bold),
        ),
        color: widget.isAuth ? Colors.transparent : Colors.white,
      ),
    );
  }
}
