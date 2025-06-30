import 'package:timetocode/games/backend/models/challenge/challenge_level_model.dart';

class ChallengeModel {
  final int challengeId;
  final String title;
  final List<ChallengeLevelModel> levels;

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
          (json['levels'] as List<dynamic>)
              .map(
                (lvl) =>
                    ChallengeLevelModel.fromJson(lvl as Map<String, dynamic>),
              )
              .toList(),
    );
  }

  ChallengeLevelModel getLevel(int levelNumber) {
    return levels.firstWhere((lvl) => lvl.levelName == levelNumber);
  }
}
