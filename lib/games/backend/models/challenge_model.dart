import 'package:timetocode/games/backend/models/level_model.dart';

class ChallengeModel {
  final int challengeId;
  final String title;
  final List<LevelModel> levels;

  ChallengeModel({
    required this.challengeId,
    required this.title,
    required this.levels,
  });

  factory ChallengeModel.fromJson(Map<String, dynamic> json) {
    return ChallengeModel(
      challengeId: json['challenge_id'],
      title: json['title'],
      levels:
          (json['levels'] as List)
              .map((lvl) => LevelModel.fromJson(lvl as Map<String, dynamic>))
              .toList(),
    );
  }

  LevelModel getLevel(int levelNumber) {
    return levels.firstWhere((lvl) => lvl.level == levelNumber);
  }
}
