import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:timetocode/app/config/theme/colors.dart';
import 'package:timetocode/app/config/theme/typography.dart';
import 'package:timetocode/app/utils/overlay_utils.dart';
import 'package:timetocode/app/widgets/buttons/custom_button.dart';

class HowToPlayPopup extends ConsumerStatefulWidget {
  const HowToPlayPopup({super.key});

  @override
  ConsumerState<HowToPlayPopup> createState() => _HowToPlayPopupState();
}

class _HowToPlayPopupState extends ConsumerState<HowToPlayPopup> {
  late final PageController _pageController;
  late int _currentIndex;
  final List<String> descriptions = [
    'Gerbang Logika. Game strategi seru ini mengubah angka 0 dan 1. Setiap pemain punya target angka akhir berbeda. Raih tujuanmu untuk menang!',
    'Kenali 5 jenis kartu gerbang logika: AND, OR, NAND, NOR, XOR. Tiap kartu punya aturan unik mengubah dua angka input jadi satu output. Pilih strategis!',
    'Game dimulai angka acak biner 0 atau 1. Kamu dan lawan akan bergantian pasang satu kartu gerbang di antara dua angka. Pikirkan langkahmu!',
    'Saat kartu terpasang, angka di depan kartu langsung berubah. Perubahan sesuai aturan gerbang logikamu. Pelajari aturannya di detail kartu!',
    'Permainan akan selesai apabila semua slot terisi. Angka paling akhir di papan tentukan pemenang. Jika cocok dengan targetmu, kamu menang!',
  ];

  @override
  void initState() {
    super.initState();
    _currentIndex = 0;
    _pageController = PageController(initialPage: _currentIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 610.h,
      width: 300.w,
      child: PageView.builder(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        itemCount: descriptions.length,
        itemBuilder: (context, index) {
          return Container(
            padding: EdgeInsets.all(32.w),
            decoration: BoxDecoration(
              color: AppColors.surfaceDark,
              borderRadius: BorderRadius.circular(12.r),
              border: Border.all(color: AppColors.white, width: 1.w),
            ),
            child: Column(
              children: [
                Text(
                  'Cara Bermain',
                  style: AppTypography.heading4(color: AppColors.white),
                ),
                Divider(color: AppColors.white, thickness: 3.w),
                SizedBox(height: 32.h),
                SvgPicture.asset(
                  'assets/images/logic_gate/tutorial/how_to_play$index.svg',
                  width: 265.w,
                  height: 185.h,
                  fit: BoxFit.cover,
                ),
                SizedBox(height: 24.h),
                Text(
                  descriptions[index],
                  style: AppTypography.mediumBold(color: AppColors.white),
                ),
                SizedBox(height: 32.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(descriptions.length, (index) {
                    bool isActive = _currentIndex == index;
                    return AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                      margin: EdgeInsets.symmetric(horizontal: 4.w),
                      height: 8.h,
                      width: isActive ? 24.w : 8.w,
                      decoration: BoxDecoration(
                        color: isActive
                            ? AppColors.skyByte
                            : AppColors.secondaryText,
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                    );
                  }),
                ),
                SizedBox(height: 32.h),
                Row(
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
                      onPressed: _currentIndex < descriptions.length - 1
                          ? () => _pageController.nextPage(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeInOut,
                            )
                          : null,
                      type: ButtonType.icon,
                      isDisabled: _currentIndex == descriptions.length - 1,
                      color: ButtonColor.purple,
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
