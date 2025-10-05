import 'package:flutter/material.dart';
import 'package:btaskee_app/design_tokens/tokens.dart';

class AppPlaceholder extends StatelessWidget {
  final double width;
  final double height;
  final BorderRadius? borderRadius;

  const AppPlaceholder({
    super.key,
    this.width = double.infinity,
    this.height = 16,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: AppColors.border.withOpacity(0.3),
        borderRadius: borderRadius ?? BorderRadius.circular(AppRadius.sm),
      ),
    );
  }
}
