import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:timetocode/features/2_minigames_selection/games/matriks/data/models/matrix_level_model.dart';

class MatrixLoadService {
  Future<List<MatrixLevelModel>> loadAllLevels(String path) async {
    final jsonString = await rootBundle.loadString(path);
    return compute(_parseLevels, jsonString);
  }

  static List<MatrixLevelModel> _parseLevels(String jsonString) {
    final List<dynamic> jsonList = json.decode(jsonString)['levels'];
    return jsonList
        .map((levelJson) => MatrixLevelModel.fromJson(levelJson as Map<String, dynamic>))
        .toList();
  }
}