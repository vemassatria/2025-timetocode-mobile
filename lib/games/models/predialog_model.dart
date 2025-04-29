class PreDialogModel {
  final String id;
  final String text;
  final String? next;

  PreDialogModel({required this.id, required this.text, this.next});

  factory PreDialogModel.fromJson(Map<String, dynamic> json) {
    return PreDialogModel(
      id: json['id'] as String? ?? '',
      text: json['text'],
      next: json['next'] as String?,
    );
  }
}
