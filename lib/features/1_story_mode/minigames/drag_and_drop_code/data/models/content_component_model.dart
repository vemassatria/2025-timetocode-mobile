import 'package:freezed_annotation/freezed_annotation.dart';

part 'content_component_model.freezed.dart';
part 'content_component_model.g.dart';

@freezed
abstract class ContentComponentModel with _$ContentComponentModel {
  const factory ContentComponentModel({
    required String type,
    required String value,
  }) = _ContentComponentModel;

  factory ContentComponentModel.fromJson(Map<String, dynamic> json) =>
      _$ContentComponentModelFromJson(json);
}
