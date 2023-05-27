import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class PlayerPainter extends CustomPainter {
  final Color color;
  final int direction;

  PlayerPainter({required this.color, required this.direction});

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Rect.fromLTWH(0, 0, size.width, size.height);
    final startAngle = 0.0;
    final sweepAngle = -pi;
    final useCenter = false;

    final path = Path();
    path.moveTo(0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, size.height / 2);
    path.lineTo(0, size.height / 2);
    path.close();
    path.arcTo(rect, startAngle, sweepAngle, useCenter);

    final paint = Paint()..color = color;
    canvas.drawPath(path, paint);

    final circleRadius = size.width / 10;
    final circleOffset = direction == 0 ? Offset(size.width - circleRadius, size.height/2.8) : Offset(circleRadius, size.height/2.8);
    final circlePaint = Paint()..color = Colors.black;
    canvas.drawCircle(circleOffset, circleRadius, circlePaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}