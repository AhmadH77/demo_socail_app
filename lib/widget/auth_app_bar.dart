import 'package:flutter/material.dart';
import 'package:social_app_demo/constants/dimens.dart';

import 'auth_button.dart';

class AuthAppBar extends StatefulWidget {
  final Function()? onTap;
  final Function()? onBackArrowPressed;
  final buttonName;

  const AuthAppBar(
      {Key? key,
      required this.onTap,
      required this.buttonName,
      required this.onBackArrowPressed})
      : super(key: key);

  @override
  State<AuthAppBar> createState() => _AuthAppBarState();
}

class _AuthAppBarState extends State<AuthAppBar> {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: EdgeInsets.only(top: tenDp),
          child: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            color: Colors.white,
            onPressed: widget.onBackArrowPressed,
          ),
        ),
        Container(
          width: oneTwentyDp,
          child: AuthButton(
            isAuth: true,
            onButtonTapped: widget.onTap,
            buttonName: widget.buttonName,
            borderColor: Colors.white,
          ),
        )
      ],
    );
  }
}
