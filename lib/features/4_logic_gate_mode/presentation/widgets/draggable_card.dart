import 'package:flutter/widgets.dart';
import 'package:timetocode/features/4_logic_gate_mode/data/models/logic_gate_card_model.dart';
import 'package:timetocode/features/4_logic_gate_mode/presentation/widgets/logic_gate_card.dart';

class DraggableCard extends StatelessWidget {
  final LogicGateCardModel card;

  const DraggableCard({super.key, required this.card});

  @override
  Widget build(BuildContext context) {
    final block = LogicGateCard(card: card);
    final feedbackBlock = LogicGateCard(card: card, isDragging: true);
    final blockWhenDragging = Opacity(opacity: 0.4, child: block);

    return Draggable<int>(
      data: card.id,
      feedback: feedbackBlock,
      childWhenDragging: blockWhenDragging,
      child: block,
    );
  }
}
