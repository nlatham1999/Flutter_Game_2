import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class DeadMonsterPainter extends CustomPainter {

  @override
  void paint(Canvas canvas, Size size) {

    final path = Path();
    path.moveTo(0, 0);
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    final paint = Paint()..color = Colors.purple;
    canvas.drawPath(path, paint);

    final xPaint = Paint()
      ..color = Colors.black
      ..strokeWidth = 2.0;

    canvas.drawLine(
      Offset(size.width / 8, size.width / 8),
      Offset(size.width * 3 / 8, size.width * 3 / 8),
      xPaint,
    );
    canvas.drawLine(
      Offset(size.width * 3 / 8, size.width / 8),
      Offset(size.width / 8, size.width * 3 / 8),
      xPaint,
    );

    canvas.drawLine(
      Offset(size.width * 5 / 8, size.width / 8),
      Offset(size.width * 7 / 8, size.width * 3 / 8),
      xPaint,
    );
    canvas.drawLine(
      Offset(size.width * 7 / 8, size.width / 8),
      Offset(size.width * 5 / 8, size.width * 3 / 8),
      xPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}