import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:timetocode/app/config/theme/colors.dart';
import 'package:timetocode/app/config/theme/typography.dart';

class TargetBinary extends StatelessWidget {
  final int id;

  const TargetBinary({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50.w,
      height: 35.h,
      margin: EdgeInsets.symmetric(horizontal: 4.w),
      decoration: BoxDecoration(
        color: id == 0 ? AppColors.softViolet : AppColors.skyByte,
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(
          color: id == 0 ? AppColors.royalIndigo : AppColors.deepAzure,
          width: 2.w,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            'assets/images/logic_gate/icons/target.svg',
            width: 18.w,
            height: 18.h,
          ),
          Text(
            " = ${id.toString()}",
            style: AppTypography.normalBold(color: AppColors.black1),
          ),
        ],
      ),
    );
  }
}
