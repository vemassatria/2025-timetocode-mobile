import 'package:timetocode/games/backend/models/drag%20_and_drop/content_component_model.dart';

class DraggableModel {
  final String id;
  final ContentComponentModel content;

  DraggableModel({required this.id, required this.content});

  factory DraggableModel.fromJson(Map<String, dynamic> json) {
    return DraggableModel(
      id: json['id'] as String? ?? '',
      content: ContentComponentModel.fromJson(
        json['content'] as Map<String, dynamic>,
      ),
    );
  }
}
