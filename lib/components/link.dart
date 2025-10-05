import 'package:flutter/material.dart';
import 'package:btaskee_app/design_tokens/tokens.dart';

class AppLink extends StatelessWidget {
  final String label;
  final VoidCallback onTap;

  const AppLink({
    super.key,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Text(
        label,
        style: AppTextStyles.body.copyWith(
          color: AppColors.primary,
          decoration: TextDecoration.underline,
        ),
      ),
    );
  }
}
