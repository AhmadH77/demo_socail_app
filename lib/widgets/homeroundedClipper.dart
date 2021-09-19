///
/// Author: Damodar Lohani
/// profile: https://github.com/lohanidamodar
///

import 'package:flutter/material.dart';

/// Clip widget in oval shape at right side
class HomeRoundedClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, 0);
    path.lineTo(size.width - 10, 0);
    path.quadraticBezierTo(
        size.width, size.height / 4, size.width, size.height / 1.6);
    path.quadraticBezierTo(
        size.width,
        size.height, //- (size.height / 9),
        0,
        size.height);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
