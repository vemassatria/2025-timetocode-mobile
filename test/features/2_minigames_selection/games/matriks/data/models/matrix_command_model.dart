import 'package:freezed_annotation/freezed_annotation.dart';

part 'matrix_command_model.freezed.dart';
part 'matrix_command_model.g.dart';

@freezed
abstract class MatrixCommandModel with _$MatrixCommandModel {
  const factory MatrixCommandModel({
    required String command, // "UP", "DOWN", "LEFT", "RIGHT"
    required int value,     // 1, 2, 5, 10, dll.
  }) = _MatrixCommandModel;

  factory MatrixCommandModel.fromJson(Map<String, dynamic> json) =>
      _$MatrixCommandModelFromJson(json);
}