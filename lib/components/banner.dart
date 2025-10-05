import 'package:flutter/material.dart';
import 'package:btaskee_app/design_tokens/tokens.dart';

enum BannerType { info, success, error }

class AppBanner extends StatelessWidget {
  final String message;
  final BannerType type;
  final VoidCallback? onClose;

  const AppBanner({
    super.key,
    required this.message,
    this.type = BannerType.info,
    this.onClose,
  });

  Color _backgroundColor() {
    switch (type) {
      case BannerType.success:
        return AppColors.secondary;
      case BannerType.error:
        return AppColors.error;
      case BannerType.info:
      default:
        return AppColors.primary;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: _backgroundColor(),
        borderRadius: BorderRadius.circular(AppRadius.sm),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              message,
              style: AppTextStyles.body.copyWith(color: Colors.white),
            ),
          ),
          if (onClose != null)
            IconButton(
              icon: const Icon(Icons.close, color: Colors.white),
              onPressed: onClose,
            ),
        ],
      ),
    );
  }
}
