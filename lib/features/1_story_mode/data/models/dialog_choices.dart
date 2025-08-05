import 'package:freezed_annotation/freezed_annotation.dart';

part 'dialog_choices.freezed.dart';
part 'dialog_choices.g.dart';

@freezed
abstract class DialogChoices with _$DialogChoices {
  const factory DialogChoices({
    required String text,
    required String next,
    required String nextType,
  }) = _DialogChoices;

  factory DialogChoices.fromJson(Map<String, dynamic> json) =>
      _$DialogChoicesFromJson(json);
}
