import 'package:flutter/material.dart';
import 'dart:math' as math show sin, pi, sqrt;


class CirclePainter extends CustomPainter {

  late final Color colorValue;
  late final Animation<double> _animation;

  CirclePainter(
      this._animation, {
        required this.colorValue,
      }) : super(repaint: _animation);

  void circle(Canvas canvas, Rect rect, double value) {
    final double opacity = (1.0 - (value / 4.0)).clamp(0.0, 1.0);
    final Color color = colorValue.withOpacity(opacity);
    final double size = rect.width/2;
    final double area = size * size;
    final double radius = math.sqrt(area * value / 4);
    final Paint paint = Paint()..color = color;
    canvas.drawCircle(rect.center, radius, paint);
  }



  @override
  void paint(Canvas canvas, Size size) {
    final Rect rect = Rect.fromLTRB(0.0, 0.0, size.width, size.height);
    for(int wave = 3; wave >= 0; wave--) {
      circle(canvas, rect, wave + _animation.value);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;

}