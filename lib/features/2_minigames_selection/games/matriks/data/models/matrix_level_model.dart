import 'package:freezed_annotation/freezed_annotation.dart';
import 'matrix_command_model.dart';

part 'matrix_level_model.freezed.dart';
part 'matrix_level_model.g.dart';

@freezed
abstract class MatrixLevelModel with _$MatrixLevelModel {
  const factory MatrixLevelModel({
    required int levelId,
    required String code,
    required int initialPointerPosition,
    required int targetPointerPosition,
    required List<MatrixCommandModel> commands,
  }) = _MatrixLevelModel;

  factory MatrixLevelModel.fromJson(Map<String, dynamic> json) =>
      _$MatrixLevelModelFromJson(json);
}