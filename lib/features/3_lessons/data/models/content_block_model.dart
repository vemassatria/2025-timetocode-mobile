import 'package:freezed_annotation/freezed_annotation.dart';
import 'data/content_block_data.dart';

part 'content_block_model.freezed.dart';
part 'content_block_model.g.dart';

@freezed
abstract class ContentBlockModel with _$ContentBlockModel {
  const factory ContentBlockModel({
    required String type,
    required ContentBlockData data,
  }) = _ContentBlockModel;

  factory ContentBlockModel.fromJson(Map<String, dynamic> json) =>
      _contentBlockModelFromJson(json);

  const ContentBlockModel._();

  @override
  Map<String, dynamic> toJson() => _contentBlockModelToJson(this);
}

ContentBlockModel _contentBlockModelFromJson(Map<String, dynamic> json) {
  final type = (json['type'] as String?) ?? '';
  final rawData =
      (json['data'] as Map?)?.cast<String, dynamic>() ?? <String, dynamic>{};

  final mergedForUnion = <String, dynamic>{'type': type, ...rawData};
  final data = ContentBlockData.fromJson(mergedForUnion);

  return ContentBlockModel(type: type, data: data);
}

/// Saat encode, keluarkan lagi 'type' ke level atas, hapus dari payload 'data'
Map<String, dynamic> _contentBlockModelToJson(ContentBlockModel m) {
  final dataJson = m.data.toJson()..remove('type');
  return <String, dynamic>{'type': m.type, 'data': dataJson};
}
