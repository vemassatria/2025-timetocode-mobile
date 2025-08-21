import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:timetocode/app/config/theme/colors.dart';
import 'package:timetocode/app/data/providers/popup_visibility_provider.dart';
import 'package:timetocode/app/utils/overlay_utils.dart';
import 'package:timetocode/app/widgets/popups/menu_popup.dart';
import 'package:timetocode/features/4_logic_gate_mode/data/controllers/logic_gate_gameplay_controller.dart';
import 'package:timetocode/features/4_logic_gate_mode/presentation/widgets/cardboard.dart';
import 'package:timetocode/features/4_logic_gate_mode/presentation/widgets/game_board.dart';

class LogicGateGameplay extends ConsumerWidget {
  const LogicGateGameplay({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLoading = ref.watch(
      logicGateControllerProvider.select((state) => state.isLoading),
    );
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) return;
        final isPopupVisible = ref.read(popupVisibilityProvider);
        final logicGateNotifier = ref.read(
          logicGateControllerProvider.notifier,
        );
        if (isPopupVisible) {
          closePopupOverlay(ref);
        } else {
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
        }
      },
      child: isLoading == true
          ? const Center(child: CircularProgressIndicator())
          : const Scaffold(
              backgroundColor: AppColors.surfaceDark,
              body: SafeArea(
                child: Stack(
                  children: [
                    Center(child: GameBoard()),

                    Align(
                      alignment: Alignment.bottomCenter,
                      child: CardBoard(playerID: 1),
                    ),

                    Align(
                      alignment: Alignment.topCenter,
                      child: CardBoard(playerID: 0),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
