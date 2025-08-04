import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timetocode/components/box/drag_and_drop/block.dart';
import 'package:timetocode/games/backend/controllers/drag_and_drop/dnd_state.dart';
import 'package:timetocode/games/backend/models/drag%20_and_drop/draggable_model.dart';
import 'package:timetocode/themes/colors.dart';

class DropZoneTargetWidget extends ConsumerWidget {
  final String zoneId;

  const DropZoneTargetWidget({super.key, required this.zoneId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final DraggableModel? placedOption = ref.watch(
      dndControllerProvider.select(
        (state) =>
            state.dropZones.firstWhere((z) => z.id == zoneId).contentDraggable,
      ),
    );

    return DragTarget<String>(
      builder: (context, candidateData, rejectedData) {
        final bool isHovering = candidateData.isNotEmpty;

        final textStyle = TextStyle(
          fontFamily: 'Fira Code',
          fontSize: 12.sp,
          color: const Color(0xFFDCDCAA),
          letterSpacing: 0.5,
          height: 1.5,
        );

        if (placedOption != null) {
          return Draggable<String>(
            data: placedOption.id,
            feedback: Block(text: placedOption.content.value, isDragging: true),
            childWhenDragging: Opacity(
              opacity: 0.4,
              child: Block(text: placedOption.content.value),
            ),
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 4.w),
              padding: EdgeInsets.only(bottom: 2.h),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color:
                        isHovering ? AppColors.skyByte : AppColors.primaryText,
                    width: 1.5.w,
                  ),
                ),
              ),
              child: Text(placedOption.content.value, style: textStyle),
            ),
          );
        } else {
          return Container(
            width: 50.w,
            margin: EdgeInsets.symmetric(horizontal: 4.w),
            padding: EdgeInsets.only(bottom: 2.h),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color:
                      isHovering
                          ? AppColors.skyByte
                          : AppColors.primaryText.withValues(alpha: 0.5),
                  width: 1.5.w,
                  style: BorderStyle.solid,
                ),
              ),
              color:
                  isHovering ? AppColors.blueTransparent : Colors.transparent,
            ),
            child: Text(
              ' ',
              style: textStyle.copyWith(color: Colors.transparent),
            ),
          );
        }
      },
      onWillAcceptWithDetails: (details) => placedOption?.id != details.data,
      onAcceptWithDetails:
          (data) => ref
              .read(dndControllerProvider.notifier)
              .dropItem(zoneId, data.data),
    );
  }
}
