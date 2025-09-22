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

  HiveService({
    required this.consequencesBox,
    required this.storyProgressBox,
    required this.challengeProgressBox,
    required this.settingsBox,
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

  Future<void> storySaveConsequences({
    required Map<String, String> consequences,
    bool? isMinigameSuccess,
  }) async {
    Map<String, int> userConsequences = storyGetConsequences() ?? {};
    if (isMinigameSuccess != null) {
      if (isMinigameSuccess) {
        consequences.forEach((key, value) {
          userConsequences[key] = (userConsequences.containsKey(key))
              ? (userConsequences[key]! + int.parse(value))
              : int.parse(value);
        });
      } else {
        consequences.forEach((key, value) {
          userConsequences[key] = (userConsequences.containsKey(key))
              ? (userConsequences[key]! - int.parse(value))
              : -int.parse(value);
        });
      }
    } else {
      consequences.forEach((key, value) {
        if (userConsequences.containsKey(key)) {
          userConsequences[key] = (userConsequences[key]! + int.parse(value));
        } else {
          userConsequences[key] = int.parse(value);
        }
      });
    }

    await consequencesBox.put('current_consequences', userConsequences);
  }

  Map<String, int>? storyGetConsequences() {
    final rawData = consequencesBox.get('current_consequences');
    if (rawData == null) return null;

    final Map<String, int> resultMap = {};
    (rawData as Map).forEach((key, value) {
      resultMap[key.toString()] = int.parse(value.toString());
    });
    return resultMap;
  }

  bool storyCheckConditions(Map<String, String> conditions) {
    Map<String, int>? userConsequences = storyGetConsequences();
    if (userConsequences == null) return true;

    for (var entry in conditions.entries) {
      String key = entry.key;
      String conditionValue = entry.value;

      String operator = '==';
      int requiredValue;

      if (conditionValue.startsWith('>=')) {
        operator = '>=';
        requiredValue = int.parse(conditionValue.substring(2));
      } else if (conditionValue.startsWith('<=')) {
        operator = '<=';
        requiredValue = int.parse(conditionValue.substring(2));
      } else if (conditionValue.startsWith('>')) {
        operator = '>';
        requiredValue = int.parse(conditionValue.substring(1));
      } else if (conditionValue.startsWith('<')) {
        operator = '<';
        requiredValue = int.parse(conditionValue.substring(1));
      } else {
        requiredValue = int.parse(conditionValue);
      }

      int userValue = userConsequences[key] ?? 0;
      bool conditionMet = false;
      switch (operator) {
        case '>=':
          conditionMet = userValue >= requiredValue;
          break;
        case '<=':
          conditionMet = userValue <= requiredValue;
          break;
        case '>':
          conditionMet = userValue > requiredValue;
          break;
        case '<':
          conditionMet = userValue < requiredValue;
          break;
        case '==':
          conditionMet = userValue == requiredValue;
          break;
      }
      if (!conditionMet) {
        return false;
      }
    }

    return true;
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
}
