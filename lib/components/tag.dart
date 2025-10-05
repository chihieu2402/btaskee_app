import 'package:flutter/material.dart';
import 'package:btaskee_app/design_tokens/tokens.dart';

enum TagType { success, warning, error, info }

class AppTag extends StatelessWidget {
  final String label;
  final TagType type;

  const AppTag({
    super.key,
    required this.label,
    this.type = TagType.info,
  });

  Color _getBackground() {
    switch (type) {
      case TagType.success:
        return AppColors.secondary.withOpacity(0.1);
      case TagType.warning:
        return Colors.orange.withOpacity(0.1);
      case TagType.error:
        return AppColors.error.withOpacity(0.1);
      case TagType.info:
      default:
        return AppColors.primary.withOpacity(0.1);
    }
  }

  Color _getTextColor() {
    switch (type) {
      case TagType.success:
        return AppColors.secondary;
      case TagType.warning:
        return Colors.orange;
      case TagType.error:
        return AppColors.error;
      case TagType.info:
      default:
        return AppColors.primary;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: AppSpacing.xs,
        horizontal: AppSpacing.sm,
      ),
      decoration: BoxDecoration(
        color: _getBackground(),
        borderRadius: BorderRadius.circular(AppRadius.sm),
      ),
      child: Text(
        label,
        style: AppTextStyles.caption.copyWith(color: _getTextColor()),
      ),
    );
  }
}
