import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'package:timetocode/components/button.dart';
import 'package:timetocode/components/game_stats.dart';
import 'package:timetocode/components/popups/info_popup.dart';
import 'package:timetocode/providers/game_provider.dart';
import 'package:timetocode/themes/colors.dart';
import 'package:timetocode/themes/typography.dart';
import 'package:timetocode/utils/overlay_utils.dart';
import 'package:timetocode/utils/screen_utils.dart';

class EndGameScreen extends ConsumerWidget {
  const EndGameScreen({super.key});

  Future<void> _saveCompletedLevel(int level) async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs.getInt('completedLevel')! < level) {
      await prefs.setInt('completedLevel', level);
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    initScreenUtil(context);

    final game = ref.read(gameEngineProvider);
    final correctAnswer = game.correctAnswer;
    final wrongAnswer = game.wrongAnswer;
    final totalAnswer = correctAnswer + wrongAnswer;
    final totalSteps = game.levels.length;
    final completedLevel = game.activeLevel + 1;
    final maxLevel = game.levels.length;
    _saveCompletedLevel(completedLevel);

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 59.5.h),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircularStepProgressIndicator(
              circularDirection: CircularDirection.counterclockwise,
              totalSteps: totalSteps,
              currentStep: completedLevel,
              stepSize: 20,
              selectedColor: AppColors.xpGreen,
              unselectedColor: AppColors.gray1,
              height: 250.h,
              width: 250.w,
              child: Center(
                child: Text(
                  '$completedLevel/$maxLevel',
                  style: AppTypography.heading1().copyWith(
                    decoration: TextDecoration.none,
                  ),
                ),
              ),
            ),

            SizedBox(height: 32.h),

            Text(
              'Level $completedLevel Selesai',
              style: AppTypography.heading4().copyWith(
                decoration: TextDecoration.none,
              ),
            ),

            SizedBox(height: 16.h),

            CustomButton(
              label: "Rangkuman",
              icon: Icon(Icons.chrome_reader_mode),
              color: ButtonColor.purple,
              type: ButtonType.iconLabel,
              onPressed: () {
                showPopupOverlay(
                  context,
                  InfoPopup(
                    title: "Rangkuman",
                    summaryList: game.levels[game.activeLevel].summary!,
                    variant: InfoPopupVariant.summary,
                    onClose: closePopupOverlay,
                  ),
                );
              },
            ),

            SizedBox(height: 64.h),

            GameStats(
              correct: correctAnswer,
              wrong: wrongAnswer,
              total: totalAnswer,
            ),

            SizedBox(height: 64.h),

            CustomButton(
              label: "Lanjutkan",
              widthMode: ButtonWidthMode.fill,
              onPressed: () {
                game.overlays.remove('EndGame');
                game.endGame();
              },
            ),
          ],
        ),
      ),
    );
  }
}
