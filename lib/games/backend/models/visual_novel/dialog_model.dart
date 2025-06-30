import 'package:timetocode/games/backend/models/visual_novel/dialog_choices.dart';
import 'package:timetocode/games/backend/models/visual_novel/text_dialog_model.dart';

class DialogModel {
  final String id;
  final List<TextDialogModel> dialogue;
  final String next;
  final String nextType;
  final List<DialogChoices>? choices;

  DialogModel({
    required this.id,
    required this.dialogue,
    required this.next,
    required this.nextType,
    this.choices,
  });

  factory DialogModel.fromJson(Map<String, dynamic> json) {
    return DialogModel(
      id: json['id'] as String? ?? '',
      dialogue:
          (json['text'] as List)
              .map((d) => TextDialogModel.fromJson(d as Map<String, dynamic>))
              .toList(),

      next: json['next'] as String? ?? '',
      nextType: json['nextType'] as String? ?? '',
      choices:
          json['choices'] != null
              ? (json['choices'] as List)
                  .map((c) => DialogChoices.fromJson(c as Map<String, dynamic>))
                  .toList()
              : null,
    );
  }

  String getTextDialog(int index) {
    return dialogue[index].line;
  }

  int getReactionIndex(int index) {
    return dialogue[index].reactionIndex;
  }

  int getCharacterIndex(int index) {
    return dialogue[index].characterIndex;
  }

  int getDialogLength() {
    return dialogue.length;
  }

  int? getIlustrationIndex(int index) {
    return dialogue[index].ilustration;
  }
}
