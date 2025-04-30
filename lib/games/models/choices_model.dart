class ChoicesModel {
  final String text;
  final String? next;
  final bool? isCorrect;

  ChoicesModel({required this.text, this.next, this.isCorrect});

  factory ChoicesModel.fromJson(Map<String, dynamic> json) {
    return ChoicesModel(
      text: json['text'] as String? ?? '',
      next: json['next'] as String?,
      isCorrect: json['isCorrect'] as bool? ?? false,
    );
  }
}
