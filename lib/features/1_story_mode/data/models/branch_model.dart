import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:timetocode/features/1_story_mode/data/models/dialog_choices.dart';

part 'branch_model.freezed.dart';
part 'branch_model.g.dart';

@freezed
abstract class BranchModel with _$BranchModel {
  const factory BranchModel({
    int? timer,
    String? canon,
    required List<DialogChoices> choices,
  }) = _BranchModel;

  factory BranchModel.fromJson(Map<String, dynamic> json) =>
      _$BranchModelFromJson(json);
}
