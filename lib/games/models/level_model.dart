import 'dialog_model.dart';

class LevelModel {
  final int level;
  final PreDialogModel? preDialog;
  final List<DialogModel> dialogs;
  LevelModel({required this.level, this.preDialog, required this.dialogs});
  factory LevelModel.fromJson(Map<String, dynamic> json) {
    return LevelModel(
      level: json['level'] as int,
      preDialog:
          json['preDialog'] != null
              ? PreDialogModel.fromJson(
                json['preDialog'] as Map<String, dynamic>,
              )
              : null,
      dialogs:
          (json['dialogs'] as List)
              .map((d) => DialogModel.fromJson(d as Map<String, dynamic>))
              .toList(),
    );
  }
}
