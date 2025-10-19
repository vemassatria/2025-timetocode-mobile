// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'binary_slot_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$BinarySlotModel {

 int get id; int? get value;
/// Create a copy of BinarySlotModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BinarySlotModelCopyWith<BinarySlotModel> get copyWith => _$BinarySlotModelCopyWithImpl<BinarySlotModel>(this as BinarySlotModel, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BinarySlotModel&&(identical(other.id, id) || other.id == id)&&(identical(other.value, value) || other.value == value));
}


@override
int get hashCode => Object.hash(runtimeType,id,value);

@override
String toString() {
  return 'BinarySlotModel(id: $id, value: $value)';
}


}

/// @nodoc
abstract mixin class $BinarySlotModelCopyWith<$Res>  {
  factory $BinarySlotModelCopyWith(BinarySlotModel value, $Res Function(BinarySlotModel) _then) = _$BinarySlotModelCopyWithImpl;
@useResult
$Res call({
 int id, int? value
});




}
/// @nodoc
class _$BinarySlotModelCopyWithImpl<$Res>
    implements $BinarySlotModelCopyWith<$Res> {
  _$BinarySlotModelCopyWithImpl(this._self, this._then);

  final BinarySlotModel _self;
  final $Res Function(BinarySlotModel) _then;

/// Create a copy of BinarySlotModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? value = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,value: freezed == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [BinarySlotModel].
extension BinarySlotModelPatterns on BinarySlotModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BinarySlotModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BinarySlotModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BinarySlotModel value)  $default,){
final _that = this;
switch (_that) {
case _BinarySlotModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BinarySlotModel value)?  $default,){
final _that = this;
switch (_that) {
case _BinarySlotModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  int? value)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BinarySlotModel() when $default != null:
return $default(_that.id,_that.value);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  int? value)  $default,) {final _that = this;
switch (_that) {
case _BinarySlotModel():
return $default(_that.id,_that.value);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  int? value)?  $default,) {final _that = this;
switch (_that) {
case _BinarySlotModel() when $default != null:
return $default(_that.id,_that.value);case _:
  return null;

}
}

}

/// @nodoc


class _BinarySlotModel implements BinarySlotModel {
  const _BinarySlotModel({required this.id, this.value});
  

@override final  int id;
@override final  int? value;

/// Create a copy of BinarySlotModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BinarySlotModelCopyWith<_BinarySlotModel> get copyWith => __$BinarySlotModelCopyWithImpl<_BinarySlotModel>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BinarySlotModel&&(identical(other.id, id) || other.id == id)&&(identical(other.value, value) || other.value == value));
}


@override
int get hashCode => Object.hash(runtimeType,id,value);

@override
String toString() {
  return 'BinarySlotModel(id: $id, value: $value)';
}


}

/// @nodoc
abstract mixin class _$BinarySlotModelCopyWith<$Res> implements $BinarySlotModelCopyWith<$Res> {
  factory _$BinarySlotModelCopyWith(_BinarySlotModel value, $Res Function(_BinarySlotModel) _then) = __$BinarySlotModelCopyWithImpl;
@override @useResult
$Res call({
 int id, int? value
});




}
/// @nodoc
class __$BinarySlotModelCopyWithImpl<$Res>
    implements _$BinarySlotModelCopyWith<$Res> {
  __$BinarySlotModelCopyWithImpl(this._self, this._then);

  final _BinarySlotModel _self;
  final $Res Function(_BinarySlotModel) _then;

/// Create a copy of BinarySlotModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? value = freezed,}) {
  return _then(_BinarySlotModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,value: freezed == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
