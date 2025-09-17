import 'package:flutter/material.dart';
import 'package:btaskee_app/design_tokens//tokens.dart';


enum ButtonVariant { primary, secondary, outline }


class AppButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  final ButtonVariant variant;


  const AppButton({
    Key? key,
    required this.label,
    required this.onPressed,
    this.variant = ButtonVariant.primary,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    Color bgColor;
    Color textColor;
    BorderSide? border;


    switch (variant) {
      case ButtonVariant.primary:
        bgColor = AppColors.primary;
        textColor = Colors.white;
        border = BorderSide.none;
        break;
      case ButtonVariant.secondary:
        bgColor = AppColors.secondary;
        textColor = Colors.white;
        border = BorderSide.none;
        break;
      case ButtonVariant.outline:
        bgColor = Colors.transparent;
        textColor = AppColors.primary;
        border = const BorderSide(color: AppColors.primary, width: 1.5);
        break;
    }


    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: bgColor,
        disabledBackgroundColor: AppColors.disabled,
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.lg,
          vertical: AppSpacing.sm,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: border,
        ),
      ),
      child: Text(label, style: AppTextStyles.body.copyWith(color: textColor)),
    );
  }
}