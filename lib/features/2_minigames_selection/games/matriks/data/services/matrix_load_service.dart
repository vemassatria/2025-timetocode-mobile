import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:timetocode/features/2_minigames_selection/games/matriks/data/models/matrix_question_bank_model.dart';

class MatrixLoadService {
  Future<MatrixQuestionBankModel> loadQuestionBank(String path) async {
    final jsonString = await rootBundle.loadString(path);
    return compute(_parseBank, jsonString);
  }

  static MatrixQuestionBankModel _parseBank(String jsonString) {
    final Map<String, dynamic> jsonMap = json.decode(jsonString);
    
    return MatrixQuestionBankModel.fromJson(jsonMap);
  }
}