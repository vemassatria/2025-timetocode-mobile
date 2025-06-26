import 'package:flutter/material.dart';
import 'package:timetocode/components/popups/confirm_popup.dart';
import 'package:timetocode/components/popups/menu_popup.dart';
import 'package:timetocode/games/backend/providers/visual_novel/story_provider.dart';
import 'package:timetocode/utils/overlay_utils.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/services.dart';
import 'package:timetocode/games/backend/providers/challenge/challenge_provider.dart';

class PopscopePopups {
  static bool _isPopScopeActive = true;

  static void setPopScope(bool setIsPopScopeActive) {
    _isPopScopeActive = setIsPopScopeActive;
  }

  static bool isPopScopeActive() {
    return _isPopScopeActive;
  }

  static void openMenuPopup(BuildContext context, WidgetRef ref) {
    showPopupOverlay(
      context,
      MenuPopup(
        onRestart: () {
          final storyController = ref.read(storyControllerProvider.notifier);
          storyController.restartLevel();
          closePopupOverlay();
        },
        onExit: () {
          final storyController = ref.read(storyControllerProvider.notifier);
          storyController.exitLevel();
          closePopupOverlay();
        },
        onClose: () {
          closePopupOverlay();
          setPopScope(true);
        },
        onGoBack: () => goBackToPreviousOverlay(context),
      ),
    );
  }

  static void openMenuPopupChallange(BuildContext context, WidgetRef ref) {
    final challengeController = ref.read(challengeControllerProvider.notifier);
    showPopupOverlay(
      context,
      MenuPopup(
        onRestart: () {
          closePopupOverlay();
          challengeController.resetChallenge();
        },
        onExit: () {
          closePopupOverlay();
          challengeController.endChallengePopup();
        },
        onClose: () {
          closePopupOverlay();
          setPopScope(true);
        },
        onGoBack: () => goBackToPreviousOverlay(context),
      ),
    );
  }

  static void exitPopup(BuildContext context) {
    showPopupOverlay(
      context,
      ConfirmPopup(
        title: 'Keluar Aplikasi?',
        description: 'Apakah kamu yakin ingin keluar dari aplikasi?',
        confirmLabel: 'Keluar',
        onPrimaryButtonPressed: () {
          closePopupOverlay();
          SystemNavigator.pop(); // keluar dari aplikasi
        },
        onGoBack: () {
          PopscopePopups.setPopScope(true);
          closePopupOverlay();
        },
      ),
    );
  }
}
