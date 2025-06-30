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
  late AudioPool _submitPool;
  AudioPlayer? _typingAudioPlayer;

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

  Future<void> playTyping() async {
    if (state) {
      // 1. Selalu hentikan player yang mungkin sedang berjalan sebelumnya.
      // `await` memastikan kita tidak memulai yang baru sebelum yang lama benar-benar berhenti.
      await stopTyping();
      // 2. Pastikan widget masih ada (mounted) sebelum memulai audio baru.
      // Meskipun tidak bisa dicek langsung dari service, logika di widget akan membantu.
      _typingAudioPlayer = await FlameAudio.loop('sfx/typing.wav');
    }
  }

  /// **DIPERBAIKI: Metode stopTyping yang aman dari race condition.**
  Future<void> stopTyping() async {
    // 1. Simpan referensi player ke variabel lokal.
    final player = _typingAudioPlayer;
    // 2. Langsung setel instance di kelas menjadi null. Ini mencegah
    //    panggilan lain (misalnya playTyping) mencoba menghentikan player yang sama lagi.
    _typingAudioPlayer = null;
    // 3. Hentikan player menggunakan variabel lokal.
    //    Operator '?' memastikan tidak ada error jika player sudah null.
    await player?.stop();
  }

  void updateSoundEffectSetting(bool isEnabled) async {
    await _prefs.setBool('musikEfek', isEnabled);
    state = isEnabled;
    if (!isEnabled) await stopTyping();
  }
}
