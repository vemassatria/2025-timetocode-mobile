import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:timetocode/app/data/services/sound_effect_service.dart';
import 'package:timetocode/app/utils/overlay_utils.dart';
import 'package:timetocode/features/3_logic_gate_mode/data/models/logic_gate_card_model.dart';
import 'package:timetocode/features/3_logic_gate_mode/presentation/widgets/detail_card_popup.dart';
import 'package:timetocode/features/3_logic_gate_mode/presentation/widgets/logic_gate_card.dart';

class DraggableCard extends ConsumerWidget {
  final LogicGateCardModel card;

  const DraggableCard({super.key, required this.card});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final block = LogicGateCard(card: card);
    final feedbackBlock = LogicGateCard(card: card, isDragging: true);
    final blockWhenDragging = Opacity(opacity: 0.4, child: block);

    return GestureDetector(
      onTap: () {
        ref.read(soundEffectServiceProvider.notifier).playSelectClick();
        showPopupOverlay(
          context,
          DetailCardPopup(
            type: card.type,
            closePopup: () => closePopupOverlay(ref),
          ),
          ref,
        );
      },
      child: Draggable<int>(
        data: card.id,
        feedback: feedbackBlock,
        childWhenDragging: blockWhenDragging,
        child: block,
      ),
    );
  }
}
