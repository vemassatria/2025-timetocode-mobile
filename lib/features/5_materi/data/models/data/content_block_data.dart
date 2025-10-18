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

// =====================================================
// ⚙️ HELPER FUNCTIONS (pastikan diletakkan di bawah class)
// =====================================================

List<String> _readHeaders(Map json, String key) {
  final v = json[key];
  if (v is List) {
    if (v.isNotEmpty && v.first is String) {
      // ["A","B","C"]
      return v.map((e) => e.toString()).toList();
    }
    if (v.isNotEmpty && v.first is List) {
      // [["A","B","C"]]
      final first = v.first as List;
      return first.map((e) => e.toString()).toList();
    }
  }
  return const <String>[];
}

List<List<String>> _readRows(Map json, String key) {
  final v = json[key];
  if (v is List) {
    return v
        .map((row) => (row as List).map((e) => e.toString()).toList())
        .toList();
  }
  return const <List<String>>[];
}
