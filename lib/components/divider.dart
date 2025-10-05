import 'package:flutter/material.dart';
import 'package:btaskee_app/design_tokens/tokens.dart';

class AppDivider extends StatelessWidget {
  final double thickness;
  final double indent;

  const AppDivider({
    super.key,
    this.thickness = 1,
    this.indent = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: AppColors.border,
      thickness: thickness,
      indent: indent,
      endIndent: indent,
    );
  }
}
