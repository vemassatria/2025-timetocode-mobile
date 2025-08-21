import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:timetocode/app/data/providers/popup_visibility_provider.dart';
import 'package:timetocode/app/data/services/sound_effect_service.dart';
import 'package:timetocode/app/utils/overlay_utils.dart';
import 'package:timetocode/app/widgets/popups/answer_popup.dart';
import 'package:timetocode/app/widgets/popups/menu_popup.dart';
import 'package:timetocode/features/0_core/models/choices_model.dart';
import 'package:timetocode/features/2_challenge_mode/data/controllers/challenge_gameplay_controller.dart';
import 'package:timetocode/features/2_challenge_mode/presentation/widgets/challenge_appbar.dart';
import 'package:timetocode/features/2_challenge_mode/presentation/widgets/challenge_body.dart';
import 'package:timetocode/features/2_challenge_mode/presentation/widgets/submit_button.dart';

class ChallengeGameplayPage extends ConsumerStatefulWidget {
  const ChallengeGameplayPage({super.key});

  @override
  ConsumerState<ChallengeGameplayPage> createState() =>
      _ChallengeGameplayPageState();
}

class _ChallengeGameplayPageState extends ConsumerState<ChallengeGameplayPage> {
  ChoicesModel? selectedAnswer;
  late final SoundEffectService soundEffectService;
  late final ChallengeController challengeController;

  @override
  void initState() {
    super.initState();
    soundEffectService = ref.read(soundEffectServiceProvider.notifier);
    challengeController = ref.read(challengeControllerProvider.notifier);
  }

  void selectAnswer(ChoicesModel answer) {
    setState(() => selectedAnswer = answer);
  }

  void clearSelection() {
    setState(() => selectedAnswer = null);
  }

  void _showMenuPopup() {
    soundEffectService.playSelectClick();
    showPopupOverlay(
      context,
      MenuPopup(
        onRestart: () {
          challengeController.restartChallenge();
          closePopupOverlay(ref);
        },
        onExit: () {
          challengeController.exitChallenge();
          closePopupOverlay(ref);
        },
        onClose: () => closePopupOverlay(ref),
        onGoBack: () => closePopupOverlay(ref),
      ),
      ref,
    );
  }

  void _handlePopScope(bool didPop, Object? result) {
    if (didPop) return;

    final isPopupVisible = ref.read(popupVisibilityProvider);
    if (isPopupVisible) {
      closePopupOverlay(ref);
    } else {
      _showMenuPopup();
    }
  }

  void _checkAnswer(ChoicesModel selected) {
    final choices = ref
        .read(challengeControllerProvider)
        .currentQuestion!
        .choices;
    final correctAnswer = choices.firstWhere((c) => c.isCorrect == true).text;

    showPopupOverlay(
      context,
      AnswerPopup(
        isCorrect: selected.isCorrect!,
        onPressed: () {
          soundEffectService.playPopupAnswer();
          challengeController.checkAnswer(selected);
          closePopupOverlay(ref);
          clearSelection();
        },
        text: correctAnswer,
      ),
      ref,
    );
  }

  @override
  Widget build(BuildContext context) {
    final isLoading = ref.watch(
      challengeControllerProvider.select((state) => state.isLoading),
    );

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: _handlePopScope,
      child: isLoading == true
          ? const Center(child: CircularProgressIndicator())
          : Scaffold(
              appBar: ChallengeAppBar(onMenuPressed: _showMenuPopup),
              body: ChallengeBody(
                selectedAnswer: selectedAnswer,
                onAnswerSelected: selectAnswer,
              ),
              bottomNavigationBar: SubmitButton(
                selectedAnswer: selectedAnswer,
                onSubmit: () {
                  soundEffectService.playSubmit();
                  _checkAnswer(selectedAnswer!);
                },
              ),
            ),
    );
  }
}
