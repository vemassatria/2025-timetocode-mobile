import 'package:freezed_annotation/freezed_annotation.dart';
import 'matrix_level_model.dart';

part 'matrix_question_bank_model.freezed.dart';
part 'matrix_question_bank_model.g.dart';

@freezed
abstract class MatrixQuestionBankModel with _$MatrixQuestionBankModel {
  factory MatrixQuestionBankModel({
    required List<MatrixLevelModel> level1,
    required List<MatrixLevelModel> level2,
    required List<MatrixLevelModel> level3,
    required List<MatrixLevelModel> level4,
    required List<MatrixLevelModel> level5,
  }) = _MatrixQuestionBankModel;

  factory MatrixQuestionBankModel.fromJson(Map<String, dynamic> json) =>
      _$MatrixQuestionBankModelFromJson(json);
}