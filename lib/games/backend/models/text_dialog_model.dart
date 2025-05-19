class TextDialogModel {
  final String line;
  final int reactionIndex;
  final int characterIndex;
  final String? ilustration;

  TextDialogModel({
    required this.line,
    required this.reactionIndex,
    required this.characterIndex,
    this.ilustration,
  });

  factory TextDialogModel.fromJson(Map<String, dynamic> json) {
    return TextDialogModel(
      line: json['line'] as String? ?? '',
      reactionIndex: json['reaction_index'] as int? ?? 0,
      characterIndex: json['speaker'] as int? ?? 1,
      ilustration: json['ilustration'] as String?,
    );
  }
}
