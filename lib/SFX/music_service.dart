import 'package:flame_audio/flame_audio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:just_audio/just_audio.dart' as just;

class MusicService {
  static bool _playingMusikLatar = false;
  static final just.AudioPlayer _typingPlayer = just.AudioPlayer();
  static bool _typingInitialized = false;
  static bool _playingEfekSuara = false;

  static Future<void> init() async {
    await FlameAudio.bgm.initialize();

    final prefs = await SharedPreferences.getInstance();
    bool _musikLatar = prefs.getBool('musikLatar') ?? true;
    _playingEfekSuara = prefs.getBool('efekSuara') ?? true;

    if (_musikLatar) {
      await playMainMenuMusic();
    }
  }

  // --- MUSIC LATAR BELAKANG ---

  static Future<void> playMusikLatar() async {
    if (!_playingMusikLatar) {
      await FlameAudio.bgm.play('music/bgm1.ogg', volume: 0.6);
      _playingMusikLatar = true;
    }
  }

  static Future<void> stopMusikLatar() async {
    if (_playingMusikLatar) {
      await FlameAudio.bgm.stop();
      _playingMusikLatar = false;
    }
  }

  static Future<void> updateMusikLatar(bool enabled) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('musikLatar', enabled);

    if (enabled) {
      await playMainMenuMusic();
    } else {
      await stopMusikLatar();
    }
  }

  // --- SFX BUTTON & EFFECT ---

  static void sfxButtonClick() {
    if (_playingEfekSuara) {
      FlameAudio.play('sfx/button2-click.wav');
    }
  }

  static void sfxButton2Click() {
    if (_playingEfekSuara) {
      FlameAudio.play('sfx/button-click.wav');
    }
  }

  static void sfxPopClick() {
    if (_playingEfekSuara) {
      FlameAudio.play('sfx/pop-click.wav');
    }
  }

  static void sfxSelectClick() {
    if (_playingEfekSuara) {
      FlameAudio.play('sfx/select-click.wav');
    }
  }

  static void sfxNegativeClick() {
    if (_playingEfekSuara) {
      FlameAudio.play('sfx/negative-click.wav');
    }
  }

  static void sfxErrorClick() {
    if (_playingEfekSuara) {
      FlameAudio.play('sfx/error-click.wav');
    }
  }

  static void sfxPopupAnswer() {
    if (_playingEfekSuara) {
      FlameAudio.play('sfx/popup-answer.wav');
    }
  }

  static void sfxCorrect() {
    if (_playingEfekSuara) {
      FlameAudio.play('sfx/correct.wav');
    }
  }

  // --- TYPING SOUND ---

  static Future<void> playTypingSfx() async {
    if (!_typingInitialized) {
      final prefs = await SharedPreferences.getInstance();
      bool playEfekSuara = prefs.getBool('efekSuara') ?? true;

      if (!playEfekSuara) return;

      await _typingPlayer.setAsset('assets/audio/sfx/typing.ogg');
      await _typingPlayer.setLoopMode(just.LoopMode.one);
      await _typingPlayer.setSpeed(1.0);
      _typingInitialized = true;
    }

    if (!_typingPlayer.playing) {
      try {
        await _typingPlayer.play();
      } catch (_) {
        // silent fail
      }
    }
  }

  static Future<void> stopTypingSfx() async {
    if (_typingInitialized) {
      await _typingPlayer.stop();
    }
  }

  static void disposeTypingPlayer() {
    _typingPlayer.dispose();
  }

  // --- MUSIC BY CONTEXT ---

  static Future<void> playCustomMusic(String filename) async {
    if (_playingMusikLatar) {
      await FlameAudio.bgm.stop();
    }

    await FlameAudio.bgm.play('music/$filename', volume: 0.6);
    _playingMusikLatar = true;
  }

  static Future<void> playMainMenuMusic() async {
    final prefs = await SharedPreferences.getInstance();
    bool _musikLatar = prefs.getBool('musikLatar') ?? true;
    if (_musikLatar) {
      await playCustomMusic('main-tabs.ogg');
    }
  }

  static Future<void> playLevelMusic(int levelIndex) async {
    final prefs = await SharedPreferences.getInstance();
    bool _musikLatar = prefs.getBool('musikLatar') ?? true;
    if (!_musikLatar) return;

    if (_playingMusikLatar) {
      await FlameAudio.bgm.stop();
      _playingMusikLatar = false;
    }

    switch (levelIndex) {
      case 0:
        await playCustomMusic('cafe.ogg');
        break;
      case 1:
        await playCustomMusic('home.ogg');
        break;
      case 2:
        await playCustomMusic('bgm1.ogg');
        break;
      default:
        await playCustomMusic('bgm1.ogg');
    }
  }
}
