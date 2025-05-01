import 'package:flame_audio/flame_audio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MusicService {
  static bool _playingMusikLatar = false;

  static Future<void> init() async {
    await FlameAudio.bgm.initialize();

    final prefs = await SharedPreferences.getInstance();
    bool _musikLatar = prefs.getBool('musikLatar') ?? true;

    if (_musikLatar) {
      await playMusikLatar();
    } 
  
  }

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
      await playMusikLatar();
    } else {
      await stopMusikLatar();
    }
  }

  static Future<void> sfxButtonClick() async {
    final prefs = await SharedPreferences.getInstance();
    bool playEfekSuara = prefs.getBool('efekSuara') ?? true;

    if (playEfekSuara) {
      FlameAudio.play('sfx/button2-click.wav');
    }
  }

  static Future<void> sfxPopClick() async {
    final prefs = await SharedPreferences.getInstance();
    bool playEfekSuara = prefs.getBool('efekSuara') ?? true;

    if (playEfekSuara) {
      FlameAudio.play('sfx/pop-click.wav');
    }
  }

  static Future<void> sfxSelectClick() async {
    final prefs = await SharedPreferences.getInstance();
    bool playEfekSuara = prefs.getBool('efekSuara') ?? true;

    if (playEfekSuara) {
      FlameAudio.play('sfx/select-click.wav');
    }
  }

  static Future<void> sfxNegativeClick() async {
    final prefs = await SharedPreferences.getInstance();
    bool playEfekSuara = prefs.getBool('efekSuara') ?? true;

    if (playEfekSuara) {
      FlameAudio.play('sfx/negative-click.wav');
    }
  }
}
