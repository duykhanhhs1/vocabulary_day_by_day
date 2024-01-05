import 'package:flutter/material.dart';

/// Horizontal spacer
class HSpacer extends SizedBox {
  const HSpacer(double size, {super.key}) : super(width: size);
}

/// Vertical spacer
class VSpacer extends SizedBox {
  const VSpacer(double size, {super.key}) : super(height: size);
}

/// Empty spacer
class EmptySpacer extends SizedBox {
  const EmptySpacer({super.key});
}
