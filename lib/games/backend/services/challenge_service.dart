import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:timetocode/games/backend/models/challenge_model.dart';

class ChallengeService {
  Future<ChallengeModel> loadChallenges(String path) async {
    final challengeModel = await rootBundle.loadString(path);
    return compute(_parseChallenges, challengeModel);
  }

  static ChallengeModel _parseChallenges(String jsonString) {
    final jsonList = json.decode(jsonString) as Map<String, dynamic>;
    return ChallengeModel.fromJson(jsonList);
  }
}
