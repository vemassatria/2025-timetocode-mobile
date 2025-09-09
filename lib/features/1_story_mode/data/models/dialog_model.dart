import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:timetocode/features/1_story_mode/data/models/branch_model.dart';
import 'package:timetocode/features/1_story_mode/data/models/text_dialog_model.dart';

part 'dialog_model.freezed.dart';
part 'dialog_model.g.dart';

@freezed
abstract class DialogModel with _$DialogModel {
  const factory DialogModel({
    required String id,
    Map<String, String>? conditions,
    required int backgroundIndex,
    required List<TextDialogModel> dialogs,
    String? next,
    String? nextType,
    BranchModel? branch,
  }) = _DialogModel;

  factory DialogModel.fromJson(Map<String, dynamic> json) =>
      _$DialogModelFromJson(json);
}
