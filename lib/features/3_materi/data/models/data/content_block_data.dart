import 'package:freezed_annotation/freezed_annotation.dart';

part 'content_block_data.freezed.dart';
part 'content_block_data.g.dart';

enum HeadingType {
  @JsonValue('h1')
  h1,
  @JsonValue('h2')
  h2,
  @JsonValue('h3')
  h3,
  @JsonValue('h4')
  h4,
  @JsonValue('h5')
  h5,
  @JsonValue('h6')
  h6,
}

@Freezed(unionKey: 'type')
abstract class ContentBlockData with _$ContentBlockData {
  @FreezedUnionValue('heading')
  const factory ContentBlockData.heading({
    required String text,
    required HeadingType headingType,
  }) = HeadingData;

  @FreezedUnionValue('text')
  const factory ContentBlockData.text({required String text}) = TextData;

  @FreezedUnionValue('image')
  const factory ContentBlockData.image({required String url, String? caption}) =
      ImageData;

  @FreezedUnionValue('table')
  const factory ContentBlockData.table({
    required List<List<String>> headers,
    required List<List<String>> rows,
  }) = TableData;

  factory ContentBlockData.fromJson(Map<String, dynamic> json) =>
      _$ContentBlockDataFromJson(json);
}
