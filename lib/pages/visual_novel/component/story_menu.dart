import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timetocode/components/menu_button.dart';
import 'package:timetocode/games/backend/controllers/visual_novel/story_gameplay_controller.dart';
import 'package:timetocode/utils/overlay_utils.dart';

class StoryMenu extends ConsumerWidget {
  const StoryMenu({super.key});

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
              storyController.restartStory();
              closePopupOverlay(ref);
            },
            onExit: () {
              storyController.exitStory();
              closePopupOverlay(ref);
            },
          ),
        ),
      ),
    );
  }
}
