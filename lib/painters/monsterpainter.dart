import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class MonsterPainter extends CustomPainter {
  final int direction;

  MonsterPainter({required this.direction});

  @override
  void paint(Canvas canvas, Size size) {

    //monster body
    final path = Path();
    path.moveTo(0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);
    path.close();
    final paint = Paint()..color = Colors.purple;
    canvas.drawPath(path, paint);

    //monsters eyes
    final circleRadius = size.width / 10;
    final circleOffset = direction == 1 ? Offset(size.width - circleRadius, size.height/4) : Offset(circleRadius, size.height/4);
    final circlePaint = Paint()..color = Colors.black;
    canvas.drawCircle(circleOffset, circleRadius, circlePaint);

    // monster mouth
    final path2 = Path();
    path2.moveTo(0 + direction * size.width * 3 / 8, size.height * 4 / 8);
    path2.lineTo(size.width * 5 / 8 + direction * size.width * 3 / 8, size.height * 4 / 8);
    path2.lineTo(size.width * 5 / 8 + direction * size.width * 3 / 8, size.height * 7 / 8);
    path2.lineTo(0 + direction * size.width * 3 / 8, size.height * 7 / 8);
    path2.close();
    final paint2 = Paint()..color = Colors.black;
    canvas.drawPath(path2, paint2);

    //monster teeth
    final path3 = Path();
    path3.moveTo(0 + direction * size.width * 3 / 8, size.height * 4 / 8);
    path3.lineTo(size.width * 5 / 8 + direction * size.width * 3 / 8, size.height * 4 / 8);
    path3.lineTo(size.width * 5 / 8 + direction * size.width / 4, size.height * 5 / 8);
    path3.lineTo(size.width * 4 / 8 + direction * size.width / 4, size.height * 4 / 8);
    path3.lineTo(size.width * 3 / 8 + direction * size.width / 4, size.height * 5 / 8);
    path3.lineTo(size.width * 2 / 8 + direction * size.width / 4, size.height * 4 / 8);
    path3.lineTo(size.width * 1 / 8 + direction * size.width / 4, size.height * 5 / 8);
    path3.close();

    final path4 = Path();
    if(direction == 1){
      // path4.moveTo(size.width * 2 / 8, size.height * 4 / 8);
      // path4.lineTo(size.width * 5 / 16, size.height * 4 / 8);
      // path4.lineTo(size.width * 5 / 16, size.height * 7 / 8);
      // path4.lineTo(size.width * 2 / 8, size.height * 7 / 8);
        
      final rect = Rect.fromLTWH(size.width * 2 / 8, size.height * 5 / 8 - size.height / 8, size.width * 2 / 8, size.height * 3 / 8);
      final startAngle = pi / 2;
      final sweepAngle = pi;
      final useCenter = true;
      path4.arcTo(rect, startAngle, sweepAngle, useCenter);
      path4.close();
    }else{
      // path4.moveTo(size.width * 5 / 8, size.height * 4 / 8);
      // path4.lineTo(size.width * 6 / 8, size.height * 4 / 8);
      // path4.lineTo(size.width * 6 / 8, size.height * 7 / 8);
      // path4.lineTo(size.width * 5 / 8, size.height * 7 / 8);
      // path4.close();

      
      final rect = Rect.fromLTWH(size.width * 4 / 8, size.height * 5 / 8 - size.height / 8, size.width * 2 / 8, size.height * 3 / 8);
      final startAngle = pi / 2;
      final sweepAngle = - pi;
      final useCenter = true;
      path4.arcTo(rect, startAngle, sweepAngle, useCenter);
      path4.close();
    }
    
    path3.moveTo(0 + direction * size.width * 3 / 8, size.height * 7 / 8);
    path3.lineTo(size.width * 5 / 8 + direction * size.width * 3 / 8, size.height * 7 / 8);
    path3.lineTo(size.width * 5 / 8 + direction * size.width / 4, size.height * 6 / 8);
    path3.lineTo(size.width * 4 / 8 + direction * size.width / 4, size.height * 7 / 8);
    path3.lineTo(size.width * 3 / 8 + direction * size.width / 4, size.height * 6 / 8);
    path3.lineTo(size.width * 2 / 8 + direction * size.width / 4, size.height * 7 / 8);
    path3.lineTo(size.width * 1 / 8 + direction * size.width / 4, size.height * 6 / 8);
    path3.close();
    final paint3 = Paint()..color = Colors.white;
    canvas.drawPath(path3, paint3);
    canvas.drawPath(path4, paint3);

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}