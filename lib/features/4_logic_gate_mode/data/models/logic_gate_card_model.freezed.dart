// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'logic_gate_card_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$LogicGateCardModel {

 int get id; LogicGateType get type;
/// Create a copy of LogicGateCardModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LogicGateCardModelCopyWith<LogicGateCardModel> get copyWith => _$LogicGateCardModelCopyWithImpl<LogicGateCardModel>(this as LogicGateCardModel, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LogicGateCardModel&&(identical(other.id, id) || other.id == id)&&(identical(other.type, type) || other.type == type));
}


@override
int get hashCode => Object.hash(runtimeType,id,type);

@override
String toString() {
  return 'LogicGateCardModel(id: $id, type: $type)';
}


}

/// @nodoc
abstract mixin class $LogicGateCardModelCopyWith<$Res>  {
  factory $LogicGateCardModelCopyWith(LogicGateCardModel value, $Res Function(LogicGateCardModel) _then) = _$LogicGateCardModelCopyWithImpl;
@useResult
$Res call({
 int id, LogicGateType type
});




}
/// @nodoc
class _$LogicGateCardModelCopyWithImpl<$Res>
    implements $LogicGateCardModelCopyWith<$Res> {
  _$LogicGateCardModelCopyWithImpl(this._self, this._then);

  final LogicGateCardModel _self;
  final $Res Function(LogicGateCardModel) _then;

/// Create a copy of LogicGateCardModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? type = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as LogicGateType,
  ));
}

}


/// Adds pattern-matching-related methods to [LogicGateCardModel].
extension LogicGateCardModelPatterns on LogicGateCardModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LogicGateCardModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LogicGateCardModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LogicGateCardModel value)  $default,){
final _that = this;
switch (_that) {
case _LogicGateCardModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LogicGateCardModel value)?  $default,){
final _that = this;
switch (_that) {
case _LogicGateCardModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  LogicGateType type)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LogicGateCardModel() when $default != null:
return $default(_that.id,_that.type);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  LogicGateType type)  $default,) {final _that = this;
switch (_that) {
case _LogicGateCardModel():
return $default(_that.id,_that.type);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  LogicGateType type)?  $default,) {final _that = this;
switch (_that) {
case _LogicGateCardModel() when $default != null:
return $default(_that.id,_that.type);case _:
  return null;

}
}

}

/// @nodoc


class _LogicGateCardModel implements LogicGateCardModel {
  const _LogicGateCardModel({required this.id, required this.type});
  

@override final  int id;
@override final  LogicGateType type;

/// Create a copy of LogicGateCardModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LogicGateCardModelCopyWith<_LogicGateCardModel> get copyWith => __$LogicGateCardModelCopyWithImpl<_LogicGateCardModel>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LogicGateCardModel&&(identical(other.id, id) || other.id == id)&&(identical(other.type, type) || other.type == type));
}


@override
int get hashCode => Object.hash(runtimeType,id,type);

@override
String toString() {
  return 'LogicGateCardModel(id: $id, type: $type)';
}


}

/// @nodoc
abstract mixin class _$LogicGateCardModelCopyWith<$Res> implements $LogicGateCardModelCopyWith<$Res> {
  factory _$LogicGateCardModelCopyWith(_LogicGateCardModel value, $Res Function(_LogicGateCardModel) _then) = __$LogicGateCardModelCopyWithImpl;
@override @useResult
$Res call({
 int id, LogicGateType type
});




}
/// @nodoc
class __$LogicGateCardModelCopyWithImpl<$Res>
    implements _$LogicGateCardModelCopyWith<$Res> {
  __$LogicGateCardModelCopyWithImpl(this._self, this._then);

  final _LogicGateCardModel _self;
  final $Res Function(_LogicGateCardModel) _then;

/// Create a copy of LogicGateCardModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? type = null,}) {
  return _then(_LogicGateCardModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as LogicGateType,
  ));
}


}

// dart format on
