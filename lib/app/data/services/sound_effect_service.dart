import 'package:flame_audio/flame_audio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:timetocode/app/data/providers/shared_preferences_provider.dart';

final soundEffectServiceProvider = NotifierProvider<SoundEffectService, bool>(
  SoundEffectService.new,
);

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
  late AudioPool _victoryPool;
  late AudioPool _defeatPool;
  AudioPlayer? _typingAudioPlayer;

  int _typingOperationId = 0;

  @override
  bool build() {
    _prefs = ref.read(sharedPrefsProvider);
    return _prefs.getBool('musikEfek') ?? true;
  }

  Future<void> initialize() async {
    final futures = [
      FlameAudio.audioCache.load('sfx/typing.wav'),
      FlameAudio.createPool(
        'sfx/button-click.wav',
        minPlayers: 1,
        maxPlayers: 2,
      ),
      FlameAudio.createPool(
        'sfx/button2-click.wav',
        minPlayers: 1,
        maxPlayers: 2,
      ),
      FlameAudio.createPool('sfx/pop-click.wav', minPlayers: 1, maxPlayers: 2),
      FlameAudio.createPool(
        'sfx/select-click.wav',
        minPlayers: 1,
        maxPlayers: 2,
      ),
      FlameAudio.createPool(
        'sfx/negative-click.wav',
        minPlayers: 1,
        maxPlayers: 2,
      ),
      FlameAudio.createPool(
        'sfx/error-click.wav',
        minPlayers: 1,
        maxPlayers: 2,
      ),
      FlameAudio.createPool('sfx/correct.wav', minPlayers: 1, maxPlayers: 2),
      FlameAudio.createPool(
        'sfx/popup-answer.wav',
        minPlayers: 1,
        maxPlayers: 2,
      ),
      FlameAudio.createPool('sfx/submit.wav', minPlayers: 1, maxPlayers: 2),
      FlameAudio.createPool('sfx/victory.mp3', minPlayers: 1, maxPlayers: 2),
      FlameAudio.createPool('sfx/defeat.mp3', minPlayers: 1, maxPlayers: 2),
    ];

    final results = await Future.wait(futures);
    _buttonClick1Pool = results[1] as AudioPool;
    _buttonClick2Pool = results[2] as AudioPool;
    _popClickPool = results[3] as AudioPool;
    _selectClickPool = results[4] as AudioPool;
    _negativeClickPool = results[5] as AudioPool;
    _errorClickPool = results[6] as AudioPool;
    _correctPool = results[7] as AudioPool;
    _popupAnswerPool = results[8] as AudioPool;
    _submitPool = results[9] as AudioPool;
    _victoryPool = results[10] as AudioPool;
    _defeatPool = results[11] as AudioPool;
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

  void playVictory() {
    if (state) {
      _victoryPool.start();
    }
  }

  void playDefeat() {
    if (state) {
      _defeatPool.start();
    }
  }

  Future<void> playTyping() async {
    if (!state) return;
    final operationId = ++_typingOperationId;
    if (_typingAudioPlayer == null) {
      _typingAudioPlayer = await FlameAudio.loop('sfx/typing.wav');
    } else {
      await _typingAudioPlayer!.resume();
    }
    if (operationId != _typingOperationId) {
      await _typingAudioPlayer?.pause();
    }
  }

  Future<void> pauseTyping() async {
    _typingOperationId++;
    await _typingAudioPlayer?.pause();
  }

  Future<void> disposeTypingPlayer() async {
    await _typingAudioPlayer?.dispose();
    _typingOperationId = 0;
    _typingAudioPlayer = null;
  }

  void updateSoundEffectSetting(bool isEnabled) async {
    await _prefs.setBool('musikEfek', isEnabled);
    state = isEnabled;
    if (!isEnabled) disposeTypingPlayer();
  }
}
