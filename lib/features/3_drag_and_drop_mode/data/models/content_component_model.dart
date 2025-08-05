class ContentComponentModel {
  final String type;
  final String value;

  ContentComponentModel({required this.type, required this.value});

  factory ContentComponentModel.fromJson(Map<String, dynamic> json) {
    return ContentComponentModel(
      type: json['type'] as String? ?? '',
      value: json['value'] as String? ?? '',
    );
  }
}
