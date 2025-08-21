// lib/app/widgets/popups/error_popup.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:timetocode/app/widgets/buttons/custom_button.dart';
import 'package:timetocode/app/widgets/popups/base_popup.dart';
import 'package:timetocode/app/config/theme/typography.dart';
import 'package:timetocode/app/utils/overlay_utils.dart';

class ErrorPopup extends ConsumerWidget {
  final String title;
  final String description;

  const ErrorPopup({super.key, required this.title, required this.description});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return BasePopup(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(title, style: AppTypography.heading4()),
          const Divider(thickness: 3),
          const SizedBox(height: 16),
          Text(description, textAlign: TextAlign.center),
          const SizedBox(height: 24),
          CustomButton(
            label: "Tutup",
            onPressed: () => closePopupOverlay(ref),
            widthMode: ButtonWidthMode.fill,
          ),
        ],
      ),
    );
  }
}
