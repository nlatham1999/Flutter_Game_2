import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class BombPainter extends CustomPainter {
  final Color color;

  BombPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final circleRadius = size.width / 2;
    final circleOffset = Offset(size.width / 2, size.height / 2);
    final circlePaint = Paint()..color = color;
    canvas.drawCircle(circleOffset, circleRadius, circlePaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}