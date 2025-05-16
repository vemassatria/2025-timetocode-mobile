class TextDialogModel {
  final String line;
  final int reactionIndex;
  final int characterIndex;

  TextDialogModel({
    required this.line,
    required this.reactionIndex,
    required this.characterIndex,
  });

  factory TextDialogModel.fromJson(Map<String, dynamic> json) {
    return TextDialogModel(
      line: json['line'] as String? ?? '',
      reactionIndex: json['reaction_index'] as int? ?? 0,
      characterIndex: json['speaker'] as int? ?? 1,
    );
  }
}
