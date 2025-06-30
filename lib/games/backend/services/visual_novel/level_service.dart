import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:timetocode/games/backend/models/visual_novel/level_model.dart';

class LevelService {
  Future<List<LevelModel>> loadAllLevels(String path) async {
    final json = await rootBundle.loadString(path);
    return compute(_parseLevels, json);
  }

  static List<LevelModel> _parseLevels(String jsonString) {
    final jsonList = json.decode(jsonString) as Map<String, dynamic>;
    return (jsonList['levels'] as List)
        .map((level) => LevelModel.fromJson(level as Map<String, dynamic>))
        .toList();
  }
}
