import 'package:flutter/material.dart';
import 'package:btaskee_app/design_tokens/tokens.dart';

class AppInputCheck extends StatelessWidget {
  final String label;
  final bool value;
  final ValueChanged<bool?> onChanged;

  const AppInputCheck({
    super.key,
    required this.label,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: value,
          onChanged: onChanged,
          activeColor: AppColors.primary,
          checkColor: Colors.white,
        ),
        Text(label, style: AppTextStyles.body),
      ],
    );
  }
}
