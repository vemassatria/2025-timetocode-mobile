import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:timetocode/app/config/theme/colors.dart';
import 'package:timetocode/app/config/theme/typography.dart';
import 'package:timetocode/app/widgets/buttons/custom_button.dart';
import 'package:timetocode/features/4_logic_gate_mode/data/models/logic_gate_type.dart';

class DetailCardPopup extends StatelessWidget {
  final LogicGateType type;
  final VoidCallback closePopup;

  final PageController? pageController;
  final int? currentIndex;
  final int? totalCards;

  const DetailCardPopup({
    super.key,
    required this.type,
    required this.closePopup,
    this.pageController,
    this.currentIndex,
    this.totalCards,
  });

  bool get _isCarouselView =>
      pageController != null && currentIndex != null && totalCards != null;

  @override
  Widget build(BuildContext context) {
    final name = type.name.toUpperCase();
    return Container(
      padding: EdgeInsets.all(32.w),
      height: 600.h,
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
          if (_isCarouselView) ...[
            _buildPageIndicator(),
            SizedBox(height: 24.h),
            _buildCarouselControls(),
          ] else
            CustomButton(
              label: "Tutup",
              onPressed: closePopup,
              widthMode: ButtonWidthMode.fill,
            ),
        ],
      ),
    );
  }

  Widget _buildPageIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(totalCards!, (index) {
        bool isActive = currentIndex == index;
        return AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          margin: EdgeInsets.symmetric(horizontal: 4.w),
          height: 8.h,
          width: isActive ? 24.w : 8.w,
          decoration: BoxDecoration(
            color: isActive ? AppColors.skyByte : AppColors.secondaryText,
            borderRadius: BorderRadius.circular(8.r),
          ),
        );
      }),
    );
  }

  Widget _buildCarouselControls() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomButton(
          label: null,
          icon: Icon(Icons.arrow_back, size: 24.w),
          onPressed: currentIndex! > 0
              ? () => pageController!.previousPage(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                )
              : null,
          type: ButtonType.icon,
          isDisabled: currentIndex! == 0,
          color: ButtonColor.purple,
        ),
        CustomButton(
          label: "Tutup",
          onPressed: closePopup,
          width: 120.w,
          widthMode: ButtonWidthMode.fixed,
        ),
        CustomButton(
          label: null,
          icon: Icon(Icons.arrow_forward, size: 24.w),
          onPressed: currentIndex! < totalCards! - 1
              ? () => pageController!.nextPage(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                )
              : null,
          type: ButtonType.icon,
          isDisabled: currentIndex! == totalCards! - 1,
          color: ButtonColor.purple,
        ),
      ],
    );
  }
}
