import 'dart:math';

import 'package:flutter/material.dart';

class CirclePainter extends CustomPainter {
  final Offset? startPosition;
  final Offset? currentPosition;
  final bool isPanning;
  final Size screenSize;

  CirclePainter(this.startPosition, this.isPanning, this.currentPosition, this.screenSize);

  @override
  void paint(Canvas canvas, Size size) {
    if (isPanning && startPosition != null) {
      final paint = Paint()
        ..color = Colors.white.withOpacity(0.1)
        ..style = PaintingStyle.fill;

      final paint3 = Paint()
        ..color = Colors.white.withOpacity(.8)
        ..style = PaintingStyle.fill;

      // Rectangle bounds for the circles
      final rectLargeCircle = Rect.fromCircle(center: startPosition!, radius: screenSize.width / 2.5);
      final rectMediumCircle = Rect.fromCircle(center: startPosition!, radius: screenSize.width / 3.5);
      final rectSmallCircle = Rect.fromCircle(center: startPosition!, radius: screenSize.width / 7.5);
      final rectTinyCircle = Rect.fromCircle(center: startPosition!, radius: screenSize.width / 12.0);

      // Draw arc for both circles (-60 to 60 degrees)
      // canvas.drawArc(rectLargeCircle, 0 * pi / 180, 60 * pi / 180, true, paint);
      // canvas.drawArc(rectSmallCircle, 0 * pi / 180, 60 * pi / 180, true, paint);
      
      canvas.drawArc(rectLargeCircle, 144 * pi / 180, 252 * pi / 180, true, paint);
      canvas.drawArc(rectMediumCircle, 144 * pi / 180, 252 * pi / 180, true, paint);
      canvas.drawArc(rectSmallCircle, 144 * pi / 180, 252 * pi / 180, true, paint);
      canvas.drawArc(rectTinyCircle, 144 * pi / 180, 252 * pi / 180, true, paint);

      canvas.drawArc(rectLargeCircle, 288 * pi / 180, 36 * pi / 180, true, paint);
      canvas.drawArc(rectMediumCircle, 288 * pi / 180, 36 * pi / 180, true, paint);
      canvas.drawArc(rectSmallCircle, 288 * pi / 180, 36 * pi / 180, true, paint);
      canvas.drawArc(rectTinyCircle, 288 * pi / 180, 36 * pi / 180, true, paint);
      
      canvas.drawArc(rectLargeCircle, 216 * pi / 180, 36 * pi / 180, true, paint);
      canvas.drawArc(rectMediumCircle, 216 * pi / 180, 36 * pi / 180, true, paint);
      canvas.drawArc(rectSmallCircle, 216 * pi / 180, 36 * pi / 180, true, paint);
      canvas.drawArc(rectTinyCircle, 216 * pi / 180, 36 * pi / 180, true, paint);

      canvas.drawCircle(currentPosition!, screenSize.width / 30, paint3);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}