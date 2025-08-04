import 'package:flutter/material.dart';
import 'package:timetocode/components/box/drag_and_drop/block.dart';
import 'package:timetocode/games/backend/models/drag%20_and_drop/draggable_model.dart';

class DraggableBlockWidget extends StatelessWidget {
  final DraggableModel option;

  const DraggableBlockWidget({super.key, required this.option});

  @override
  Widget build(BuildContext context) {
    return Draggable<String>(
      data: option.id,
      feedback: Block(text: option.content.value, isDragging: true),
      childWhenDragging: Opacity(
        opacity: 0.4,
        child: Block(text: option.content.value),
      ),
      child: Block(text: option.content.value),
    );
  }
}
