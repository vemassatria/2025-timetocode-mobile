import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'line_connection.freezed.dart';

@freezed
abstract class LineConnection with _$LineConnection {
  const factory LineConnection({
    required Offset start,
    required Offset end,
    required Color color,
  }) = _LineConnection;
}
