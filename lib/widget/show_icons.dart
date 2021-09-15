import 'package:flutter/material.dart';
import 'package:social_app_demo/constants/dimens.dart';

class ShowIcon extends StatelessWidget {
  final iconName;
  final Function()? onIconTap;

  const ShowIcon({Key? key, required this.iconName, required this.onIconTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onIconTap,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: sixDp),
        height: thirtyDp,
        width: thirtyDp,
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage(
            iconName,
          ),
        )),
      ),
    );
  }
}
