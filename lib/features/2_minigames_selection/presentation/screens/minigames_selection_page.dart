import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:timetocode/app/data/services/sound_effect_service.dart';
import 'package:timetocode/app/config/theme/colors.dart';
import 'package:timetocode/app/config/theme/typography.dart';
import 'package:timetocode/app/widgets/buttons/custom_button.dart';

class MinigamesSelectionPage extends ConsumerWidget {
  const MinigamesSelectionPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: AppColors.darkBackground,
      appBar: AppBar(
        backgroundColor: AppColors.surfaceDark,
        elevation: 0,
        title: Text('Pilihan Permainan', style: AppTypography.heading6()),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomButton(
              label: "Challenge",
              onPressed: () {
                ref.read(soundEffectServiceProvider.notifier).playSelectClick();
                context.push('/minigames/tantangan');
              },
            ),
            SizedBox(height: 20.h),
            CustomButton(
              label: "Logic Gate",
              onPressed: () {
                ref.read(soundEffectServiceProvider.notifier).playSelectClick();
                context.push('/minigames/logic-gate');
              },
            ),
          ],
        ),
      ),
    );
  }
}
