// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'drag_and_drop_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DragAndDropModel {

 String get id; Map<String, String>? get conditions; String get instruction; String get scaffoldCode; List<DraggableModel> get draggableOptions; List<DropZoneModel> get dropZones; List<String> get correctSequence; List<String> get next; List<String> get nextType; Map<String, String>? get consequences;
/// Create a copy of DragAndDropModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DragAndDropModelCopyWith<DragAndDropModel> get copyWith => _$DragAndDropModelCopyWithImpl<DragAndDropModel>(this as DragAndDropModel, _$identity);

  /// Serializes this DragAndDropModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DragAndDropModel&&(identical(other.id, id) || other.id == id)&&const DeepCollectionEquality().equals(other.conditions, conditions)&&(identical(other.instruction, instruction) || other.instruction == instruction)&&(identical(other.scaffoldCode, scaffoldCode) || other.scaffoldCode == scaffoldCode)&&const DeepCollectionEquality().equals(other.draggableOptions, draggableOptions)&&const DeepCollectionEquality().equals(other.dropZones, dropZones)&&const DeepCollectionEquality().equals(other.correctSequence, correctSequence)&&const DeepCollectionEquality().equals(other.next, next)&&const DeepCollectionEquality().equals(other.nextType, nextType)&&const DeepCollectionEquality().equals(other.consequences, consequences));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,const DeepCollectionEquality().hash(conditions),instruction,scaffoldCode,const DeepCollectionEquality().hash(draggableOptions),const DeepCollectionEquality().hash(dropZones),const DeepCollectionEquality().hash(correctSequence),const DeepCollectionEquality().hash(next),const DeepCollectionEquality().hash(nextType),const DeepCollectionEquality().hash(consequences));

@override
String toString() {
  return 'DragAndDropModel(id: $id, conditions: $conditions, instruction: $instruction, scaffoldCode: $scaffoldCode, draggableOptions: $draggableOptions, dropZones: $dropZones, correctSequence: $correctSequence, next: $next, nextType: $nextType, consequences: $consequences)';
}


}

/// @nodoc
abstract mixin class $DragAndDropModelCopyWith<$Res>  {
  factory $DragAndDropModelCopyWith(DragAndDropModel value, $Res Function(DragAndDropModel) _then) = _$DragAndDropModelCopyWithImpl;
@useResult
$Res call({
 String id, Map<String, String>? conditions, String instruction, String scaffoldCode, List<DraggableModel> draggableOptions, List<DropZoneModel> dropZones, List<String> correctSequence, List<String> next, List<String> nextType, Map<String, String>? consequences
});




}
/// @nodoc
class _$DragAndDropModelCopyWithImpl<$Res>
    implements $DragAndDropModelCopyWith<$Res> {
  _$DragAndDropModelCopyWithImpl(this._self, this._then);

  final DragAndDropModel _self;
  final $Res Function(DragAndDropModel) _then;

/// Create a copy of DragAndDropModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? conditions = freezed,Object? instruction = null,Object? scaffoldCode = null,Object? draggableOptions = null,Object? dropZones = null,Object? correctSequence = null,Object? next = null,Object? nextType = null,Object? consequences = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,conditions: freezed == conditions ? _self.conditions : conditions // ignore: cast_nullable_to_non_nullable
as Map<String, String>?,instruction: null == instruction ? _self.instruction : instruction // ignore: cast_nullable_to_non_nullable
as String,scaffoldCode: null == scaffoldCode ? _self.scaffoldCode : scaffoldCode // ignore: cast_nullable_to_non_nullable
as String,draggableOptions: null == draggableOptions ? _self.draggableOptions : draggableOptions // ignore: cast_nullable_to_non_nullable
as List<DraggableModel>,dropZones: null == dropZones ? _self.dropZones : dropZones // ignore: cast_nullable_to_non_nullable
as List<DropZoneModel>,correctSequence: null == correctSequence ? _self.correctSequence : correctSequence // ignore: cast_nullable_to_non_nullable
as List<String>,next: null == next ? _self.next : next // ignore: cast_nullable_to_non_nullable
as List<String>,nextType: null == nextType ? _self.nextType : nextType // ignore: cast_nullable_to_non_nullable
as List<String>,consequences: freezed == consequences ? _self.consequences : consequences // ignore: cast_nullable_to_non_nullable
as Map<String, String>?,
  ));
}

}


