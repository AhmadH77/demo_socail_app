import 'package:flutter/material.dart';
import 'package:social_app_demo/constants/dimens.dart';

import 'auth_button.dart';

class AuthAppBar extends StatelessWidget {
  final Function()? onTap;
  final buttonName;

  const AuthAppBar({Key? key, required this.onTap, required this.buttonName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: tenDp),
          child: GestureDetector(
            onTap: () => Navigator.of(context).pop(),
            child: Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            ),
          ),
        ),
        Container(
          width: oneTwentyDp,
          child: AuthButton(
            isAuth: true,
            onButtonTapped: () async => onTap,
            buttonName: buttonName,
          ),
        )
      ],
    );
  }
}
