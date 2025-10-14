import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:timetocode/features/3_materi/data/models/data/content_block_data.dart';

part 'content_block_model.freezed.dart';
part 'content_block_model.g.dart';

@freezed
abstract class ContentBlockModel with _$ContentBlockModel {
  const factory ContentBlockModel({required ContentBlockData data}) =
      _ContentBlockModel;

  factory ContentBlockModel.fromJson(Map<String, dynamic> json) =>
      _$ContentBlockModelFromJson(json);
}
