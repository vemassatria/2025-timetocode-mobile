import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timetocode/features/3_drag_and_drop_mode/presentation/widgets/block.dart';
import 'package:timetocode/features/3_drag_and_drop_mode/data/controllers/dnd_gameplay_controller.dart';
import 'package:timetocode/features/3_drag_and_drop_mode/data/models/draggable_model.dart';
import 'package:timetocode/app/config/theme/colors.dart';

class DropZoneTargetWidget extends ConsumerWidget {
  final String zoneId;

  const DropZoneTargetWidget({super.key, required this.zoneId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final DraggableModel? placedOption = ref.watch(
      dndControllerProvider.select(
        (state) =>
            state.dropZones!.firstWhere((z) => z.id == zoneId).contentDraggable,
      ),
    );

    return DragTarget<String>(
      builder: (context, candidateData, rejectedData) {
        final bool isHovering = candidateData.isNotEmpty;

        final textStyle = TextStyle(
          fontFamily: 'Fira Code',
          fontSize: 16.sp,
          color: AppColors.gray1,
          letterSpacing: 0.5,
          height: 2,
        );

        if (placedOption != null) {
          final isSpecial = placedOption.info != null;
          return Draggable<String>(
            data: placedOption.id,
            feedback: Block(
              text: placedOption.content.value,
              isDragging: true,
              isSpecial: isSpecial,
            ),
            childWhenDragging: Opacity(
              opacity: 0.4,
              child: Block(
                text: placedOption.content.value,
                isSpecial: isSpecial,
              ),
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
              child: Text(
                placedOption.content.value,
                style: textStyle.copyWith(
                  color: isSpecial ? AppColors.rewardYellow : AppColors.gray1,
                ),
              ),
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
