import 'dialog_model.dart';

class LevelModel {
  final int level;
  final List<DialogModel> dialogs;
  LevelModel({required this.level, required this.dialogs});
  factory LevelModel.fromJson(Map<String, dynamic> json) {
    return LevelModel(
      level: json['level'] as int,
      dialogs:
          (json['dialogs'] as List)
              .map((d) => DialogModel.fromJson(d as Map<String, dynamic>))
              .toList(),
    );
  }
}
