import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:timetocode/features/1_story_mode/data/models/story_model.dart';

class StoryLoadService {
  Future<List<StoryModel>> loadAllLevels(String path) async {
    final json = await rootBundle.loadString(path);
    return compute(_parseLevels, json);
  }

  static List<StoryModel> _parseLevels(String jsonString) {
    final jsonList = json.decode(jsonString) as Map<String, dynamic>;
    return (jsonList['levels'] as List)
        .map((level) => StoryModel.fromJson(level as Map<String, dynamic>))
        .toList();
  }
}
