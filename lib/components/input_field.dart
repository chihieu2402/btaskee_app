import 'package:flutter/material.dart';
import 'package:btaskee_app/design_tokens//tokens.dart';


class AppInputField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool isError;
  final bool isDisabled;


  const AppInputField({
    Key? key,
    required this.controller,
    required this.hintText,
    this.isError = false,
    this.isDisabled = false,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      enabled: !isDisabled,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: AppTextStyles.body.copyWith(color: AppColors.textSecondary),
        filled: true,
        fillColor: isDisabled ? AppColors.surface : Colors.white,
        contentPadding: const EdgeInsets.symmetric(
          vertical: AppSpacing.sm,
          horizontal: AppSpacing.md,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: AppColors.textSecondary.withOpacity(0.4)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: AppColors.primary, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: AppColors.error, width: 2),
        ),
      ),
    );
  }
}