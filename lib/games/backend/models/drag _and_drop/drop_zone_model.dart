import 'package:timetocode/games/backend/models/drag%20_and_drop/content_component_model.dart';
import 'package:timetocode/games/backend/models/drag%20_and_drop/draggable_model.dart';

class DropZoneModel {
  final String id;
  final List<String>? acceptedIds;
  final ContentComponentModel? content;
  DraggableModel? contentDraggable;

  DropZoneModel({required this.id, this.acceptedIds, this.content});

  factory DropZoneModel.fromJson(Map<String, dynamic> json) {
    return DropZoneModel(
      id: json['id'] as String,
      acceptedIds:
          (json['acceptedIds'] as List<dynamic>?)
              ?.map((id) => id as String)
              .toList(),
      content:
          json['content'] != null
              ? ContentComponentModel.fromJson(json['content'])
              : null,
    );
  }
}
