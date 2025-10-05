import 'package:flutter/material.dart';
import 'package:btaskee_app/design_tokens/tokens.dart';

class AppDialog extends StatelessWidget {
  final String title;
  final String message;
  final String confirmText;
  final String cancelText;
  final VoidCallback onConfirm;
  final VoidCallback? onCancel;

  const AppDialog({
    super.key,
    required this.title,
    required this.message,
    required this.confirmText,
    this.cancelText = "Cancel",
    required this.onConfirm,
    this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppRadius.md),
      ),
      title: Text(title, style: AppTextStyles.heading),
      content: Text(message, style: AppTextStyles.body),
      actions: [
        if (onCancel != null)
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              onCancel!();
            },
            child: Text(cancelText, style: AppTextStyles.body),
          ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primary,
            foregroundColor: Colors.white,
          ),
          onPressed: () {
            Navigator.of(context).pop();
            onConfirm();
          },
          child: Text(confirmText, style: AppTextStyles.body.copyWith(color: Colors.white)),
        ),
      ],
    );
  }
}
