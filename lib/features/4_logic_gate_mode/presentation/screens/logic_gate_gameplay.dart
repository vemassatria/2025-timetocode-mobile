import 'package:flutter/material.dart';
import 'package:timetocode/app/config/theme/colors.dart';
import 'package:timetocode/features/4_logic_gate_mode/presentation/widgets/cardboard.dart';
import 'package:timetocode/features/4_logic_gate_mode/presentation/widgets/game_board.dart';

class LogicGateGameplay extends StatelessWidget {
  const LogicGateGameplay({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surfaceDark,
      body: SafeArea(
        child: Stack(
          children: [
            const Center(child: GameBoard()),

            const Align(
              alignment: Alignment.bottomCenter,
              child: CardBoard(playerID: 1),
            ),

            const Align(
              alignment: Alignment.topCenter,
              child: CardBoard(playerID: 0),
            ),
          ],
        ),
      ),
    );
  }
}
