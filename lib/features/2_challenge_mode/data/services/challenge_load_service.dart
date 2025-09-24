import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:timetocode/features/2_challenge_mode/data/models/challenges_list_model.dart';
import 'package:timetocode/features/2_challenge_mode/data/models/challenge_model.dart';

class ChallengeLoadService {
  Future<ChallengeModel> loadChallenges(String path) async {
    final challengeModel = await rootBundle.loadString(path);
    return compute(_parseChallenges, challengeModel);
  }

  static ChallengeModel _parseChallenges(String jsonString) {
    final jsonList = json.decode(jsonString) as Map<String, dynamic>;
    final listChallenge = ChallengesListModel.fromJson(jsonList);
    return listChallenge.challenges.first;
  }
}
