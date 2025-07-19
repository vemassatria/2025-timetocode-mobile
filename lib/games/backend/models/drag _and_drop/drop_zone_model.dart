import 'package:timetocode/games/backend/models/drag%20_and_drop/content_component_model.dart';

class DropZoneModel {
  final List<String>? acceptedIds;
  final ContentComponentModel? content;
  String? contentId;

  DropZoneModel({this.acceptedIds, this.content});

  factory DropZoneModel.fromJson(Map<String, dynamic> json) {
    return DropZoneModel(
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
