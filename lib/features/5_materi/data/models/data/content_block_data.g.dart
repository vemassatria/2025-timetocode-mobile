// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'content_block_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HeadingData _$HeadingDataFromJson(Map<String, dynamic> json) => HeadingData(
  text: json['text'] as String,
  headingType: $enumDecode(_$HeadingTypeEnumMap, json['headingType']),
  $type: json['type'] as String?,
);

Map<String, dynamic> _$HeadingDataToJson(HeadingData instance) =>
    <String, dynamic>{
      'text': instance.text,
      'headingType': _$HeadingTypeEnumMap[instance.headingType]!,
      'type': instance.$type,
    };

const _$HeadingTypeEnumMap = {
  HeadingType.h1: 'h1',
  HeadingType.h2: 'h2',
  HeadingType.h3: 'h3',
  HeadingType.h4: 'h4',
  HeadingType.h5: 'h5',
  HeadingType.h6: 'h6',
};

TextData _$TextDataFromJson(Map<String, dynamic> json) =>
    TextData(text: json['text'] as String, $type: json['type'] as String?);

Map<String, dynamic> _$TextDataToJson(TextData instance) => <String, dynamic>{
  'text': instance.text,
  'type': instance.$type,
};

ImageData _$ImageDataFromJson(Map<String, dynamic> json) => ImageData(
  url: json['url'] as String,
  caption: json['caption'] as String?,
  $type: json['type'] as String?,
);

Map<String, dynamic> _$ImageDataToJson(ImageData instance) => <String, dynamic>{
  'url': instance.url,
  'caption': instance.caption,
  'type': instance.$type,
};

TableData _$TableDataFromJson(Map<String, dynamic> json) => TableData(
  headers: (_readHeaders(json, 'headers') as List<dynamic>)
      .map((e) => e as String)
      .toList(),
  rows: (_readRows(json, 'rows') as List<dynamic>)
      .map((e) => (e as List<dynamic>).map((e) => e as String).toList())
      .toList(),
  $type: json['type'] as String?,
);

Map<String, dynamic> _$TableDataToJson(TableData instance) => <String, dynamic>{
  'headers': instance.headers,
  'rows': instance.rows,
  'type': instance.$type,
};

ListData _$ListDataFromJson(Map<String, dynamic> json) => ListData(
  head: json['head'] as String,
  listType: $enumDecode(_$ListTypeEnumMap, json['listType']),
  items: (json['items'] as List<dynamic>).map((e) => e as String).toList(),
  $type: json['type'] as String?,
);

Map<String, dynamic> _$ListDataToJson(ListData instance) => <String, dynamic>{
  'head': instance.head,
  'listType': _$ListTypeEnumMap[instance.listType]!,
  'items': instance.items,
  'type': instance.$type,
};

const _$ListTypeEnumMap = {
  ListType.ordered: 'ordered',
  ListType.unordered: 'unordered',
};
