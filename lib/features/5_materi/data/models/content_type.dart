import 'package:freezed_annotation/freezed_annotation.dart';

enum ContentType {
  @JsonValue('heading')
  heading,
  @JsonValue('text')
  text,
  @JsonValue('image')
  image,
  @JsonValue('table')
  table,
  @JsonValue('list')
  list,
}
