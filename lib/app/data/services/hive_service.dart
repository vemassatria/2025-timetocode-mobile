import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/adapters.dart';

final hiveProvider = Provider<HiveService>((ref) {
  throw UnimplementedError('HiveService has not been initialized');
});

class HiveService {
  final Box consequencesBox;
  final Box<int> storyProgressBox;
  final Box<int> challengeProgressBox;
  final Box<bool> settingsBox;
  final Box<int> matrixProgressBox;

  HiveService({
    required this.consequencesBox,
    required this.storyProgressBox,
    required this.challengeProgressBox,
    required this.settingsBox,
    required this.matrixProgressBox,
  });

  bool getMusicSetting() {
    return settingsBox.get('musikLatar', defaultValue: true) ?? true;
  }

  Future<void> saveMusicSetting(bool isEnabled) async {
    await settingsBox.put('musikLatar', isEnabled);
  }

  bool getSoundEffectSetting() {
    return settingsBox.get('musikEfek', defaultValue: true) ?? true;
  }

  Future<void> saveSoundEffectSetting(bool isEnabled) async {
    await settingsBox.put('musikEfek', isEnabled);
  }

  Future<void> storySnapShotSaveConsequences(
    int level,
    Map<String, int>? consequences,
  ) async {
    if (consequences == null) return;

    await consequencesBox.put('snapshot_$level', consequences);
  }

  Map<String, int>? storySnapShotGetConsequences(int level) {
    final rawData = consequencesBox.get('snapshot_$level');
    if (rawData == null) return null;

    final Map<String, int> resultMap = {};
    (rawData as Map).forEach((key, value) {
      resultMap[key.toString()] = int.parse(value.toString());
    });
    return resultMap;
  }

  Future<void> storySaveProgress(int level) async {
    await storyProgressBox.put('story_progress', level);
  }

  int storyGetProgress() {
    return storyProgressBox.get('story_progress', defaultValue: 0) ?? 0;
  }

  Future<void> challengeSaveProgress(int level, int stars) async {
    await challengeProgressBox.put(level, stars);
  }

  Map<int, int> challengeGetProgress() {
    return Map<int, int>.from(challengeProgressBox.toMap());
  }

  Future<void> matrixSaveProgress(int level, int stars) async {
    await matrixProgressBox.put(level, stars);
  }

  Map<int, int> matrixGetProgress() {
    return Map<int, int>.from(matrixProgressBox.toMap());
  }
}
