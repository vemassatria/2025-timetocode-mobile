import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timetocode/components/menu_button.dart';
import 'package:timetocode/games/backend/providers/visual_novel/story_provider.dart';
import 'package:timetocode/utils/overlay_utils.dart';

class StoryPage extends ConsumerWidget {
  const StoryPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final storyController = ref.read(storyControllerProvider.notifier);
    return Positioned(
      top: 0.h,
      left: 0.w,
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(top: 16.h),
          child: MenuButton(
            onRestart: () {
              storyController.restartLevel();
              closePopupOverlay(ref);
            },
            onExit: () {
              storyController.exitLevel();
              closePopupOverlay(ref);
            },
          ),
        ),
      ),
    );
  }
}
