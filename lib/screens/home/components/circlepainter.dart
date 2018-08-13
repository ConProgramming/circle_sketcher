import 'package:flutter/material.dart';
import 'dart:math';
import 'package:circle_drawer/models/circletype.dart';

class CirclePainter extends CustomPainter {
  double shadedAmount;
  CircleType circleType;

  CirclePainter({this.shadedAmount, this.circleType});

  @override
  void paint(Canvas canvas, Size size) {
    final Paint circlePaint = Paint()
      ..color = Colors.deepOrange[800]
      ..strokeCap = StrokeCap.butt
      ..style = PaintingStyle.stroke
      ..strokeWidth = 15.0;

    final Paint circleShadedPaint = Paint()
      ..color = Colors.deepOrange
      ..strokeCap = StrokeCap.butt
      ..style = PaintingStyle.fill
      ..strokeWidth = 10.0;

    if (circleType == CircleType.degrees) {
      shadedAmount = shadedAmount * pi / 180;
    }

    Offset center = new Offset(size.width / 2, size.height / 2);
    double radius = min(size.width / 2, size.height / 2);

    canvas.save();

    canvas.drawArc(Rect.fromCircle(center: center, radius: radius), -pi / 2,
        shadedAmount, true, circleShadedPaint);

    canvas.drawCircle(center, radius, circlePaint);

    canvas.restore();
  }

  //May want to consider changing for better optimization
  @override
  bool shouldRepaint(CirclePainter oldDelegate) => true;
}