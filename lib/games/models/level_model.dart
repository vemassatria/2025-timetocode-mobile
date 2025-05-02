import 'package:timetocode/games/models/predialog_model.dart';
import 'package:timetocode/games/models/question_model.dart';

import 'dialog_model.dart';

class LevelModel {
  final int level;
  final String description;
  final String title;
  final String background;
  final String character1;
  final String character2;
  final List<String> character1Images;
  final List<String> character2Images;
  final PreDialogModel? preDialog;
  final List<DialogModel> dialogs;
  final List<QuestionModel> questions;
  final List<String>? summary;
  final String start;
  final String typeStart;
  LevelModel({
    required this.level,
    required this.description,
    required this.title,
    required this.background,
    required this.character1,
    required this.character2,
    required this.character1Images,
    required this.character2Images,
    this.preDialog,
    required this.dialogs,
    required this.questions,
    this.summary,
    required this.start,
    required this.typeStart,
  });
  factory LevelModel.fromJson(Map<String, dynamic> json) {
    return LevelModel(
      level: json['level'] as int,
      description: json['description'] as String? ?? '',
      title: json['title'] as String? ?? '',
      background: json['background'] as String? ?? '',
      character1: json['character1_name'] as String? ?? '',
      character2: json['character2_name'] as String? ?? '',
      character1Images:
          (json['character1_reaction'] as List)
              .map((i) => i as String)
              .toList(),
      character2Images:
          (json['character2_reaction'] as List)
              .map((i) => i as String)
              .toList(),
      questions:
          (json['questions'] as List)
              .map((q) => QuestionModel.fromJson(q as Map<String, dynamic>))
              .toList(),
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
      summary:
          json['rangkuman'] != null
              ? (json['rangkuman'] as List).map((s) => s as String).toList()
              : null,
      start: json['start'] as String? ?? '',
      typeStart: json['typeStart'] as String? ?? '',
    );
  }

  DialogModel getDialog(String id) {
    return dialogs.firstWhere((dialog) => dialog.id == id);
  }
}
