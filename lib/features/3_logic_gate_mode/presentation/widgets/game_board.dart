import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timetocode/app/config/theme/colors.dart';
import 'package:timetocode/app/data/services/sound_effect_service.dart';
import 'package:timetocode/app/utils/overlay_utils.dart';
import 'package:timetocode/features/3_logic_gate_mode/data/controllers/logic_gate_gameplay_controller.dart';
import 'package:timetocode/features/3_logic_gate_mode/data/models/line_connection.dart';
import 'package:timetocode/features/3_logic_gate_mode/presentation/widgets/binary_slot_widget.dart';
import 'package:timetocode/features/3_logic_gate_mode/presentation/widgets/drop_zone_card.dart';
import 'package:timetocode/features/3_logic_gate_mode/presentation/widgets/line_painter.dart';
import 'package:timetocode/features/3_logic_gate_mode/presentation/widgets/logic_gate_ending_popup.dart';
import 'package:timetocode/features/3_logic_gate_mode/presentation/widgets/logic_gate_how_to_play.dart';
import 'package:timetocode/features/3_logic_gate_mode/presentation/widgets/logic_gate_menu.dart';

class GameBoard extends ConsumerStatefulWidget {
  const GameBoard({super.key});

  @override
  ConsumerState<GameBoard> createState() => _GameBoardState();
}

class _GameBoardState extends ConsumerState<GameBoard> {
  final Map<String, GlobalKey> _keys = {
    for (int i = 1; i <= 15; i++) 'binary-$i': GlobalKey(),
    for (int i = 1; i <= 10; i++) 'card-$i': GlobalKey(),
  };
  final GlobalKey _stackKey = GlobalKey();
  final List<LineConnection> connections = [];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref
          .read(logicGateControllerProvider.notifier)
          .updateLineConnection(
            () => setState(() {
              connections.clear();
            }),
          );
    });
  }

  Rect _findRect(String key) {
    final stackRenderBox = _stackKey.currentContext?.findRenderObject();
    final renderBox =
        _keys[key]!.currentContext!.findRenderObject() as RenderBox;
    final position = renderBox.localToGlobal(
      Offset.zero,
      ancestor: stackRenderBox,
    );

    return position & renderBox.size;
  }

  void _updateConnection(int lastUpdatedCardSlotId) {
    final logicGateController = ref.read(logicGateControllerProvider.notifier);
    final binarySlot = ref.read(logicGateControllerProvider).binarySlots!;
    final inputSlotId1 = logicGateController.calculateTopBinarySlotIndex(
      lastUpdatedCardSlotId,
    );
    final inputSlotId2 = inputSlotId1 + 1;
    final outputSlotId = logicGateController.calculateNextBinarySlotIndex(
      inputSlotId1,
      inputSlotId2,
    );

    /*
      Find the rectangles for the card and binary slots
    */

    final Rect cardRect = _findRect('card-$lastUpdatedCardSlotId');
    final Rect inputRect1 = _findRect('binary-$inputSlotId1');
    final Rect inputRect2 = _findRect('binary-$inputSlotId2');
    final Rect outputRect = _findRect('binary-$outputSlotId');

    /*
      make the connections between card and its top binary slot
    */

    final binarySlot1 = binarySlot.firstWhere(
      (slot) => slot.id == inputSlotId1,
    );
    final color1 = binarySlot1.value == 1
        ? AppColors.skyByte
        : AppColors.softViolet;

    final startPoint1 = inputRect1.bottomCenter;
    final endPoint1 = cardRect.topCenter;

    connections.add(
      LineConnection(start: startPoint1, end: endPoint1, color: color1),
    );

    /*
      make the connections between card and its right(result) binary slot
    */

    final startPoint2 = outputRect.centerLeft;
    final endPoint2 = cardRect.centerRight;

    final outputBinary = binarySlot.firstWhere(
      (slot) => slot.id == outputSlotId,
    );
    final color2 = outputBinary.value == 1
        ? AppColors.skyByte
        : AppColors.softViolet;

    connections.add(
      LineConnection(start: startPoint2, end: endPoint2, color: color2),
    );

    /*
      make the connections between card and its bottom binary slot
    */

    final startPoint3 = inputRect2.topCenter;
    final endPoint3 = cardRect.bottomCenter;

    final secondBinary = binarySlot.firstWhere(
      (slot) => slot.id == inputSlotId2,
    );
    final color3 = secondBinary.value == 1
        ? AppColors.skyByte
        : AppColors.softViolet;

    connections.add(
      LineConnection(start: startPoint3, end: endPoint3, color: color3),
    );
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(
      logicGateControllerProvider.select(
        (state) => state.lastUpdatedCardSlotId,
      ),
      (previous, next) {
        _updateConnection(next!);
      },
    );

    ref.listen(
      logicGateControllerProvider.select((state) => state.outputBinary),
      (previous, next) {
        if (next != null) {
          next == 1
              ? ref.read(soundEffectServiceProvider.notifier).playVictory()
              : ref.read(soundEffectServiceProvider.notifier).playDefeat();
          showPopupOverlay(
            context,
            LogicGateEndGamePopup(winnerBinary: next),
            ref,
          );
        }
      },
    );

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
      padding: EdgeInsets.all(8.w),
      decoration: BoxDecoration(
        color: AppColors.surfaceDark.withValues(alpha: 0.8),
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: AppColors.white, width: 2.w),
      ),
      height: 497.h,
      width: 328.w,
      child: Stack(
        key: _stackKey,
        children: [
          CustomPaint(
            size: Size.infinite,
            painter: LinePainter(connections: connections),
          ),
          _buildGameRow(),
          const LogicGateMenu(),
          const LogicGateHowToPlay(),
        ],
      ),
    );
  }

  Widget _buildGameRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildGameColumn(1),
        _buildGameColumn(2),
        _buildGameColumn(3),
        _buildGameColumn(4),
        _buildGameColumn(5),
      ],
    );
  }

  Widget _buildGameColumn(int column) {
    final int iteration;
    int cardId;
    int binaryId;
    if (column == 1) {
      iteration = 9;
      cardId = 1;
      binaryId = 1;
    } else if (column == 2) {
      iteration = 7;
      cardId = 5;
      binaryId = 6;
    } else if (column == 3) {
      iteration = 5;
      cardId = 8;
      binaryId = 10;
    } else if (column == 4) {
      iteration = 3;
      cardId = 10;
      binaryId = 13;
    } else {
      iteration = 1;
      binaryId = 15;
      cardId = 0;
    }
    final List<Widget> slots = List.generate(iteration, (index) {
      final ConsumerWidget widget;
      if ((index + 1) % 2 != 0) {
        widget = BinarySlotWidget(
          key: _keys['binary-$binaryId'],
          slotId: binaryId,
        );
        binaryId++;
      } else {
        widget = DropZoneCard(key: _keys['card-$cardId'], id: cardId);
        cardId++;
      }
      return widget;
    });

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      spacing: 12.h,
      children: [...slots],
    );
  }
}
