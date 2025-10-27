import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:timetocode/app/data/services/sound_effect_service.dart';
import 'package:timetocode/app/utils/overlay_utils.dart';
import 'package:timetocode/app/widgets/buttons/custom_button.dart';
import 'package:timetocode/app/widgets/popups/base_popup.dart';
import 'package:timetocode/features/2_minigames_selection/games/logic_gate/data/controllers/logic_gate_gameplay_controller.dart';
import 'package:timetocode/features/2_minigames_selection/games/logic_gate/data/controllers/logic_gate_websocket_controller.dart';
import 'package:timetocode/features/2_minigames_selection/games/logic_gate/presentation/widgets/join_online_room_popup.dart';

class OnlineRoomPopup extends ConsumerWidget {
  const OnlineRoomPopup({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return BasePopup(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomButton(
            label: "Buat Room",
            onPressed: () {
              ref
                  .read(logicGateWebsocketControllerProvider.notifier)
                  .createRoom();
              ref.read(soundEffectServiceProvider.notifier).playButtonClick1();
              ref
                  .read(logicGateControllerProvider.notifier)
                  .initializeLogicGateGame(isOnline: true);
              context.go('/minigames/logic-gate/gameplay');
              closePopupOverlay(ref);
            },
          ),
          SizedBox(width: 12.w),
          CustomButton(
            label: "Gabung Room",
            onPressed: () {
              ref.read(soundEffectServiceProvider.notifier).playButtonClick1();
              showPopupOverlay(context, const JoinOnlineRoomPopup(), ref);
            },
          ),
        ],
      ),
    );
  }
}
