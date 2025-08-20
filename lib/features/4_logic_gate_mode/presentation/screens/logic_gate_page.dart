import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:timetocode/app/config/theme/colors.dart';
import 'package:timetocode/app/config/theme/typography.dart';
import 'package:timetocode/app/utils/overlay_utils.dart';
import 'package:timetocode/app/widgets/buttons/bordered_button.dart';
import 'package:timetocode/app/widgets/buttons/custom_button.dart';
import 'package:timetocode/features/4_logic_gate_mode/data/controllers/logic_gate_gameplay_controller.dart';
import 'package:timetocode/features/4_logic_gate_mode/data/models/logic_gate_type.dart';
import 'package:timetocode/features/4_logic_gate_mode/presentation/widgets/ai_difficulty_popup.dart';
import 'package:timetocode/features/4_logic_gate_mode/presentation/widgets/card_detail_carousel_popup.dart';
import 'package:timetocode/features/4_logic_gate_mode/presentation/widgets/how_to_play_popup.dart';

class LogicGatePage extends ConsumerWidget {
  const LogicGatePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: AppColors.darkBackground,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          'Gerbang Logika',
          style: AppTypography.heading6(color: AppColors.white),
        ),
      ),
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: SvgPicture.asset(
              'assets/images/logic_gate/screen/upper_background.svg',
              fit: BoxFit.cover,
              height: 240.h,
              alignment: Alignment.topCenter,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(24.w),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(18.w),
                  decoration: BoxDecoration(
                    color: AppColors.surfaceDark,
                    borderRadius: BorderRadius.circular(16.r),
                    border: Border.all(color: AppColors.white, width: 2.w),
                  ),
                  height: 250.h,
                  width: 264.w,
                  child: Text(
                    'Ini adalah permainan strategi di mana kamu dan lawan bergantian memasang kartu gerbang logika (AND, OR, NAND, NOR, XOR) untuk mengubah-ubah deretan angka 0 dan 1. Setiap pemain punya target angka akhir yang berbeda, yang akan ditentukan di awal permainan. Raih targetmu dan kalahkan lawan!',
                    style: AppTypography.mediumBold(color: AppColors.white),
                  ),
                ),
                SizedBox(height: 64.h),
                CustomButton(
                  icon: SvgPicture.asset(
                    'assets/images/logic_gate/icons/ai.svg',
                    width: 26.w,
                    height: 26.h,
                  ),
                  type: ButtonType.iconLabel,
                  label: "Mainkan Lawan AI",
                  onPressed: () =>
                      showPopupOverlay(context, const DifficultyPopup(), ref),
                  widthMode: ButtonWidthMode.fill,
                  color: ButtonColor.blue,
                ),
                SizedBox(height: 16.h),
                CustomButton(
                  icon: SvgPicture.asset(
                    'assets/images/logic_gate/icons/peoples.svg',
                    width: 26.w,
                    height: 26.h,
                  ),
                  type: ButtonType.iconLabel,
                  label: "Mainkan Berdua",
                  onPressed: () {
                    ref
                        .read(logicGateControllerProvider.notifier)
                        .initializeLogicGateGame();
                    context.go('/logic-gate/gameplay');
                  },
                  widthMode: ButtonWidthMode.fill,
                  color: ButtonColor.purple,
                ),
                SizedBox(height: 16.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    BorderedButton(
                      icon: SvgPicture.asset(
                        'assets/images/logic_gate/icons/question.svg',
                        width: 24.w,
                        height: 24.h,
                      ),
                      type: BorderedButtonType.iconLabel,
                      label: "Cara Bermain",
                      onPressed: () {
                        showPopupOverlay(context, const HowToPlayPopup(), ref);
                      },
                      color: BorderedButtonColor.transparent,
                    ),
                    SizedBox(width: 8.w),
                    BorderedButton(
                      icon: SvgPicture.asset(
                        'assets/images/logic_gate/icons/cards.svg',
                        width: 24.w,
                        height: 24.h,
                      ),
                      type: BorderedButtonType.iconLabel,
                      label: "Detail Kartu",
                      onPressed: () {
                        showPopupOverlay(
                          context,
                          const CardDetailCarouselPopup(
                            types: LogicGateType.values,
                          ),
                          ref,
                        );
                      },
                      color: BorderedButtonColor.transparent,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
