import 'package:flutter/material.dart';
import 'package:btaskee_app/design_tokens/tokens.dart';

class AppListItem extends StatelessWidget {
  final IconData? icon;
  final String title;
  final String? subtitle;
  final VoidCallback? onTap;

  const AppListItem({
    super.key,
    this.icon,
    required this.title,
    this.subtitle,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: icon != null
          ? Icon(icon, color: AppColors.primary)
          : null,
      title: Text(title, style: AppTextStyles.body),
      subtitle: subtitle != null
          ? Text(subtitle!, style: AppTextStyles.caption)
          : null,
      onTap: onTap,
    );
  }
}

class AppList extends StatelessWidget {
  final List<AppListItem> items;

  const AppList({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: items,
    );
  }
}
