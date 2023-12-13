import 'package:flutter/material.dart';

class ScreenCardClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final width = size.width;
    final height = size.height;

    var path = Path();

    path.lineTo(0, height * 0.3);
    path.quadraticBezierTo(width * 0.4, height * 0.2, width * 0.32, 0);

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
