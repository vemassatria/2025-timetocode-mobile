import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timetocode/app/widgets/buttons/menu_button.dart';
import 'package:timetocode/features/1_story_mode/data/controllers/story_gameplay_controller.dart';
import 'package:timetocode/app/utils/overlay_utils.dart';

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
