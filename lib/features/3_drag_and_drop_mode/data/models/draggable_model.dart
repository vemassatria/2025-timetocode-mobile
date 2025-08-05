import 'package:timetocode/features/3_drag_and_drop_mode/data/models/content_component_model.dart';

class DraggableModel {
  final String id;
  final ContentComponentModel content;
  final String? info;

  DraggableModel({required this.id, required this.content, this.info});

  factory DraggableModel.fromJson(Map<String, dynamic> json) {
    return DraggableModel(
      id: json['id'] as String? ?? '',
      content: ContentComponentModel.fromJson(
        json['content'] as Map<String, dynamic>,
      ),
      info: json['info'] as String?,
    );
  }
}