/// Adds pattern-matching-related methods to [DragAndDropModel].
extension DragAndDropModelPatterns on DragAndDropModel {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DragAndDropModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DragAndDropModel() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DragAndDropModel value)  $default,){
final _that = this;
switch (_that) {
case _DragAndDropModel():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DragAndDropModel value)?  $default,){
final _that = this;
switch (_that) {
case _DragAndDropModel() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  Map<String, String>? conditions,  String instruction,  String scaffoldCode,  List<DraggableModel> draggableOptions,  List<DropZoneModel> dropZones,  List<String> correctSequence,  List<String> next,  List<String> nextType,  Map<String, String>? consequences)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DragAndDropModel() when $default != null:
return $default(_that.id,_that.conditions,_that.instruction,_that.scaffoldCode,_that.draggableOptions,_that.dropZones,_that.correctSequence,_that.next,_that.nextType,_that.consequences);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  Map<String, String>? conditions,  String instruction,  String scaffoldCode,  List<DraggableModel> draggableOptions,  List<DropZoneModel> dropZones,  List<String> correctSequence,  List<String> next,  List<String> nextType,  Map<String, String>? consequences)  $default,) {final _that = this;
switch (_that) {
case _DragAndDropModel():
return $default(_that.id,_that.conditions,_that.instruction,_that.scaffoldCode,_that.draggableOptions,_that.dropZones,_that.correctSequence,_that.next,_that.nextType,_that.consequences);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  Map<String, String>? conditions,  String instruction,  String scaffoldCode,  List<DraggableModel> draggableOptions,  List<DropZoneModel> dropZones,  List<String> correctSequence,  List<String> next,  List<String> nextType,  Map<String, String>? consequences)?  $default,) {final _that = this;
switch (_that) {
case _DragAndDropModel() when $default != null:
return $default(_that.id,_that.conditions,_that.instruction,_that.scaffoldCode,_that.draggableOptions,_that.dropZones,_that.correctSequence,_that.next,_that.nextType,_that.consequences);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DragAndDropModel implements DragAndDropModel {
  const _DragAndDropModel({required this.id, final  Map<String, String>? conditions, required this.instruction, required this.scaffoldCode, required final  List<DraggableModel> draggableOptions, required final  List<DropZoneModel> dropZones, required final  List<String> correctSequence, required final  List<String> next, required final  List<String> nextType, final  Map<String, String>? consequences}): _conditions = conditions,_draggableOptions = draggableOptions,_dropZones = dropZones,_correctSequence = correctSequence,_next = next,_nextType = nextType,_consequences = consequences;
  factory _DragAndDropModel.fromJson(Map<String, dynamic> json) => _$DragAndDropModelFromJson(json);

@override final  String id;
 final  Map<String, String>? _conditions;
@override Map<String, String>? get conditions {
  final value = _conditions;
  if (value == null) return null;
  if (_conditions is EqualUnmodifiableMapView) return _conditions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}

@override final  String instruction;
@override final  String scaffoldCode;
 final  List<DraggableModel> _draggableOptions;
@override List<DraggableModel> get draggableOptions {
  if (_draggableOptions is EqualUnmodifiableListView) return _draggableOptions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_draggableOptions);
}

 final  List<DropZoneModel> _dropZones;
@override List<DropZoneModel> get dropZones {
  if (_dropZones is EqualUnmodifiableListView) return _dropZones;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_dropZones);
}

 final  List<String> _correctSequence;
@override List<String> get correctSequence {
  if (_correctSequence is EqualUnmodifiableListView) return _correctSequence;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_correctSequence);
}

 final  List<String> _next;
@override List<String> get next {
  if (_next is EqualUnmodifiableListView) return _next;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_next);
}

 final  List<String> _nextType;
@override List<String> get nextType {
  if (_nextType is EqualUnmodifiableListView) return _nextType;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_nextType);
}

 final  Map<String, String>? _consequences;
@override Map<String, String>? get consequences {
  final value = _consequences;
  if (value == null) return null;
  if (_consequences is EqualUnmodifiableMapView) return _consequences;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}


