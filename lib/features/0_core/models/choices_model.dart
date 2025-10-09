import 'package:freezed_annotation/freezed_annotation.dart';

part 'choices_model.freezed.dart';
part 'choices_model.g.dart';

@freezed
abstract class ChoicesModel with _$ChoicesModel {
  const factory ChoicesModel({
    required String text,
    required String? next,
    required String? nextType,
    required bool isCorrect,
  }) = _ChoicesModel;

  factory ChoicesModel.fromJson(Map<String, dynamic> json) =>
      _$ChoicesModelFromJson(json);
}
