import 'package:flutter/material.dart';
import 'package:btaskee_app/design_tokens//tokens.dart';

class AppButtonGroup extends StatelessWidget {
  final List<String> labels;
  final int selectedIndex;
  final ValueChanged<int> onChanged;


  const AppButtonGroup({
    Key? key,
    required this.labels,
    required this.selectedIndex,
    required this.onChanged,
  }) : super(key: key);

@override
Widget build(BuildContext context) {
  return Row(
    mainAxisSize: MainAxisSize.min,
    children: List.generate(labels.length, (index) {
      final isSelected = index == selectedIndex;
      return Expanded(
        child: GestureDetector(
          onTap: () => onChanged(index),
          child: Container(
            padding: const EdgeInsets.symmetric(
              vertical: AppSpacing.sm,
            ),
            decoration: BoxDecoration(
              color: isSelected ? AppColors.primary : AppColors.surface,
              border: Border.all(color: AppColors.primary),
              borderRadius: BorderRadius.horizontal(
                left: index == 0 ? const Radius.circular(8) : Radius.zero,
                right: index == labels.length - 1
                    ? const Radius.circular(8)
                    : Radius.zero,
              ),
            ),
            child: Center(
              child: Text(
                labels[index],
                style: AppTextStyles.body.copyWith(
                  color: isSelected ? Colors.white : AppColors.textPrimary,
                ),
              ),
            ),
          ),
        ),
      );
    }),
  );
}
}