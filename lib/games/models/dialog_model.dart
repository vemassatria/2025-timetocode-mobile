import 'package:timetocode/games/models/text_dialog_model.dart';

class DialogModel {
  final String id;
  final List<TextDialogModel> dialogue;
  final String next;
  final String nextType;

  DialogModel({
    required this.id,
    required this.dialogue,
    required this.next,
    required this.nextType,
  });

  factory DialogModel.fromJson(Map<String, dynamic> json) {
    if (json['dialogs'] == null || json['dialogs'] is! List) {
      print('Error: Invalid or missing "dialogs" field in JSON.');
    }

    return DialogModel(
      id: json['id'] as String? ?? '',
      dialogue:
          (json['dialogs'] as List<dynamic>?)
              ?.map((d) => TextDialogModel.fromJson(d as Map<String, dynamic>))
              .toList() ??
          [],
      next: json['next'] as String? ?? '',
      nextType: json['nextType'] as String? ?? '',
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
}
