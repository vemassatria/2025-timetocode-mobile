import 'package:freezed_annotation/freezed_annotation.dart';

part 'predialog_model.freezed.dart';
part 'predialog_model.g.dart';

@freezed
abstract class PreDialogModel with _$PreDialogModel {
  const factory PreDialogModel({
    required String id,
    required String text,
    required String next,
    required String nextType,
  }) = _PreDialogModel;

  factory PreDialogModel.fromJson(Map<String, dynamic> json) =>
      _$PreDialogModelFromJson(json);
}
