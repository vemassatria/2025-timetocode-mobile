import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:timetocode/app/config/theme/colors.dart';
import 'package:timetocode/app/config/theme/typography.dart';
import 'package:timetocode/app/widgets/buttons/custom_button.dart';
import 'package:timetocode/features/2_minigames_selection/games/logic_gate/data/models/logic_gate_type.dart';

class DetailCardPopup extends StatelessWidget {
  final LogicGateType type;
  final VoidCallback closePopup;
  final bool isCarouselView;

  const DetailCardPopup({
    super.key,
    required this.type,
    required this.closePopup,
    this.isCarouselView = false,
  });

  @override
  Widget build(BuildContext context) {
    final name = type.name.toUpperCase();
    return isCarouselView
        ? _buildDetailCard(name)
        : Container(
            padding: EdgeInsets.all(32.w),
            height: 615.h,
            width: 300.w,
            decoration: BoxDecoration(
              color: AppColors.surfaceDark,
              borderRadius: BorderRadius.circular(12.r),
              border: Border.all(color: AppColors.white, width: 1.w),
            ),
            child: Column(
              children: [
                Text(
                  'Detail Kartu',
                  style: AppTypography.heading4(color: AppColors.white),
                ),
                Divider(color: AppColors.white, thickness: 3.w),
                SizedBox(height: 32.h),
                _buildDetailCard(name),
                CustomButton(
                  label: "Tutup",
                  onPressed: closePopup,
                  widthMode: ButtonWidthMode.fill,
                ),
              ],
            ),
          );
  }

  Widget _buildDetailCard(String name) {
    return Column(
      children: [
        SvgPicture.asset(type.assetPath, width: 70.w, height: 100.h),
        SizedBox(height: 24.h),
        Text(name, style: AppTypography.heading5(color: AppColors.white)),
        SizedBox(height: 24.h),
        SvgPicture.asset(
          'assets/images/logic_gate/tables/$name.svg',
          width: 290.w,
          height: 180.h,
        ),
        SizedBox(height: 24.h),
      ],
    );
  }
}
