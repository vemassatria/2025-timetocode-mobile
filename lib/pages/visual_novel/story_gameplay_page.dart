import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:timetocode/pages/visual_novel/component/dialog_box.dart';
import 'package:timetocode/pages/visual_novel/component/intro.dart';
import 'package:timetocode/pages/visual_novel/component/question_box_widget.dart';
import 'package:timetocode/pages/visual_novel/component/skip_button.dart';
import 'package:timetocode/pages/visual_novel/component/story.dart';
import 'package:timetocode/games/backend/controllers/visual_novel/story_gameplay_controller.dart';
import 'package:timetocode/games/backend/providers/game_provider.dart';
import 'package:timetocode/games/backend/providers/visual_novel/story_provider.dart';

class StoryGameplayPage extends ConsumerStatefulWidget {
  const StoryGameplayPage({super.key});

  @override
  ConsumerState<StoryGameplayPage> createState() => _StoryGameplayPageState();
}

class _StoryGameplayPageState extends ConsumerState<StoryGameplayPage> {
  late final game;
  late final StoryController storyController;

  @override
  void initState() {
    super.initState();
    storyController = ref.read(storyControllerProvider.notifier);
    game = ref.read(gameEngineProvider);
  }

  @override
  Widget build(BuildContext context) {
    final storyAsync = ref.watch(storyControllerProvider);

    ref.listen<AsyncValue<StoryState>>(storyControllerProvider, (_, next) {
      next.whenData((state) {
        if (state.activeMode == 'end') {
          context.go('/pembelajaran/endgame');
        } else if (state.activeMode == 'exit') {
          context.pop();
          storyController.deleteAll();
        }
      });
    });

    return Scaffold(
      body: storyAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, s) => Center(child: Text("Error: $e")),
        data: (storyState) {
          return Stack(
            children: [
              GameWidget(game: game),

              _buildContentUI(storyState.activeMode, storyState),

              const StoryPage(),

              if (storyState.activeMode == 'dialog') const SkipButton(),
            ],
          );
        },
      ),
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
        return const SizedBox.shrink();
    }
  }
}
