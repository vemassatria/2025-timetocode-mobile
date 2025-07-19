import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timetocode/themes/colors.dart';

class DropZoneTargetWidget extends StatelessWidget {
  final String zoneId;
  final Widget? child;
  final Function(String, String) onAccept;

  const DropZoneTargetWidget({
    super.key,
    required this.zoneId,
    required this.onAccept,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return DragTarget<String>(
      builder: (context, candidateData, rejectedData) {
        bool isHovering = candidateData.isNotEmpty;
        return Container(
          width: double.infinity,
          height: 60.h,
          decoration: BoxDecoration(
            color:
                isHovering
                    ? AppColors.deepAzure.withValues(alpha: 0.5)
                    : AppColors.black3,
            borderRadius: BorderRadius.circular(8.r),
            border: Border.all(
              color: isHovering ? AppColors.skyByte : AppColors.gray1,
              width: 2.w,
              style: BorderStyle.solid,
            ),
          ),
          child:
              child ??
              Center(
                child: Text(
                  'Letakkan di sini',
                  style: TextStyle(
                    color: AppColors.secondaryText,
                    fontSize: 14.sp,
                  ),
                ),
              ),
        );
      },
      onAcceptWithDetails: (data) => onAccept(zoneId, data.data),
    );
  }
}
