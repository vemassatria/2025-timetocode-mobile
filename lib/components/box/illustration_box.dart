import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timetocode/themes/colors.dart';

class IllustrationBox extends StatelessWidget {
  final ImageProvider image;

  const IllustrationBox({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 328.w,
      height: 325,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.white,
        border: Border.all(color: AppColors.black1, width: 2),
        borderRadius: BorderRadius.circular(8),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Image(
          image: image,
          fit: BoxFit.cover,
          width: double.infinity,
          height: double.infinity,
        ),
      ),
    );
  }
}
