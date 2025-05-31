import 'package:flutter/material.dart';
import 'package:timetocode/components/popups/confirm_popup.dart';
import 'package:timetocode/components/popups/menu_popup.dart';
import 'package:timetocode/utils/overlay_utils.dart';
import 'package:timetocode/games/backend/providers/story_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/services.dart';
import 'package:timetocode/games/backend/providers/challenge_provider.dart';


class PopscopePopups {
  static bool _isPopScopeActive = true;

  static void setPopScope(bool setIsPopScopeActive){
    _isPopScopeActive = setIsPopScopeActive;
  }

  static bool isPopScopeActive(){
    return _isPopScopeActive;
  }

  static void openMenuPopup(BuildContext context, WidgetRef ref){
    showPopupOverlay(
      context,
      MenuPopup(
        onRestart: () {
          // Gunakan StoryController untuk me-restart level
          final storyController = ref.read(
            storyControllerProvider.notifier,
          );
          storyController.restartLevel();
          closePopupOverlay();
        },
        onExit: () {
          // Gunakan StoryController untuk mengakhiri cerita
          final storyController = ref.read(
            storyControllerProvider.notifier,
          );
          storyController.exitLevel();
          closePopupOverlay();
        },
        onClose: (){
          closePopupOverlay();
          setPopScope(true);
        },
        onGoBack: () => goBackToPreviousOverlay(context),
      ),
    );
  }

  static void openMenuPopupChallange(BuildContext context, WidgetRef ref){
    showPopupOverlay(
      context,
      MenuPopup(
        onRestart: (){
          // untuk restart challenge
        },
        onExit: () {
          // Gunakan StoryController untuk mengakhiri cerita
          final challengeController = ref.read(
            challengeControllerProvider.notifier,
          );
          challengeController.endChallenge();
          closePopupOverlay();
        },
        onClose: (){
          closePopupOverlay();
          setPopScope(true);
        },
        onGoBack: () => goBackToPreviousOverlay(context),
      ),
    );
  }
}

void endGamePopup(BuildContext context, WidgetRef ref){
    showPopupOverlay(
      context,
      ConfirmPopup(
        title: 'Lanjutkan Permainan?',
        description: 'Keluar Halaman dan Lanjutkan Permainan?',
        confirmLabel: 'Lanjutkan',
        onPrimaryButtonPressed: () {
          final storyController = ref.read(
            storyControllerProvider.notifier,
          );
          storyController.endStory();
          closePopupOverlay();
        },
        onGoBack: () {
          closePopupOverlay(); 
        },
      ),
    );
  }

void exitPopup(BuildContext context) {
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

