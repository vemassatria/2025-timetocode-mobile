import 'package:timetocode/features/3_drag_and_drop_mode/data/models/drag_and_drop_model.dart';
import 'package:timetocode/features/1_story_mode/data/models/predialog_model.dart';
import 'package:timetocode/features/0_core/models/question_model.dart';

import 'dialog_model.dart';

class StoryModel {
  final int level;
  final String description;
  final String title;
  final String background;
  final String character1;
  final String character2;
  final List<String> character1Images;
  final List<String> character2Images;
  final List<String> ilustrations;
  final List<PreDialogModel>? preDialog;
  final List<DialogModel> dialogs;
  final List<QuestionModel> questions;
  final List<DragAndDropModel>? dragAndDrop;
  final List<String>? summary;
  final String start;
  final String typeStart;
  StoryModel({
    required this.level,
    required this.description,
    required this.title,
    required this.background,
    required this.character1,
    required this.character2,
    required this.character1Images,
    required this.character2Images,
    required this.ilustrations,
    this.preDialog,
    required this.dialogs,
    required this.questions,
    this.dragAndDrop,
    this.summary,
    required this.start,
    required this.typeStart,
  });
  factory StoryModel.fromJson(Map<String, dynamic> json) {
    return StoryModel(
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
      ilustrations:
          (json['ilustration'] as List).map((i) => i as String).toList(),
      questions:
          (json['questions'] as List)
              .map((q) => QuestionModel.fromJson(q as Map<String, dynamic>))
              .toList(),
      dragAndDrop:
          json['drag_and_drop'] != null
              ? (json['drag_and_drop'] as List)
                  .map(
                    (d) => DragAndDropModel.fromJson(d as Map<String, dynamic>),
                  )
                  .toList()
              : null,
      preDialog:
          json['preDialog'] != null
              ? (json['preDialog'] as List)
                  .map(
                    (pd) => PreDialogModel.fromJson(pd as Map<String, dynamic>),
                  )
                  .toList()
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
}
