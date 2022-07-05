import 'package:flutter/material.dart';
import 'dart:math' as math show sin, pi;


class CurveWave extends Curve {
  //const PulsateCurve();
  @override
  double transform(double t) {
    if(t ==0 || t == 1) {
      return 0.01;
    }
    return math.sin(t * math.pi);
  }
}