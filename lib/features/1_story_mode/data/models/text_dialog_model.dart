import 'package:freezed_annotation/freezed_annotation.dart';

part 'text_dialog_model.freezed.dart';
part 'text_dialog_model.g.dart';

@freezed
abstract class TextDialogModel with _$TextDialogModel {
  const factory TextDialogModel({
    required String line,
    required int reactionIndex,
    required int characterIndex,
    int? ilustrationIndex,
  }) = _TextDialogModel;

  factory TextDialogModel.fromJson(Map<String, dynamic> json) =>
      _$TextDialogModelFromJson(json);
}
