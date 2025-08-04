class ChoicesModel {
  final String text;
  final String? next;
  final String? nextType;
  final String? nextDifficulty;
  final bool? isCorrect;

  ChoicesModel({
    required this.text,
    this.next,
    this.isCorrect,
    this.nextType,
    this.nextDifficulty,
  });

  factory ChoicesModel.fromJson(Map<String, dynamic> json) {
    return ChoicesModel(
      text: json['text'] as String,
      next: json['next'] as String?,
      nextType: json['nextType'] as String?,
      nextDifficulty: json['nextDifficulty'] as String?,
      isCorrect: json['isCorrect'] as bool?,
    );
  }
}
