import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:social_app_demo/constants/dimens.dart';

class ShowSvgIcon extends StatelessWidget {
  final iconName;
  final Color color;
  final Function()? onIconTap;

  const ShowSvgIcon(
      {Key? key,
      required this.iconName,
      required this.onIconTap,
      required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onIconTap,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: sixDp),
        height: thirtyDp,
        width: thirtyDp,
        child: Center(
            child: SvgPicture.asset(
          iconName,
          color: color,
          placeholderBuilder: (BuildContext context) => Container(),
        )),
      ),
    );
  }
}
