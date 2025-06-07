class DialogChoices {
  final String text;
  final String next;
  final String nextType;

  DialogChoices({
    required this.text,
    required this.next,
    required this.nextType,
  });

  static DialogChoices fromJson(Map<String, dynamic> c) {
    return DialogChoices(
      text: c['text'] as String,
      next: c['next'] as String,
      nextType: c['nextType'] as String,
    );
  }
}
