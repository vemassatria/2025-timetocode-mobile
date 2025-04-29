class ChoicesModel {
  final String text;
  final String? next;

  ChoicesModel({required this.text, this.next});

  factory ChoicesModel.fromJson(Map<String, dynamic> json) {
    return ChoicesModel(
      text: json['text'] as String? ?? '',
      next: json['next'] as String?,
    );
  }
}
