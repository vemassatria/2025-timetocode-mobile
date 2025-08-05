import 'package:flame_audio/flame_audio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:timetocode/app/data/providers/shared_preferences_provider.dart';

final musicServiceProvider = NotifierProvider<MusicService, bool>(
  MusicService.new,
);

class MusicService extends Notifier<bool> {
  late SharedPreferences _prefs;

  @override
  bool build() {
    _prefs = ref.read(sharedPrefsProvider);
    return _prefs.getBool('musikLatar') ?? true;
  }

  Future<void> initialize() async {
    await FlameAudio.bgm.initialize();

    if (state) {
      await playMainMenuMusic();
    }
  }

  Future<void> _play(String filename) async {
    if (state) {
      await FlameAudio.bgm.play('music/$filename');
    }
  }

  Future<void> stopMusic() async {
    await FlameAudio.bgm.stop();
  }

  Future<void> playMainMenuMusic() async {
    await _play('main-tabs.ogg');
  }

  Future<void> playLevelMusic(int levelIndex) async {
    switch (levelIndex) {
      case 0:
        await _play('warung-kating.ogg');
        break;
      case 1:
        await _play('home.ogg');
        break;
      case 2:
      case 3:
        await _play('cafe.ogg');
        break;
      case 4:
        await _play('lab.ogg');
        break;
      case 5:
        await _play('cafe-crush.ogg');
        break;
      default:
        await _play('bgm1.ogg');
    }
  }

  Future<void> updateMusicSetting(bool isEnabled) async {
    await _prefs.setBool('musikLatar', isEnabled);
    state = isEnabled;
    if (isEnabled) {
      await playMainMenuMusic();
    } else {
      await stopMusic();
    }
  }
}
