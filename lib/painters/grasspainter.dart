import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class GrassPainter extends CustomPainter {

  @override
  void paint(Canvas canvas, Size size) {

    final dirtTop = size.height / 4;
    final quarter = size.width/4;

    final path = Path();
    path.moveTo(0, dirtTop);
    path.lineTo(size.width, dirtTop);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);
    path.close();

    final paint = Paint()..color = Colors.green;
    canvas.drawPath(path, paint);

    final path2 = Path();
    path2.moveTo(0, size.height);
    path2.lineTo(size.width, size.height);
    path2.lineTo(size.width, dirtTop);
    path2.lineTo(0, dirtTop);
    path2.close();

    final paint2 = Paint()..color = Colors.brown[400]!;
    canvas.drawPath(path2, paint2);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}