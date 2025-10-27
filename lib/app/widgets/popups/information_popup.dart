import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timetocode/app/config/theme/typography.dart';
import 'package:timetocode/app/utils/overlay_utils.dart';
import 'package:timetocode/app/widgets/buttons/custom_button.dart';
import 'package:timetocode/app/widgets/popups/base_popup.dart';

class InformationPopup extends ConsumerWidget {
  final String title;
  final String message;
  final bool showCloseButton;

  const InformationPopup({
    super.key,
    required this.title,
    required this.message,
    this.showCloseButton = true,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return BasePopup(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            title,
            style: AppTypography.heading4(),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 8.h),
          Divider(thickness: 2.w),
          Text(
            message,
            style: AppTypography.normal(),
            textAlign: TextAlign.center,
          ),
          if (showCloseButton) ...[
            SizedBox(height: 32.h),
            CustomButton(
              onPressed: () => closePopupOverlay(ref),
              label: 'Tutup',
              widthMode: ButtonWidthMode.fill,
            ),
          ],
        ],
      ),
    );
  }
}
