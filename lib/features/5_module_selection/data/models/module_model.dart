import 'package:freezed_annotation/freezed_annotation.dart';

part 'module_model.freezed.dart';
part 'module_model.g.dart';

@freezed
abstract class ModuleModel with _$ModuleModel {
  const factory ModuleModel({
    required String id,
    required String title,
    required String description,
    required bool isCompleted,
  }) = _ModuleModel;

  factory ModuleModel.fromJson(Map<String, dynamic> json) =>
      _$ModuleModelFromJson(json);
}
