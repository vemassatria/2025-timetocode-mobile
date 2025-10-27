import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:timetocode/app/config/theme/colors.dart';
import 'package:timetocode/app/config/theme/typography.dart';
import 'package:timetocode/app/data/services/sound_effect_service.dart';
import 'package:timetocode/app/utils/overlay_utils.dart';
import 'package:timetocode/app/widgets/buttons/custom_button.dart';
import 'package:timetocode/app/widgets/popups/base_popup.dart';
import 'package:timetocode/features/2_minigames_selection/games/logic_gate/data/controllers/logic_gate_gameplay_controller.dart';
import 'package:timetocode/features/2_minigames_selection/games/logic_gate/data/controllers/logic_gate_websocket_controller.dart';

class JoinOnlineRoomPopup extends ConsumerStatefulWidget {
  const JoinOnlineRoomPopup({super.key});

  @override
  ConsumerState<JoinOnlineRoomPopup> createState() =>
      _JoinOnlineRoomPopupState();
}

class _JoinOnlineRoomPopupState extends ConsumerState<JoinOnlineRoomPopup> {
  late TextEditingController _roomCodeController;

  @override
  void initState() {
    super.initState();
    _roomCodeController = TextEditingController();
  }

  @override
  void dispose() {
    _roomCodeController.dispose();
    super.dispose();
  }

  void _joinRoom() {
    final roomCode = _roomCodeController.text.trim();
    if (roomCode.isEmpty) {
      return;
    }

    ref.read(logicGateWebsocketControllerProvider.notifier).joinRoom(roomCode);
    ref.read(soundEffectServiceProvider.notifier).playButtonClick1();
    ref
        .read(logicGateControllerProvider.notifier)
        .initializeLogicGateGame(isOnline: true);
    context.go('/minigames/logic-gate/gameplay');
    closePopupOverlay(ref);
  }

  @override
  Widget build(BuildContext context) {
    return BasePopup(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Masukkan Kode Room:',
            textAlign: TextAlign.center,
            style: AppTypography.heading4(),
          ),
          SizedBox(width: 12.w),
          SizedBox(
            width: 150.w,
            child: TextField(
              controller: _roomCodeController,
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                labelText: 'Kode Room',
                labelStyle: AppTypography.normal(color: AppColors.gray1),
              ),
              keyboardType: TextInputType.text,
              onSubmitted: (_) => _joinRoom(),
            ),
          ),
          SizedBox(width: 12.w),
          CustomButton(label: 'Masuk', onPressed: _joinRoom),
        ],
      ),
    );
  }
}
