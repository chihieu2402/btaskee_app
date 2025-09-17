import 'package:flutter/material.dart';


class AppColors {
  static const Color primary = Color(0xFF276EF1);
  static const Color secondary = Color(0xFF05A357);
  static const Color background = Colors.white;
  static const Color surface = Color(0xFFF6F6F6);
  static const Color textPrimary = Color(0xFF000000);
  static const Color textSecondary = Color(0xFF545454);
  static const Color error = Color(0xFFE11900);
  static const Color disabled = Color(0xFFBDBDBD);
}


class AppSpacing {
  static const double xs = 4;
  static const double sm = 8;
  static const double md = 16;
  static const double lg = 24;
  static const double xl = 32;
}


class AppTextStyles {
  static const TextStyle body = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    color: AppColors.textPrimary,
  );


  static const TextStyle heading = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
  );
}