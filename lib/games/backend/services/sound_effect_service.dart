import 'package:flame_audio/flame_audio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:timetocode/games/backend/providers/shared_preferences_provider.dart';

class SoundEffectService extends Notifier<bool> {
  late SharedPreferences _prefs;

  late AudioPool _buttonClick1Pool;
  late AudioPool _buttonClick2Pool;
  late AudioPool _popClickPool;
  late AudioPool _selectClickPool;
  late AudioPool _negativeClickPool;
  late AudioPool _errorClickPool;
  late AudioPool _correctPool;
  late AudioPool _popupAnswerPool;

  @override
  bool build() {
    _prefs = ref.read(sharedPrefsProvider);
    return _prefs.getBool('musikEfek') ?? true;
  }

  Future<void> initialize() async {
    _buttonClick1Pool = await FlameAudio.createPool(
      'sfx/button-click.wav',
      minPlayers: 1,
      maxPlayers: 3,
    );

    _buttonClick2Pool = await FlameAudio.createPool(
      'sfx/button2-click.wav',
      minPlayers: 1,
      maxPlayers: 3,
    );

    _popClickPool = await FlameAudio.createPool(
      'sfx/pop-click.wav',
      minPlayers: 1,
      maxPlayers: 3,
    );

    _selectClickPool = await FlameAudio.createPool(
      'sfx/select-click.wav',
      minPlayers: 1,
      maxPlayers: 3,
    );

    _negativeClickPool = await FlameAudio.createPool(
      'sfx/negative-click.wav',
      minPlayers: 1,
      maxPlayers: 3,
    );

    _errorClickPool = await FlameAudio.createPool(
      'sfx/error-click.wav',
      minPlayers: 1,
      maxPlayers: 3,
    );

    _correctPool = await FlameAudio.createPool(
      'sfx/correct.wav',
      minPlayers: 1,
      maxPlayers: 3,
    );

    _popupAnswerPool = await FlameAudio.createPool(
      'sfx/popup-answer.wav',
      minPlayers: 1,
      maxPlayers: 3,
    );
  }

  void playButtonClick1() {
    if (state) {
      _buttonClick1Pool.start();
    }
  }

  void playButtonClick2() {
    if (state) {
      _buttonClick2Pool.start();
    }
  }

  void playPopClick() {
    if (state) {
      _popClickPool.start();
    }
  }

  void playSelectClick() {
    if (state) {
      _selectClickPool.start();
    }
  }

  void playNegativeClick() {
    if (state) {
      _negativeClickPool.start();
    }
  }

  void playErrorClick() {
    if (state) {
      _errorClickPool.start();
    }
  }

  void playCorrect() {
    if (state) {
      _correctPool.start();
    }
  }

  void playPopupAnswer() {
    if (state) {
      _popupAnswerPool.start();
    }
  }

  void updateSoundEffectSetting(bool isEnabled) async {
    await _prefs.setBool('musikEfek', isEnabled);
    state = isEnabled;
  }
}
