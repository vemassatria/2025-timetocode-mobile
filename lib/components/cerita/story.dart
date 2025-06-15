import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timetocode/components/menu_button.dart';
import 'package:timetocode/utils/overlay_utils.dart';
import 'package:timetocode/components/popups/popscope_popups.dart';
import 'package:timetocode/games/backend/providers/story_provider.dart';

class StoryPage extends ConsumerWidget {
  const StoryPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final storyStateAsync = ref.watch(storyControllerProvider);

    return storyStateAsync.when(
      loading:
          () => const Scaffold(
            backgroundColor: Colors.transparent,
            body: Center(child: CircularProgressIndicator()),
          ),
      error:
          (error, stackTrace) => Scaffold(
            backgroundColor: Colors.transparent,
            body: Center(child: Text('Error: $error')),
          ),
      data: (storyState) {
        return PopScope(
          canPop: false,
          onPopInvokedWithResult: (didPop, result) {
            if (PopscopePopups.isPopScopeActive()) {
              PopscopePopups.openMenuPopup(context, ref);
              PopscopePopups.setPopScope(false);
            } else {
              closePopupOverlay();
              PopscopePopups.setPopScope(true);
            }
          },
          child: Stack(
            children: [
              // Menu button
              Positioned(
                top: 0.h,
                left: 0.w,
                child: SafeArea(
                  child: Padding(
                    padding: EdgeInsets.only(top: 16.h),
                    child: MenuButton(
                      onRestart: () {
                        final storyController = ref.read(
                          storyControllerProvider.notifier,
                        );
                        storyController.restartLevel();
                        closePopupOverlay();
                      },
                      onExit: () {
                        final storyController = ref.read(
                          storyControllerProvider.notifier,
                        );
                        storyController.exitLevel();
                        closePopupOverlay();
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
