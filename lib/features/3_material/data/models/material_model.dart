import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:timetocode/features/3_material/data/models/content_block_model.dart';

part 'material_model.freezed.dart';
part 'material_model.g.dart';

@freezed
abstract class MaterialModel with _$MaterialModel {
  const factory MaterialModel({
    required int level,
    required String title,
    required List<ContentBlockModel> content,
    String? videoUrl,
  }) = _MaterialModel;

  factory MaterialModel.fromJson(Map<String, dynamic> json) =>
      _$MaterialModelFromJson(json);

  const MaterialModel._();
}
