import 'package:flutter/material.dart';
import 'package:btaskee_app/design_tokens//tokens.dart';


class AppCard extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry padding;


  const AppCard({
    Key? key,
    required this.child,
    this.padding = const EdgeInsets.all(AppSpacing.md),
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.surface,
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(padding: padding, child: child),
    );
  }
}