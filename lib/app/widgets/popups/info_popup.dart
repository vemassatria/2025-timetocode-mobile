import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timetocode/app/data/services/sound_effect_service.dart';
import 'package:timetocode/app/widgets/buttons/custom_button.dart';
import 'package:timetocode/app/widgets/popups/base_popup.dart';
import 'package:timetocode/app/config/theme/typography.dart';

enum InfoPopupVariant { defaultVariant, summary }

class InfoPopup extends ConsumerWidget {
  final String title;
  final String description;
  final List<String>? summaryList;
  final InfoPopupVariant variant;
  final VoidCallback onClose;

  const InfoPopup({
    super.key,
    required this.title,
    required this.onClose,
    this.description = "",
    this.summaryList,
    this.variant = InfoPopupVariant.defaultVariant,
  });

  Widget _buildTitle() {
    return Text(
      title,
      style: AppTypography.heading4(),
      textAlign: TextAlign.center,
    );
  }

  Widget _buildDescription() {
    if (variant == InfoPopupVariant.summary && summaryList != null) {
      return SizedBox(
        height: 350.h,
        child: Scrollbar(
          child: ListView.separated(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            itemCount: summaryList!.length,
            separatorBuilder: (_, __) => SizedBox(height: 16.h),
            itemBuilder: (context, index) {
              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("• ", style: AppTypography.small()),
                  Expanded(
                    child: Text(
                      summaryList![index],
                      style: AppTypography.small(),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      );
    } else {
      return Text(
        description,
        textAlign: TextAlign.justify,
        style: AppTypography.small(),
      );
    }
  }

  Widget _buildCloseButton(WidgetRef ref) {
    return CustomButton(
      label: "Tutup",
      onPressed: () {
        ref.read(soundEffectServiceProvider.notifier).playNegativeClick();
        onClose();
      },
      widthMode: ButtonWidthMode.fill,
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return BasePopup(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _buildTitle(),
          SizedBox(height: 8.h),
          Divider(thickness: 3.w),
          SizedBox(height: 32.h),
          _buildDescription(),
          SizedBox(height: 32.h),
          _buildCloseButton(ref),
        ],
      ),
    );
  }
}
