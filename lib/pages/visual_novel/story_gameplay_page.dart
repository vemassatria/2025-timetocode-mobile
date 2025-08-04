import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:timetocode/components/popups/menu_popup.dart';
import 'package:timetocode/games/backend/providers/ui_provider.dart';
import 'package:timetocode/pages/visual_novel/component/dialog_box.dart';
import 'package:timetocode/pages/visual_novel/component/intro.dart';
import 'package:timetocode/pages/visual_novel/component/question_box_widget.dart';
import 'package:timetocode/pages/visual_novel/component/skip_button.dart';
import 'package:timetocode/pages/visual_novel/component/story_menu.dart';
import 'package:timetocode/games/backend/controllers/visual_novel/story_gameplay_controller.dart';
import 'package:timetocode/utils/overlay_utils.dart';

class StoryGameplayPage extends ConsumerStatefulWidget {
  const StoryGameplayPage({super.key});

  @override
  ConsumerState<StoryGameplayPage> createState() => _StoryGameplayPageState();
}

class _StoryGameplayPageState extends ConsumerState<StoryGameplayPage> {
  late final game;

  @override
  void initState() {
    super.initState();
    game = ref.read(storyControllerProvider.notifier).game;
  }

  @override
  Widget build(BuildContext context) {
    final storyState = ref.watch(storyControllerProvider);

    return PopScope(
      child: Scaffold(
        body: Stack(
          children: [
            GameWidget(game: game),

            _buildContentUI(storyState.activeMode, storyState),

            const StoryMenu(),

            if (storyState.activeMode == 'dialog') const SkipButton(),
          ],
        ),
      ),
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) return;
        final isPopupVisible = ref.read(popupVisibilityProvider);
        final storyController = ref.read(storyControllerProvider.notifier);
        if (isPopupVisible) {
          closePopupOverlay(ref);
        } else {
          showPopupOverlay(
            context,
            MenuPopup(
              onRestart: () {
                storyController.restartStory();
                closePopupOverlay(ref);
              },
              onExit: () {
                storyController.exitStory();
                closePopupOverlay(ref);
              },
              onClose: () {
                closePopupOverlay(ref);
              },
              onGoBack: () {
                closePopupOverlay(ref);
              },
            ),
            ref,
          );
        }
      },
    );
  }

  Widget _buildContentUI(String? activeMode, StoryState storyState) {
    switch (activeMode) {
      case 'preDialog':
        return IntroBoxWidget(preDialog: storyState.preDialog!);
      case 'dialog':
        return DialogBox(
          dialog: storyState.currentDialog!,
          indexDialog: storyState.indexDialog!,
          character1Name: storyState.activeLevel!.character1,
          character2Name: storyState.activeLevel!.character2,
        );
      case 'question':
        return QuestionBoxWidget(question: storyState.currentQuestion!);
      default:
        return const Center(child: CircularProgressIndicator());
    }
  }
}
