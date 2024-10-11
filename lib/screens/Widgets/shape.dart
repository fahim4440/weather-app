import 'package:flutter/material.dart';

Align Shape(double x, double y, BoxShape shape, Color color) {
  return Align(
    alignment: AlignmentDirectional(x, y),
    child: Container(
      height: 300,
      width: 300,
      decoration: BoxDecoration(
        shape: shape,
        color: color,
      ),
    ),
  );
}