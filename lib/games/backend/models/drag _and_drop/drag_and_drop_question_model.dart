import 'package:timetocode/games/backend/models/drag%20_and_drop/drop_zone_model.dart';

import 'draggable_model.dart';

class DragAndDropModel {
  final String id;
  final String instruction;
  final String? scaffoldCode;
  final List<DraggableModel> draggableOptions;
  final Map<String, DropZoneModel>? dropZones;
  final List<String> correctSequence;

  DragAndDropModel({
    required this.id,
    required this.instruction,
    this.scaffoldCode,
    required this.draggableOptions,
    this.dropZones,
    required this.correctSequence,
  });

  factory DragAndDropModel.fromJson(Map<String, dynamic> json) {
    return DragAndDropModel(
      id: json['id'] as String? ?? '',
      instruction: json['instruction'] as String? ?? '',
      scaffoldCode: json['scaffoldCode'] as String?,
      draggableOptions:
          (json['draggableOptions'] as List<dynamic>)
              .map((d) => DraggableModel.fromJson(d as Map<String, dynamic>))
              .toList(),
      dropZones: (json['dropZones'] as Map<String, dynamic>?)?.map(
        (key, value) => MapEntry(
          key,
          DropZoneModel.fromJson(value as Map<String, dynamic>),
        ),
      ),
      correctSequence:
          (json['correctSequence'] as List<dynamic>)
              .map((e) => e as String)
              .toList(),
    );
  }
}
