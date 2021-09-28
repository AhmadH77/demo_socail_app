import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:social_app_demo/constants/dimens.dart';
import 'package:social_app_demo/constants/strings.dart';
import 'package:social_app_demo/ui/auth/signup/sign_up.dart';
import 'package:social_app_demo/widget/auth_app_bar.dart';
import 'package:social_app_demo/widget/bg_image.dart';

import 'login_page.dart';

class StateCheck extends StatefulWidget {
  final bool isLogin;

  const StateCheck({Key? key, required this.isLogin}) : super(key: key);

  @override
  _StateCheck createState() => _StateCheck();
}

class _StateCheck extends State<StateCheck> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Stack(
          fit: StackFit.loose,
          children: [
            Container(
              child: BgImage(image: 'assets/images/4.jpg'),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: fortyDp,
                left: sixteenDp,
              ),
              child: !widget.isLogin
                  ? AuthAppBar(
                      onTap: () async {
                        print("sfdf");
                      },
                      buttonName: login,
                      onBackArrowPressed: () async {
                        print("sfdf");
                        return Navigator.pop(context);
                      },
                    )
                  : AuthAppBar(
                      onTap: () {
                        print("sfdf");
                      },
                      buttonName: signup,
                      onBackArrowPressed: () {
                        print("sfdf");
                        return Navigator.of(context).pop();
                      },
                    ),
            ),
            widget.isLogin ? LoginPage() : SignupPage()
          ],
        ),
      ),
    );
  }
}
