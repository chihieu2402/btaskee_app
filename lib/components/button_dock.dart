import 'package:flutter/material.dart';
import 'package:btaskee_app/design_tokens/tokens.dart';
import 'button.dart';


class AppButtonDock extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;


  const AppButtonDock({Key? key, required this.label, required this.onPressed})
      : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 8, offset: Offset(0, -2)),
        ],
      ),
      child: SafeArea(
        child: AppButton(label: label, onPressed: onPressed),
      ),
    );
  }
}