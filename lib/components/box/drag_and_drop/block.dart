import 'package:flutter/material.dart';
import 'package:timetocode/games/backend/models/drag%20_and_drop/draggable_model.dart';
import 'package:timetocode/themes/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DraggableBlockWidget extends StatelessWidget {
  final DraggableModel option;

  const DraggableBlockWidget({super.key, required this.option});

  @override
  Widget build(BuildContext context) {
    return Draggable<String>(
      data: option.id,
      feedback: _buildBlock(isDragging: true),
      child: _buildBlock(),
    );
  }

  Widget _buildBlock({bool isDragging = false}) {
    return Material(
      color: Colors.transparent,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
        decoration: BoxDecoration(
          color: isDragging ? AppColors.technoBlue : AppColors.surfaceDark,
          borderRadius: BorderRadius.circular(8.r),
          border: Border.all(color: AppColors.white, width: 2.w),
        ),
        child: Text(
          option.content.value,
          style: TextStyle(color: Colors.white, fontSize: 14.sp),
        ),
      ),
    );
  }
}
