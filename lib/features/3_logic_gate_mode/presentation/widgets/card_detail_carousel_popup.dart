import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timetocode/app/config/theme/colors.dart';
import 'package:timetocode/app/config/theme/typography.dart';
import 'package:timetocode/app/utils/overlay_utils.dart';
import 'package:timetocode/app/widgets/buttons/custom_button.dart';
import 'package:timetocode/features/3_logic_gate_mode/data/models/logic_gate_type.dart';
import 'package:timetocode/features/3_logic_gate_mode/presentation/widgets/detail_card_popup.dart';

class CardDetailCarouselPopup extends ConsumerStatefulWidget {
  final List<LogicGateType> types;
  final int initialIndex;

  const CardDetailCarouselPopup({
    super.key,
    required this.types,
    this.initialIndex = 0,
  });

  @override
  ConsumerState<CardDetailCarouselPopup> createState() =>
      _CardDetailCarouselPopupState();
}

class _CardDetailCarouselPopupState
    extends ConsumerState<CardDetailCarouselPopup> {
  late final PageController _pageController;
  late int _currentIndex;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialIndex;
    _pageController = PageController(initialPage: _currentIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(32.w),
      height: 625.h,
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
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
              itemCount: widget.types.length,
              itemBuilder: (context, index) {
                return DetailCardPopup(
                  type: widget.types[index],
                  closePopup: () => closePopupOverlay(ref),
                  isCarouselView: true,
                );
              },
            ),
          ),
          _buildPageIndicator(),
          SizedBox(height: 24.h),
          _buildCarouselControls(),
        ],
      ),
    );
  }

  Widget _buildPageIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(widget.types.length, (index) {
        bool isActive = _currentIndex == index;
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
          onPressed: _currentIndex > 0
              ? () => _pageController.previousPage(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                )
              : null,
          type: ButtonType.icon,
          isDisabled: _currentIndex == 0,
          color: ButtonColor.purple,
        ),
        CustomButton(
          label: "Tutup",
          onPressed: () => closePopupOverlay(ref),
          width: 120.w,
          widthMode: ButtonWidthMode.fixed,
        ),
        CustomButton(
          label: null,
          icon: Icon(Icons.arrow_forward, size: 24.w),
          onPressed: _currentIndex < widget.types.length - 1
              ? () => _pageController.nextPage(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                )
              : null,
          type: ButtonType.icon,
          isDisabled: _currentIndex == widget.types.length - 1,
          color: ButtonColor.purple,
        ),
      ],
    );
  }
}
