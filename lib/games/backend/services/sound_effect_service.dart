import 'package:flame_audio/flame_audio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:timetocode/games/backend/providers/shared_preferences_provider.dart';

enum _TypingSoundIntent { playing, paused, disposed }

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
  late AudioPool _submitPool;
  AudioPlayer? _typingAudioPlayer;

  _TypingSoundIntent _desiredIntent = _TypingSoundIntent.disposed;
  bool _isProcessing = false;

  @override
  bool build() {
    _prefs = ref.read(sharedPrefsProvider);
    return _prefs.getBool('musikEfek') ?? true;
  }

  Future<void> initialize() async {
    await FlameAudio.audioCache.load('sfx/typing.wav');

    _buttonClick1Pool = await FlameAudio.createPool(
      'sfx/button-click.wav',
      minPlayers: 1,
      maxPlayers: 2,
    );

    _buttonClick2Pool = await FlameAudio.createPool(
      'sfx/button2-click.wav',
      minPlayers: 1,
      maxPlayers: 2,
    );

    _popClickPool = await FlameAudio.createPool(
      'sfx/pop-click.wav',
      minPlayers: 1,
      maxPlayers: 2,
    );

    _selectClickPool = await FlameAudio.createPool(
      'sfx/select-click.wav',
      minPlayers: 1,
      maxPlayers: 2,
    );

    _negativeClickPool = await FlameAudio.createPool(
      'sfx/negative-click.wav',
      minPlayers: 1,
      maxPlayers: 2,
    );

    _errorClickPool = await FlameAudio.createPool(
      'sfx/error-click.wav',
      minPlayers: 1,
      maxPlayers: 2,
    );

    _correctPool = await FlameAudio.createPool(
      'sfx/correct.wav',
      minPlayers: 1,
      maxPlayers: 2,
    );

    _popupAnswerPool = await FlameAudio.createPool(
      'sfx/popup-answer.wav',
      minPlayers: 1,
      maxPlayers: 2,
    );

    _submitPool = await FlameAudio.createPool(
      'sfx/submit.wav',
      minPlayers: 1,
      maxPlayers: 2,
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

  void playSubmit() {
    if (state) {
      _submitPool.start();
    }
  }

  Future<void> _reconcileState() async {
    if (_isProcessing) return;

    _isProcessing = true;

    while (true) {
      final currentIntent = _desiredIntent;

      _TypingSoundIntent actualState;
      if (_typingAudioPlayer == null) {
        actualState = _TypingSoundIntent.disposed;
      } else if (_typingAudioPlayer!.state == PlayerState.playing) {
        actualState = _TypingSoundIntent.playing;
      } else {
        actualState = _TypingSoundIntent.paused;
      }
      if (actualState == currentIntent) {
        break;
      }
      try {
        if (currentIntent == _TypingSoundIntent.playing) {
          if (_typingAudioPlayer == null) {
            _typingAudioPlayer = await FlameAudio.loop(
              'sfx/typing.wav',
              volume: 2.0,
            );
          } else {
            await _typingAudioPlayer!.resume();
          }
        } else if (currentIntent == _TypingSoundIntent.paused) {
          if (_typingAudioPlayer != null) {
            await _typingAudioPlayer!.pause();
          }
        } else if (currentIntent == _TypingSoundIntent.disposed) {
          if (_typingAudioPlayer != null) {
            await _typingAudioPlayer!.dispose();
            _typingAudioPlayer = null;
          }
        }
      } catch (e) {
        break;
      }
    }

    _isProcessing = false;
  }

  void playTyping() {
    if (!state) return;
    _desiredIntent = _TypingSoundIntent.playing;
    _reconcileState();
  }

  void pauseTyping() {
    _desiredIntent = _TypingSoundIntent.paused;
    _reconcileState();
  }

  void disposeTypingPlayer() {
    _desiredIntent = _TypingSoundIntent.disposed;
    _reconcileState();
  }

  void updateSoundEffectSetting(bool isEnabled) async {
    await _prefs.setBool('musikEfek', isEnabled);
    state = isEnabled;
    if (!isEnabled) disposeTypingPlayer();
  }
}
