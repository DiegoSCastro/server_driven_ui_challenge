import 'package:flutter/material.dart';

class ClipOvalAppBarBottom extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double w = size.width;
    double h = size.height;

    final path = Path();
    path.moveTo(0, 0);
    path.lineTo(w, 0);
    path.lineTo(w, h * 0.9389359);
    path.cubicTo(w, h * 0.9389359, w * 0.7953111, h, w * 0.5, h);
    path.cubicTo(w * 0.2046875, h, 0, h * 0.9389359, 0, h * 0.9389359);
    path.lineTo(0, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
