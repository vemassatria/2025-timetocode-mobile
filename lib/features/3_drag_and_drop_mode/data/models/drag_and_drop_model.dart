import 'package:timetocode/features/3_drag_and_drop_mode/data/models/drop_zone_model.dart';

import 'draggable_model.dart';

class DragAndDropModel {
  final String id;
  final String instruction;
  final String? scaffoldCode;
  final List<DraggableModel> draggableOptions;
  final List<DropZoneModel> dropZones;
  final List<String> correctSequence;
  final String? next;
  final String? nextType;
  final String? nextDifficulty;

  DragAndDropModel({
    required this.id,
    required this.instruction,
    this.scaffoldCode,
    required this.draggableOptions,
    required this.dropZones,
    required this.correctSequence,
    this.next,
    this.nextType,
    this.nextDifficulty,
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
      dropZones:
          (json['dropZones'] as List<dynamic>)
              .map((d) => DropZoneModel.fromJson(d as Map<String, dynamic>))
              .toList(),
      correctSequence:
          (json['correctSequence'] as List<dynamic>)
              .map((e) => e as String)
              .toList(),
      next: json['next'] as String?,
      nextType: json['nextType'] as String?,
      nextDifficulty: json['nextDifficulty'] as String?,
    );
  }
}
