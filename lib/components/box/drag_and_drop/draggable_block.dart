import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:timetocode/components/box/drag_and_drop/block.dart';
import 'package:timetocode/components/popups/info_popup.dart';
import 'package:timetocode/games/backend/models/drag%20_and_drop/draggable_model.dart';
import 'package:timetocode/games/backend/providers/sound_effect_service_provider.dart';
import 'package:timetocode/utils/overlay_utils.dart';

class DraggableBlockWidget extends ConsumerWidget {
  final DraggableModel option;

  const DraggableBlockWidget({super.key, required this.option});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool isSpecial = option.info != null;

    final block = Block(text: option.content.value, isSpecial: isSpecial);

    final feedbackBlock = Block(
      text: option.content.value,
      isDragging: true,
      isSpecial: isSpecial,
    );

    final childWhenDragging = Opacity(opacity: 0.4, child: block);

    if (isSpecial) {
      return GestureDetector(
        onTap: () {
          ref.read(soundEffectServiceProvider.notifier).playSelectClick();
          showPopupOverlay(
            context,
            InfoPopup(
              title: "Informasi Blok",
              description: option.info!,
              onClose: () => closePopupOverlay(ref),
            ),
            ref,
          );
        },
        child: Draggable<String>(
          data: option.id,
          feedback: feedbackBlock,
          childWhenDragging: childWhenDragging,
          child: block,
        ),
      );
    }
    return Draggable<String>(
      data: option.id,
      feedback: feedbackBlock,
      childWhenDragging: childWhenDragging,
      child: block,
    );
  }
}
