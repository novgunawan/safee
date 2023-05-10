import 'package:flutter/material.dart';

class BoxBorderDecoration extends BoxDecoration {
  final Color backgroundColor;
  final Color? borderColor;

  BoxBorderDecoration({required this.backgroundColor, this.borderColor})
      : super(
          color: backgroundColor,
          border: Border.all(color: borderColor ?? backgroundColor),
          borderRadius: BorderRadius.circular(16.0),
        );
}
