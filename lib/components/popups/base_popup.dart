import 'package:flutter/material.dart';
import 'package:timetocode/themes/colors.dart';

class BasePopup extends StatelessWidget {
  final Widget child;
  final Color? borderColor;

  const BasePopup({super.key, required this.child, this.borderColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: AppColors.surfaceDark,
        border: Border.all(color: borderColor ?? AppColors.white, width: 2),
        borderRadius: BorderRadius.circular(8),
      ),
      child: child,
    );
  }
}
