import 'package:flutter/material.dart';

// context.height and context.width extension
extension ContextExtension on BuildContext {
  double get height => MediaQuery.of(this).size.height;
  double get width => MediaQuery.of(this).size.width;
  bool get isPortrait => MediaQuery.of(this).orientation == Orientation.portrait;
}
