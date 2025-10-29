import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:timetocode/app/config/theme/colors.dart';
import 'package:timetocode/app/data/providers/popup_visibility_provider.dart';
import 'package:timetocode/app/data/services/sound_effect_service.dart';
import 'package:timetocode/app/utils/overlay_utils.dart';
import 'package:timetocode/app/widgets/popups/information_popup.dart';
import 'package:timetocode/app/widgets/popups/menu_popup.dart';
import 'package:timetocode/features/2_minigames_selection/games/logic_gate/data/controllers/logic_gate_gameplay_controller.dart';
import 'package:timetocode/features/2_minigames_selection/games/logic_gate/data/controllers/logic_gate_websocket_controller.dart';
import 'package:timetocode/features/2_minigames_selection/games/logic_gate/data/states/logic_gate_websocket_state.dart';
import 'package:timetocode/features/2_minigames_selection/games/logic_gate/presentation/widgets/cardboard.dart';
import 'package:timetocode/features/2_minigames_selection/games/logic_gate/presentation/widgets/game_board.dart';
import 'package:timetocode/features/2_minigames_selection/games/logic_gate/presentation/widgets/logic_gate_ending_popup.dart';

class LogicGateGameplay extends ConsumerWidget {
  const LogicGateGameplay({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLoading = ref.watch(
      logicGateControllerProvider.select((state) => state.isLoading),
    );

    ref.listen(
      logicGateControllerProvider.select((state) => state.winnerPlayerId),
      (previous, next) {
        if (next != null) {
          if (ref.read(logicGateControllerProvider).isOnline) {
            final isWinner =
                next == ref.read(logicGateWebsocketControllerProvider).playerId;
            if (isWinner) {
              ref.read(soundEffectServiceProvider.notifier).playVictory();
            } else {
              ref.read(soundEffectServiceProvider.notifier).playDefeat();
            }

            final targetWinnerBinary = ref
                .read(logicGateWebsocketControllerProvider.notifier)
                .getWinner(next)
                .targetValue;

            showPopupOverlay(
              context,
              LogicGateEndGamePopup(
                endGameType: isWinner
                    ? EndGameType.victory
                    : EndGameType.defeat,
                winnerBinary: targetWinnerBinary,
                isOnline: true,
              ),
              ref,
            );
          } else {
            final isWinner = next == 1;
            if (isWinner) {
              ref.read(soundEffectServiceProvider.notifier).playVictory();
            } else {
              ref.read(soundEffectServiceProvider.notifier).playDefeat();
            }

            final targetWinnerBinary = isWinner
                ? ref.read(logicGateControllerProvider).player!.targetValue
                : ref.read(logicGateControllerProvider).opponent!.targetValue;

            showPopupOverlay(
              context,
              LogicGateEndGamePopup(
                endGameType: isWinner
                    ? EndGameType.victory
                    : EndGameType.defeat,
                winnerBinary: targetWinnerBinary,
              ),
              ref,
            );
          }
        }
      },
    );

    if (ref.read(logicGateControllerProvider).isOnline) {
      ref.listen<LogicGateWebsocketState>(
        logicGateWebsocketControllerProvider,
        (previous, next) {
          final prevStatus = previous?.status;
          final nextStatus = next.status;

          if (prevStatus != nextStatus) {
            if (nextStatus != LogicGateWebsocketStatus.opponentReconnecting &&
                nextStatus != LogicGateWebsocketStatus.error &&
                nextStatus != LogicGateWebsocketStatus.opponentDisconnected &&
                nextStatus != LogicGateWebsocketStatus.waitingForOpponent &&
                ref.read(popupVisibilityProvider)) {
              closePopupOverlay(ref);
            }

            switch (nextStatus) {
              case LogicGateWebsocketStatus.opponentDisconnected:
                showPopupOverlay(
                  context,
                  InformationPopup(
                    title: "Lawan Terputus",
                    message:
                        next.errorMessage ?? "Lawan meninggalkan permainan.",
                    showCloseButton: true,
                  ),
                  ref,
                );
                break;
              case LogicGateWebsocketStatus.opponentReconnecting:
                showPopupOverlay(
                  context,
                  InformationPopup(
                    title: "Menunggu Lawan",
                    message:
                        next.errorMessage ??
                        "Lawan sedang mencoba menyambung kembali...",
                  ),
                  ref,
                );
                break;
              case LogicGateWebsocketStatus.error:
                if (!ref.read(popupVisibilityProvider)) {
                  showPopupOverlay(
                    context,
                    InformationPopup(
                      title: "Koneksi Bermasalah",
                      message: next.errorMessage ?? "Terjadi masalah koneksi.",
                      showCloseButton: true,
                    ),
                    ref,
                  );
                }
                break;
              case LogicGateWebsocketStatus.waitingForOpponent:
                showPopupOverlay(
                  context,
                  InformationPopup(
                    title: "Menunggu Lawan bergabung",
                    message: "Room ID: ${next.roomId!}",
                  ),
                  ref,
                );
                break;
              case LogicGateWebsocketStatus.disconnected:
                showPopupOverlay(
                  context,
                  const InformationPopup(
                    title: "Koneksi Terputus",
                    message: "Mencoba menyambung kembali...",
                  ),
                  ref,
                );
                break;
              default:
                if (ref.read(popupVisibilityProvider)) {
                  closePopupOverlay(ref);
                }
                break;
            }
          }
        },
      );
    }

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
              onRestart: ref.read(logicGateControllerProvider).isOnline
                  ? null
                  : () {
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
          : Scaffold(
              backgroundColor: AppColors.surfaceDark,
              body: SafeArea(
                child: Stack(
                  children: [
                    const Center(child: GameBoard()),

                    if (ref.read(logicGateControllerProvider).isOnline &&
                        ref
                                .read(logicGateWebsocketControllerProvider)
                                .playerId ==
                            2) ...[
                      const Align(
                        alignment: Alignment.topCenter,
                        child: CardBoard(playerID: 1),
                      ),

                      const Align(
                        alignment: Alignment.bottomCenter,
                        child: CardBoard(playerID: 0),
                      ),
                    ] else ...[
                      const Align(
                        alignment: Alignment.bottomCenter,
                        child: CardBoard(playerID: 1),
                      ),

                      const Align(
                        alignment: Alignment.topCenter,
                        child: CardBoard(playerID: 0),
                      ),
                    ],
                  ],
                ),
              ),
            ),
    );
  }
}
