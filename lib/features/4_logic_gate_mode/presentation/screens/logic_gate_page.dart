import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:timetocode/features/4_logic_gate_mode/data/controllers/logic_gate_gameplay_controller.dart';
import 'package:timetocode/features/4_logic_gate_mode/presentation/widgets/cardboard.dart';
import 'package:timetocode/features/4_logic_gate_mode/presentation/widgets/game_board.dart';

class LogicGatePage extends ConsumerStatefulWidget {
  const LogicGatePage({super.key});

  @override
  ConsumerState<LogicGatePage> createState() => _LogicGatePageState();
}

class _LogicGatePageState extends ConsumerState<LogicGatePage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(logicGateControllerProvider.notifier).initializeLogicGateGame();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0A0F2C),
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
