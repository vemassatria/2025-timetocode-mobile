import 'package:freezed_annotation/freezed_annotation.dart';

part 'content_block_data.freezed.dart';
part 'content_block_data.g.dart';

enum HeadingType {
  @JsonValue('mainTitle')
  mainTitle,
  @JsonValue('topicTitle')
  topicTitle,
  @JsonValue('subTopicTitle')
  subTopicTitle,
}

enum ListType {
  @JsonValue('ordered')
  ordered,
  @JsonValue('unordered')
  unordered,
}

@Freezed(unionKey: 'type')
abstract class ContentBlockData with _$ContentBlockData {
  // ---------------- heading ----------------
  @FreezedUnionValue('heading')
  const factory ContentBlockData.heading({
    required String text,
    required HeadingType headingType,
  }) = HeadingData;

  // ---------------- text ----------------
  @FreezedUnionValue('text')
  const factory ContentBlockData.text({required String text}) = TextData;

  // ---------------- image ----------------
  @FreezedUnionValue('image')
  const factory ContentBlockData.image({required String url, String? caption}) =
      ImageData;

  // ---------------- table ----------------
  @FreezedUnionValue('table')
  const factory ContentBlockData.table({
    required List<String> headers,
    required List<List<String>> rows,
  }) = TableData;

  // ---------------- list ----------------
  @FreezedUnionValue('list')
  const factory ContentBlockData.list({
    required String head,
    required ListType listType,
    required List<String> items,
  }) = ListData;

  factory ContentBlockData.fromJson(Map<String, dynamic> json) =>
      _$ContentBlockDataFromJson(json);
}
