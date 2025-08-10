import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timetocode/app/config/theme/colors.dart';
import 'package:timetocode/features/4_logic_gate_mode/data/controllers/logic_gate_gameplay_controller.dart';
import 'package:timetocode/features/4_logic_gate_mode/data/models/logic_gate_card_model.dart';
import 'package:timetocode/features/4_logic_gate_mode/data/models/player_model.dart';
import 'package:timetocode/features/4_logic_gate_mode/presentation/widgets/draggable_card.dart';
import 'package:timetocode/features/4_logic_gate_mode/presentation/widgets/target_binary.dart';

class CardBoard extends ConsumerWidget {
  final int playerID;

  const CardBoard({super.key, required this.playerID});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final PlayerModel? targetPlayer = ref.watch(
      logicGateControllerProvider.select((state) {
        return playerID == 1 ? state.player : state.opponent;
      }),
    );

    final bool isMyTurn = ref.watch(
      logicGateControllerProvider.select(
        (state) => state.currentPlayerId == playerID,
      ),
    );

    final hand = targetPlayer!.hand;
    final targetValue = targetPlayer.targetValue;

    final borderRadius = (playerID == 1)
        ? BorderRadius.only(
            topLeft: Radius.circular(8.r),
            topRight: Radius.circular(8.r),
          )
        : BorderRadius.only(
            bottomLeft: Radius.circular(8.r),
            bottomRight: Radius.circular(8.r),
          );

    return Column(
      mainAxisSize: MainAxisSize.min,
      spacing: 6.h,
      children: playerID == 1
          ? [
              TargetBinary(id: targetValue),
              _buildHandContainer(isMyTurn, borderRadius, hand, targetValue),
            ]
          : [
              _buildHandContainer(isMyTurn, borderRadius, hand, targetValue),
              TargetBinary(id: targetValue),
            ],
    );
  }

  Widget _buildHandContainer(
    bool isMyTurn,
    BorderRadius borderRadius,
    List<LogicGateCardModel> hand,
    int id,
  ) {
    return AnimatedOpacity(
      opacity: isMyTurn ? 1.0 : 0.4,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      child: IgnorePointer(
        ignoring: !isMyTurn,
        child: Container(
          width: 293.w,
          height: 86.h,
          decoration: BoxDecoration(
            color: id == 0 ? AppColors.softViolet : AppColors.skyByte,
            borderRadius: borderRadius,
            border: Border.all(
              color: id == 0 ? AppColors.royalIndigo : AppColors.deepAzure,
              width: 2.w,
            ),
          ),
          child: Wrap(
            spacing: 8.w,
            runAlignment: WrapAlignment.center,
            alignment: WrapAlignment.center,
            children: hand.map((card) => DraggableCard(card: card)).toList(),
          ),
        ),
      ),
    );
  }
}
