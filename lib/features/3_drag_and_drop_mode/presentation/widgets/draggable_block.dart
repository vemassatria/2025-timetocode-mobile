import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:timetocode/app/data/services/sound_effect_service.dart';
import 'package:timetocode/features/3_drag_and_drop_mode/presentation/widgets/block.dart';
import 'package:timetocode/app/widgets/popups/info_popup.dart';
import 'package:timetocode/features/3_drag_and_drop_mode/data/models/draggable_model.dart';
import 'package:timetocode/app/utils/overlay_utils.dart';

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
