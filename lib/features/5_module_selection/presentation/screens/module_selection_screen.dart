import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timetocode/app/config/theme/colors.dart';
import 'package:timetocode/app/config/theme/typography.dart';
import '../widgets/module_card.dart';

class ModuleSelectionScreen extends StatelessWidget {
  const ModuleSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkBackground,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 24.h),
              Text(
                'Pilih Modul Pembelajaran',
                style: AppTypography.heading4(color: AppColors.primaryText),
              ),
              SizedBox(height: 8.h),
              Text(
                'memulai kapasitas modul',
                style: AppTypography.small(color: AppColors.secondaryText),
              ),
              SizedBox(height: 24.h),
              Expanded(
                child: ListView(
                  children: const [
                    ModuleCard(
                      title: 'If, Else, Switch',
                      description:
                          'Pelajari penggunaan untuk pembuatan logika bercabang',
                      isCompleted: true,
                    ),
                    ModuleCard(
                      title: 'For, While, Do-while',
                      description:
                          'Pelajari penggunaan untuk pembuatan logika berulang',
                      isCompleted: false,
                    ),
                    // Add more ModuleCard widgets here
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
