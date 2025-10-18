import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:timetocode/app/config/theme/colors.dart';
import 'package:timetocode/app/config/theme/typography.dart';
import 'package:timetocode/app/data/services/sound_effect_service.dart';
import 'package:timetocode/features/2_minigames_selection/games/matriks/data/providers/matrix_level_provider.dart';

class MatrixLevelSelectionPage extends ConsumerWidget {
  const MatrixLevelSelectionPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Future.microtask(() => ref.invalidate(matrixScoreProvider));

    final levelsAsync = ref.watch(matrixLevelsProvider);

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
      ),
      body: levelsAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(child: Text('Error: $err')),
        data: (levels) {
          return GridView.builder(
            padding: EdgeInsets.all(16.w),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              crossAxisSpacing: 16.w,
              mainAxisSpacing: 16.h,
            ),
            itemCount: levels.length,
            itemBuilder: (context, index) {
              final level = levels[index];
              return GestureDetector(
                onTap: () {
                  context.push('/minigames/matriks/level', extra: level);
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.surfaceDark,
                    borderRadius: BorderRadius.circular(8.r),
                    border: Border.all(color: AppColors.technoBlue),
                  ),
                  child: Center(
                    child: Text(
                      level.levelId.toString(),
                      style: AppTypography.heading4(),
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
