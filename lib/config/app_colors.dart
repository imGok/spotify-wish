import 'package:flutter/material.dart';

class AppColors {
  static const int _green = 0xFF00B536;
  static const MaterialColor primary = MaterialColor(
    _green,
    <int, Color>{
      50: Color(0xFFE8F5E9),
      100: Color(0xFFC8E6C9),
      200: Color(0xFFA5D6A7),
      300: Color(0xFF81C784),
      400: Color(0xFF66BB6A),
      500: Color(_green),
      600: Color(0xFF43A047),
      700: Color(0xFF388E3C),
      800: Color(0xFF2E7D32),
      900: Color(0xFF1B5E20),
    },
  );

  static Color? secondaryTextColor = Colors.grey[600];
  static Color? disabledColor = Colors.grey[900];
}
