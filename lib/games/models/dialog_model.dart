class DialogModel {
  final String id;
  final String? character1; // Bisa null
  final String? character2; // Bisa null
  final List<String> text;
  final String? next; // Bisa null

  DialogModel({
    required this.id,
    this.character1,
    this.character2,
    required this.text,
    this.next,
  });

  factory DialogModel.fromJson(Map<String, dynamic> json) {
    // Handle 'text' (String atau List)
    dynamic textData = json['text'];
    List<String> parsedText = [];
    if (textData is String) {
      parsedText = [textData];
    } else if (textData is List<dynamic>) {
      parsedText = List<String>.from(textData);
    }

    return DialogModel(
      id: json['id'] as String? ?? '', // Default empty string jika null
      character1: json['character1'] as String?,
      character2: json['character2'] as String?,
      text: parsedText,
      next: json['next'] as String?,
    );
  }
}

class PreDialogModel {
  final String id;
  final String text;
  final String? next; // Bisa null

  PreDialogModel({required this.id, required this.text, this.next});

  factory PreDialogModel.fromJson(Map<String, dynamic> json) {
    return PreDialogModel(
      id: json['id'] as String? ?? '',
      text: json['text'],
      next: json['next'] as String?,
    );
  }
}
