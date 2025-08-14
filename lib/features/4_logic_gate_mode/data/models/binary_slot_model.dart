import 'package:freezed_annotation/freezed_annotation.dart';

part 'binary_slot_model.freezed.dart';

@freezed
abstract class BinarySlotModel with _$BinarySlotModel {
  const factory BinarySlotModel({required int id, int? value}) =
      _BinarySlotModel;
}
