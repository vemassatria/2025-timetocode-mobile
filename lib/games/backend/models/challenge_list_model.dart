import 'package:timetocode/games/backend/models/challenge_model.dart';

class ChallengesListModel {
  final List<ChallengeModel> challenges;

  ChallengesListModel({required this.challenges});

  factory ChallengesListModel.fromJson(Map<String, dynamic> json) {
    return ChallengesListModel(
      challenges:
          (json['challenges'] as List<dynamic>)
              .map(
                (challengeJson) => ChallengeModel.fromJson(
                  challengeJson as Map<String, dynamic>,
                ),
              )
              .toList(),
    );
  }
}
