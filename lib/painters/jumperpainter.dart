import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class JumperPainter extends CustomPainter {

  @override
  void paint(Canvas canvas, Size size) {

    //draw the body
    final path = Path();
    path.moveTo(0, 0);
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height * 3 / 4);
    path.lineTo(size.width * 7 / 8, size.height);
    path.lineTo(size.width * 6 / 8, size.height * 3 / 4);
    path.lineTo(size.width * 5 / 8, size.height);
    path.lineTo(size.width * 4 / 8, size.height * 3 / 4);
    path.lineTo(size.width * 3 / 8, size.height);
    path.lineTo(size.width * 2 / 8, size.height * 3 / 4);
    path.lineTo(size.width * 1 / 8, size.height);
    path.lineTo(0, size.height * 3 / 4);
    path.close();
    final paint = Paint()..color = Colors.yellow;
    canvas.drawPath(path, paint);

    //draw the eyes
    final rect = Rect.fromLTWH(size.width * 5 / 8,  size.width / 4, size.width / 4, size.height / 4);
    final rect2 = Rect.fromLTWH(size.width * 1 / 8,  size.width / 4, size.width / 4, size.height / 4);
    final startAngle = - pi / 4;
    final sweepAngle = pi;
    final useCenter = false;
    final path2 = Path();
    path2.arcTo(rect, startAngle, sweepAngle, useCenter);
    final path3 = Path();
    path3.arcTo(rect2, - startAngle, sweepAngle, useCenter);
    final paint2 = Paint()..color = Colors.black;
    canvas.drawPath(path2, paint2);
    canvas.drawPath(path3, paint2);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}