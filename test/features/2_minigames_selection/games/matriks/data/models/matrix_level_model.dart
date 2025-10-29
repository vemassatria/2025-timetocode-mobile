import 'package:freezed_annotation/freezed_annotation.dart';
import 'matrix_command_model.dart';

part 'matrix_level_model.freezed.dart';
part 'matrix_level_model.g.dart';

@freezed
abstract class MatrixLevelModel with _$MatrixLevelModel {
  factory MatrixLevelModel({
    required int levelId,
    required String questionCode,
    required List<List<int>> initialMatrix,
    required List<List<int>> goalMatrix,
    required List<MatrixCommandModel> commands,
  }) = _MatrixLevelModel;

  factory MatrixLevelModel.fromJson(Map<String, dynamic> json) =>
      _$MatrixLevelModelFromJson(json);
}