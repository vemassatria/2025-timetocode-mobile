import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:timetocode/features/3_materi/data/models/content_block_model.dart';

part 'materi_model.freezed.dart';
part 'materi_model.g.dart';

@freezed
abstract class MateriModel with _$MateriModel {
  const factory MateriModel({
    required int level,
    required String title,
    required List<ContentBlockModel> content,
  }) = _MateriModel;

  factory MateriModel.fromJson(Map<String, dynamic> json) =>
      _$MateriModelFromJson(json);
}
