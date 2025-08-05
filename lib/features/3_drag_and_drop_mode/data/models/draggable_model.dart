import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:timetocode/features/3_drag_and_drop_mode/data/models/content_component_model.dart';

part 'draggable_model.freezed.dart';
part 'draggable_model.g.dart';

@freezed
abstract class DraggableModel with _$DraggableModel {
  const factory DraggableModel({
    required String id,
    required ContentComponentModel content,
    String? info,
  }) = _DraggableModel;

  factory DraggableModel.fromJson(Map<String, dynamic> json) =>
      _$DraggableModelFromJson(json);
}
