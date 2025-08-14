import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timetocode/app/config/theme/colors.dart';
import 'package:timetocode/app/config/theme/typography.dart';
import 'package:timetocode/app/utils/overlay_utils.dart';
import 'package:timetocode/app/widgets/buttons/custom_button.dart';
import 'package:timetocode/app/widgets/popups/base_popup.dart';
import 'package:timetocode/features/4_logic_gate_mode/data/controllers/logic_gate_gameplay_controller.dart';

class LogicGateEndGamePopup extends ConsumerWidget {
  final int? winnerBinary;

  const LogicGateEndGamePopup({super.key, required this.winnerBinary});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final logicGateController = ref.read(logicGateControllerProvider.notifier);
    String title;
    String description;

    if (winnerBinary == 1) {
      title = "Kamu Menang!";
      description = "Selamat! Kamu berhasil mencapai target nilai: ";
    } else {
      title = "Kamu Kalah!";
      description = "Yahh.. Lawan berhasil mencapai target nilai: ";
    }

    return BasePopup(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            title,
            style: AppTypography.heading4(),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 8.h),
          Divider(thickness: 3.w),
          Text(
            description,
            textAlign: TextAlign.center,
            style: AppTypography.small(),
          ),
          SizedBox(height: 16.h),
          Container(
            width: 45.w,
            height: 45.h,
            decoration: BoxDecoration(
              color: winnerBinary == 0
                  ? AppColors.softViolet
                  : AppColors.skyByte,
              borderRadius: BorderRadius.circular(8.r),
              border: Border.all(
                color: winnerBinary == 0
                    ? AppColors.royalIndigo
                    : AppColors.deepAzure,
                width: 2.w,
              ),
            ),
            child: Center(
              child: Text(
                winnerBinary.toString(),
                style: AppTypography.heading4().copyWith(
                  color: AppColors.black1,
                ),
              ),
            ),
          ),
          SizedBox(height: 32.h),
          CustomButton(
            label: "Cek Papan",
            onPressed: () {
              closePopupOverlay(ref);
            },
            widthMode: ButtonWidthMode.fill,
            color: ButtonColor.green,
          ),
          SizedBox(height: 12.h),
          Row(
            children: [
              Expanded(
                child: CustomButton(
                  label: "Mulai Ulang",
                  onPressed: () {
                    logicGateController.restart();
                    closePopupOverlay(ref);
                  },
                  widthMode: ButtonWidthMode.fill,
                  color: ButtonColor.blue,
                ),
              ),
              SizedBox(width: 16.w),
              Expanded(
                child: CustomButton(
                  label: "Keluar",
                  onPressed: () {
                    logicGateController.exit();
                    closePopupOverlay(ref);
                  },
                  widthMode: ButtonWidthMode.fill,
                  type: ButtonType.outline,
                  color: ButtonColor.none,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
