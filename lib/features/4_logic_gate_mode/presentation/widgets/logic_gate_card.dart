import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:timetocode/features/4_logic_gate_mode/data/models/logic_gate_card_model.dart';
import 'package:timetocode/features/4_logic_gate_mode/data/models/logic_gate_type.dart';

class LogicGateCard extends StatelessWidget {
  final LogicGateCardModel card;
  final bool isDragging;
  final double height;
  final double width;

  const LogicGateCard({
    super.key,
    required this.card,
    this.isDragging = false,
    this.height = 70.0,
    this.width = 49.0,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      elevation: isDragging ? 4.0 : 0.0,
      child: SvgPicture.asset(
        card.type.assetPath,
        width: width.w,
        height: height.h,
        placeholderBuilder: (BuildContext context) =>
            const CircularProgressIndicator(),
      ),
    );
  }
}
