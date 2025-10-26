import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:timetocode/app/config/theme/colors.dart';
import 'package:timetocode/app/config/theme/typography.dart';
import 'package:timetocode/app/data/services/sound_effect_service.dart';
import '../../data/controllers/matrix_progress_controller.dart';
import '../../data/providers/matrix_level_provider.dart';
import '../widgets/matrix_level_card.dart';

class MatrixLevelSelectionPage extends ConsumerWidget {
  const MatrixLevelSelectionPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Map<int, int> progressData = ref.watch(matrixProgressProvider);

    const totalLevels = 5; 

    return Scaffold(
      backgroundColor: AppColors.darkBackground,
      appBar: AppBar(
        title: Text('Matriks Kode - Looping', style: AppTypography.heading6()),
        backgroundColor: AppColors.surfaceDark,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            ref.read(soundEffectServiceProvider.notifier).playButtonClick1();
            if (GoRouter.of(context).canPop()) {
              context.pop();
            } else {
              context.go('/minigames');
            }
          },
        ),
        centerTitle: true,
        bottom: PreferredSize( 
          preferredSize: const Size.fromHeight(1),
          child: Container(height: 1, color: AppColors.black1),
        ),
      ),
      body: GridView.builder(
          padding: EdgeInsets.all(16.w),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, 
            crossAxisSpacing: 16.w,
            mainAxisSpacing: 16.h,
            childAspectRatio: 1.0, 
          ),
          itemCount: totalLevels,
          itemBuilder: (context, index) {
            final levelNumber = index + 1;

            bool isUnlocked;
            if (levelNumber == 1) {
              isUnlocked = true;
            } else {
              final previousLevelStars = progressData[levelNumber - 1] ?? 0;
              isUnlocked = previousLevelStars >= 2;
            }

            final int starCount = progressData[levelNumber] ?? 0;

            return MatrixLevelCard(
              levelNumber: levelNumber,
              starCount: starCount,
              isUnlocked: isUnlocked, 
              onTap: () {
                if (isUnlocked) {
                  ref.read(soundEffectServiceProvider.notifier).playSelectClick();
                  ref.invalidate(matrixScoreProvider);
                  context.push(
                    '/minigames/matriks/level',
                    extra: levelNumber,
                  );
                } else {
                  ref.read(soundEffectServiceProvider.notifier).playErrorClick();
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Dapatkan minimal 2 bintang di level sebelumnya!"), duration: Duration(seconds: 1),)
                  );
                }
              },
            );
          },
        )
    );
  }
}