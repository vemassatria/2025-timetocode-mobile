import 'package:flame_audio/flame_audio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MusicService {
  static bool _playingMusikLatar = false;
  static bool _playingEfekSuara = false;

  static Future<void> init() async {
    await FlameAudio.bgm.initialize();

    final prefs = await SharedPreferences.getInstance();
    bool _musikLatar = prefs.getBool('musikLatar') ?? true;
    bool _efekSuara = prefs.getBool('efekSuara') ?? true;

    if (_musikLatar) {
      await playMusikLatar();
    } else if (_efekSuara){
      // await playEfekSuara();
    }
  }

  static Future<void> playMusikLatar() async {
    if (!_playingMusikLatar) {
      await FlameAudio.bgm.play('music/bgm1.ogg');
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
      await playMusikLatar();
    } else {
      await stopMusikLatar();
    }
  }

  static Future<void> playEfekSuara() async {
    if (!_playingEfekSuara) {
      //await FlameAudio.bgm.play('music/bg_music1.mp3');
      _playingEfekSuara = true;
    }
  }

  static Future<void> stopEfekSuara() async {
    if (_playingEfekSuara) {
      //await FlameAudio.bgm.stop();
      _playingEfekSuara = false;
    }
  }

  static Future<void> updateEfekSuara(bool enabled) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('efekSuara', enabled);

    if (enabled) {
      await playEfekSuara();
    } else {
      await stopEfekSuara();
    }
  }
}
