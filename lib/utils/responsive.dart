import 'dart:math' as math;

import 'package:flutter/cupertino.dart';

class Responsive {
  final double width, height, diagonal;
  Responsive(
    this.width,
    this.height,
    this.diagonal,
  );
  factory Responsive.of(BuildContext context) {
    final MediaQueryData data = MediaQuery.of(context);
    final size = data.size;
    final diagonal =
        math.sqrt(math.pow(size.width, 2) + math.pow(size.height, 2));
    return Responsive(size.width, size.height, diagonal);
  }
  double wp(double percent) {
    return width * percent / 100;
  }

  double hp(double percent) {
    return height * percent / 100;
  }

  double dp(double percent) {
    return diagonal * percent / 100;
  }
}