/// Create a copy of DragAndDropModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DragAndDropModelCopyWith<_DragAndDropModel> get copyWith => __$DragAndDropModelCopyWithImpl<_DragAndDropModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DragAndDropModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DragAndDropModel&&(identical(other.id, id) || other.id == id)&&const DeepCollectionEquality().equals(other._conditions, _conditions)&&(identical(other.instruction, instruction) || other.instruction == instruction)&&(identical(other.scaffoldCode, scaffoldCode) || other.scaffoldCode == scaffoldCode)&&const DeepCollectionEquality().equals(other._draggableOptions, _draggableOptions)&&const DeepCollectionEquality().equals(other._dropZones, _dropZones)&&const DeepCollectionEquality().equals(other._correctSequence, _correctSequence)&&const DeepCollectionEquality().equals(other._next, _next)&&const DeepCollectionEquality().equals(other._nextType, _nextType)&&const DeepCollectionEquality().equals(other._consequences, _consequences));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,const DeepCollectionEquality().hash(_conditions),instruction,scaffoldCode,const DeepCollectionEquality().hash(_draggableOptions),const DeepCollectionEquality().hash(_dropZones),const DeepCollectionEquality().hash(_correctSequence),const DeepCollectionEquality().hash(_next),const DeepCollectionEquality().hash(_nextType),const DeepCollectionEquality().hash(_consequences));

@override
String toString() {
  return 'DragAndDropModel(id: $id, conditions: $conditions, instruction: $instruction, scaffoldCode: $scaffoldCode, draggableOptions: $draggableOptions, dropZones: $dropZones, correctSequence: $correctSequence, next: $next, nextType: $nextType, consequences: $consequences)';
}


}

/// @nodoc
abstract mixin class _$DragAndDropModelCopyWith<$Res> implements $DragAndDropModelCopyWith<$Res> {
  factory _$DragAndDropModelCopyWith(_DragAndDropModel value, $Res Function(_DragAndDropModel) _then) = __$DragAndDropModelCopyWithImpl;
@override @useResult
$Res call({
 String id, Map<String, String>? conditions, String instruction, String scaffoldCode, List<DraggableModel> draggableOptions, List<DropZoneModel> dropZones, List<String> correctSequence, List<String> next, List<String> nextType, Map<String, String>? consequences
});




}
/// @nodoc
class __$DragAndDropModelCopyWithImpl<$Res>
    implements _$DragAndDropModelCopyWith<$Res> {
  __$DragAndDropModelCopyWithImpl(this._self, this._then);

  final _DragAndDropModel _self;
  final $Res Function(_DragAndDropModel) _then;

/// Create a copy of DragAndDropModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? conditions = freezed,Object? instruction = null,Object? scaffoldCode = null,Object? draggableOptions = null,Object? dropZones = null,Object? correctSequence = null,Object? next = null,Object? nextType = null,Object? consequences = freezed,}) {
  return _then(_DragAndDropModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,conditions: freezed == conditions ? _self._conditions : conditions // ignore: cast_nullable_to_non_nullable
as Map<String, String>?,instruction: null == instruction ? _self.instruction : instruction // ignore: cast_nullable_to_non_nullable
as String,scaffoldCode: null == scaffoldCode ? _self.scaffoldCode : scaffoldCode // ignore: cast_nullable_to_non_nullable
as String,draggableOptions: null == draggableOptions ? _self._draggableOptions : draggableOptions // ignore: cast_nullable_to_non_nullable
as List<DraggableModel>,dropZones: null == dropZones ? _self._dropZones : dropZones // ignore: cast_nullable_to_non_nullable
as List<DropZoneModel>,correctSequence: null == correctSequence ? _self._correctSequence : correctSequence // ignore: cast_nullable_to_non_nullable
as List<String>,next: null == next ? _self._next : next // ignore: cast_nullable_to_non_nullable
as List<String>,nextType: null == nextType ? _self._nextType : nextType // ignore: cast_nullable_to_non_nullable
as List<String>,consequences: freezed == consequences ? _self._consequences : consequences // ignore: cast_nullable_to_non_nullable
as Map<String, String>?,
  ));
}


}

// dart format on
