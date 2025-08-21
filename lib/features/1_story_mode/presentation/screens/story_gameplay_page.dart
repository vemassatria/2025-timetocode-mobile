import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:timetocode/app/widgets/popups/menu_popup.dart';
import 'package:timetocode/app/data/providers/popup_visibility_provider.dart';
import 'package:timetocode/features/1_story_mode/engine/core/game_engine.dart';
import 'package:timetocode/features/1_story_mode/presentation/widgets/dialog_box.dart';
import 'package:timetocode/features/1_story_mode/presentation/widgets/intro.dart';
import 'package:timetocode/features/1_story_mode/presentation/widgets/question_box_widget.dart';
import 'package:timetocode/features/1_story_mode/presentation/widgets/skip_button.dart';
import 'package:timetocode/features/1_story_mode/presentation/widgets/story_menu.dart';
import 'package:timetocode/features/1_story_mode/data/controllers/story_gameplay_controller.dart';
import 'package:timetocode/app/utils/overlay_utils.dart';

class StoryGameplayPage extends ConsumerStatefulWidget {
  const StoryGameplayPage({super.key});

  @override
  ConsumerState<StoryGameplayPage> createState() => _StoryGameplayPageState();
}

class _StoryGameplayPageState extends ConsumerState<StoryGameplayPage> {
  late final GameEngine game;

  @override
  void initState() {
    super.initState();
    game = ref.read(storyControllerProvider.notifier).game;
  }

  @override
  Widget build(BuildContext context) {
    final isLoading = ref.watch(
      storyControllerProvider.select((state) => state.isLoading),
    );
    final activeMode = ref.watch(
      storyControllerProvider.select((state) => state.activeMode),
    );

    return PopScope(
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
      child: isLoading == true
          ? const Center(child: CircularProgressIndicator())
          : Scaffold(
              body: Stack(
                children: [
                  GameWidget(game: game),

                  _buildContentUI(activeMode),

                  const StoryMenu(),

                  if (activeMode == 'dialog') const SkipButton(),
                ],
              ),
            ),
    );
  }

  Widget _buildContentUI(String? activeMode) {
    switch (activeMode) {
      case 'preDialog':
        return const IntroBoxWidget();
      case 'dialog':
        return const DialogBox();
      case 'question':
        return const QuestionBoxWidget();
      default:
        return const SizedBox();
    }
  }
}
