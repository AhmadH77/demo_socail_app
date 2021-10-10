import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:social_app_demo/constants/dimens.dart';

class InterestContainer extends StatefulWidget {
  final String image;
  final double width;
  final double height;
  final String title;
  final double marginLeft, marginRight, marginTop, marginBottom;
  final Function() onTap;

  const InterestContainer(
      {Key? key,
      required this.image,
      required this.width,
      required this.height,
      required this.title,
      required this.onTap,
      required this.marginTop,
      required this.marginLeft,
      required this.marginRight,
      required this.marginBottom})
      : super(key: key);

  @override
  State<InterestContainer> createState() => _InterestContainerState();
}

class _InterestContainerState extends State<InterestContainer> {
  bool isTitleShowing = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.only(
            left: widget.marginLeft,
            right: widget.marginRight,
            top: widget.marginTop,
            bottom: widget.marginBottom),
        width: widget.width,
        height: widget.height,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(tenDp),
            image: DecorationImage(
                image: AssetImage(widget.image), fit: BoxFit.cover)),
        child: Center(
          child: Text(
            widget.title,
            style: TextStyle(
                color: Colors.white,
                fontSize: twentyDp,
                fontWeight: FontWeight.w500),
          ),
        ),
      ),
    );
  }
}
