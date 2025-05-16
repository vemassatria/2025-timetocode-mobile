import 'package:flame_audio/flame_audio.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:just_audio/just_audio.dart' as just;

class MusicService {
  static bool _playingMusikLatar = false;
  // static final just.AudioPlayer _typingPlayer = just.AudioPlayer();
  // static bool _typingInitialized = false;
  // static bool _playingEfekSuara = false;
  static late SharedPreferences _prefs;

  static Future<void> init() async {
    await FlameAudio.bgm.initialize();

    _prefs = await SharedPreferences.getInstance();
    _playingMusikLatar = _prefs.getBool('musikLatar') ?? true;
    // _playingEfekSuara = _prefs.getBool('efekSuara') ?? true;

    if (_playingMusikLatar) {
      await playMainMenuMusic();
    }
  }

  static Future<void> stopMusikLatar() async {
    if (_playingMusikLatar) {
      await FlameAudio.bgm.stop();
      _playingMusikLatar = false;
    }
  }

  static Future<void> switchLevelMusic(int levelIndex) async {
    if (_playingMusikLatar) {
      await FlameAudio.bgm.stop();
      await MusicService.playLevelMusic(levelIndex);
    }
  }

  static Future<void> updateMusikLatar(bool enabled) async {
    _prefs.setBool('musikLatar', enabled);

    if (enabled) {
      _playingMusikLatar = true;
      await playMainMenuMusic();
    } else {
      await stopMusikLatar();
    }
  }

  // static void updateEfekSuara(bool enabled) {
  //   _prefs.setBool('efekSuara', enabled);

  //   if (enabled) {
  //     _playingEfekSuara = true;
  //   } else {
  //     _playingEfekSuara = false;
  //   }
  // }

  // --- SFX BUTTON & EFFECT ---

  // static void sfxButtonClick() {
  //   if (_playingEfekSuara) {
  //     FlameAudio.play('sfx/button2-click.wav');
  //   }
  // }

  // static void sfxButton2Click() {
  //   if (_playingEfekSuara) {
  //     FlameAudio.play('sfx/button-click.wav');
  //   }
  // }

  // static void sfxPopClick() {
  //   if (_playingEfekSuara) {
  //     FlameAudio.play('sfx/pop-click.wav');
  //   }
  // }

  // static void sfxSelectClick() {
  //   if (_playingEfekSuara) {
  //     FlameAudio.play('sfx/select-click.wav');
  //   }
  // }

  // static void sfxNegativeClick() {
  //   if (_playingEfekSuara) {
  //     FlameAudio.play('sfx/negative-click.wav');
  //   }
  // }

  // static void sfxErrorClick() {
  //   if (_playingEfekSuara) {
  //     FlameAudio.play('sfx/error-click.wav');
  //   }
  // }

  // static void sfxPopupAnswer() {
  //   if (_playingEfekSuara) {
  //     FlameAudio.play('sfx/popup-answer.wav');
  //   }
  // }

  // static void sfxCorrect() {
  //   if (_playingEfekSuara) {
  //     FlameAudio.play('sfx/correct.wav');
  //   }
  // }

  // // --- TYPING SOUND ---

  // static Future<void> playTypingSfx() async {
  //   if (!_typingInitialized) {

  //     if (!_playingEfekSuara) return;

  //     await _typingPlayer.setAsset('assets/audio/sfx/typing.ogg');
  //     await _typingPlayer.setLoopMode(just.LoopMode.one);
  //     await _typingPlayer.setSpeed(1.0);
  //     _typingInitialized = true;
  //   }

  //   if (!_typingPlayer.playing) {
  //     try {
  //       await _typingPlayer.play();
  //     } catch (_) {
  //       // silent fail
  //     }
  //   }
  // }

  // static Future<void> stopTypingSfx() async {
  //   if (_typingInitialized) {
  //     await _typingPlayer.stop();
  //   }
  // }

  // static void disposeTypingPlayer() {
  //   _typingPlayer.dispose();
  // }

  // --- MUSIC BY CONTEXT ---

  static Future<void> playCustomMusic(String filename) async {
    if (_playingMusikLatar) {
      await FlameAudio.bgm.stop();
    }

    await FlameAudio.bgm.play('music/$filename', volume: 0.6);
    _playingMusikLatar = true;
  }

  static Future<void> playMainMenuMusic() async {
    if (_playingMusikLatar) {
      await playCustomMusic('main-tabs.ogg');
    }
  }

  static Future<void> playLevelMusic(int levelIndex) async {
    if (!_playingMusikLatar) return;

    if (_playingMusikLatar) {
      await FlameAudio.bgm.stop();
      _playingMusikLatar = false;
    }

    switch (levelIndex) {
      case 0:
        await playCustomMusic('warung-kating.ogg');
        break;
      case 1:
        await playCustomMusic('home.ogg');
        break;
      case 2:
      case 3:
        await playCustomMusic('cafe.ogg');
        break;
      case 4:
        await playCustomMusic('lab.ogg');
        break;
      case 5:
        await playCustomMusic('cafe-crush.ogg');
        break;
      default:
        await playCustomMusic('bgm1.ogg');
    }
  }
}
