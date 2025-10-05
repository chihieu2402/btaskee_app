import 'package:flutter/material.dart';
import 'package:btaskee_app/design_tokens/tokens.dart';

class SectionHeading extends StatelessWidget {
  final String title;
  final String? subtitle;

  const SectionHeading({
    super.key,
    required this.title,
    this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: AppTextStyles.heading),
        if (subtitle != null) ...[
          const SizedBox(height: AppSpacing.xs),
          Text(subtitle!, style: AppTextStyles.caption),
        ],
        const SizedBox(height: AppSpacing.sm),
      ],
    );
  }
}
