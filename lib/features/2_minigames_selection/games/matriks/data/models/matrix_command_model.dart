import 'package:freezed_annotation/freezed_annotation.dart';

part 'matrix_command_model.freezed.dart';
part 'matrix_command_model.g.dart';

@freezed
abstract class MatrixCommandModel with _$MatrixCommandModel {
  const factory MatrixCommandModel({
    required String type, // "loop" or "action"
    int? count,           // Only for "loop"
    required String action, // "up", "down", "left", "right"
  }) = _MatrixCommandModel;

  factory MatrixCommandModel.fromJson(Map<String, dynamic> json) =>
      _$MatrixCommandModelFromJson(json);
}