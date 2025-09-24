import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timetocode/app/config/theme/colors.dart';
import 'package:timetocode/app/utils/overlay_utils.dart';
import 'package:timetocode/app/widgets/popups/menu_popup.dart';
import 'package:timetocode/features/3_logic_gate_mode/data/controllers/logic_gate_gameplay_controller.dart';

class LogicGateMenu extends ConsumerWidget {
  const LogicGateMenu({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final logicGateNotifier = ref.read(logicGateControllerProvider.notifier);
    final isEndGame = ref.watch(
      logicGateControllerProvider.select((state) => state.outputBinary != null),
    );
    return Align(
      alignment: Alignment.bottomRight,
      child: GestureDetector(
        onTap: isEndGame
            ? logicGateNotifier.exit
            : () {
                showPopupOverlay(
                  context,
                  MenuPopup(
                    onRestart: () {
                      logicGateNotifier.restart();
                      closePopupOverlay(ref);
                    },
                    onExit: () {
                      logicGateNotifier.exit();
                      closePopupOverlay(ref);
                    },
                    onClose: () => closePopupOverlay(ref),
                    onGoBack: () => goBackToPreviousOverlay(context, ref),
                  ),
                  ref,
                );
              },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.0),
            border: Border.all(color: AppColors.white, width: 1.0),
          ),
          child: Icon(
            isEndGame ? Icons.close : Icons.menu,
            color: AppColors.primaryText,
            size: 32.sp,
          ),
        ),
      ),
    );
  }
}
