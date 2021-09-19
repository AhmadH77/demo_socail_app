import 'package:flutter/material.dart';

/// Clip widget in wave shape
class LeftRoundedClipper extends CustomClipper<Path> {
  /// reverse the wave direction in vertical axis
  bool reverse;

  /// flip the wave direction horizontal axis
  bool flip;

  LeftRoundedClipper({this.reverse = false, this.flip = false});

  @override
  Path getClip(Size size) {
    var path = Path();
    path.moveTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);

    var firstControlPoint = Offset(size.width - 2, size.height / 1.5);
    var firstEndPoint = Offset(size.width - (size.width / 7), size.height / 8);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);

    var secondControlPoint = Offset(size.width - (size.width / 8), 0);
    var secondEndPoint = Offset(size.width, 0);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
