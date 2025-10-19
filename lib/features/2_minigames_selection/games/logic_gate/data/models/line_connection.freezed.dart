// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'line_connection.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$LineConnection {

 Offset get start; Offset get end; Color get color;
/// Create a copy of LineConnection
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LineConnectionCopyWith<LineConnection> get copyWith => _$LineConnectionCopyWithImpl<LineConnection>(this as LineConnection, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LineConnection&&(identical(other.start, start) || other.start == start)&&(identical(other.end, end) || other.end == end)&&(identical(other.color, color) || other.color == color));
}


@override
int get hashCode => Object.hash(runtimeType,start,end,color);

@override
String toString() {
  return 'LineConnection(start: $start, end: $end, color: $color)';
}


}

/// @nodoc
abstract mixin class $LineConnectionCopyWith<$Res>  {
  factory $LineConnectionCopyWith(LineConnection value, $Res Function(LineConnection) _then) = _$LineConnectionCopyWithImpl;
@useResult
$Res call({
 Offset start, Offset end, Color color
});




}
/// @nodoc
class _$LineConnectionCopyWithImpl<$Res>
    implements $LineConnectionCopyWith<$Res> {
  _$LineConnectionCopyWithImpl(this._self, this._then);

  final LineConnection _self;
  final $Res Function(LineConnection) _then;

/// Create a copy of LineConnection
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? start = null,Object? end = null,Object? color = null,}) {
  return _then(_self.copyWith(
start: null == start ? _self.start : start // ignore: cast_nullable_to_non_nullable
as Offset,end: null == end ? _self.end : end // ignore: cast_nullable_to_non_nullable
as Offset,color: null == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as Color,
  ));
}

}


/// Adds pattern-matching-related methods to [LineConnection].
extension LineConnectionPatterns on LineConnection {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LineConnection value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LineConnection() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LineConnection value)  $default,){
final _that = this;
switch (_that) {
case _LineConnection():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LineConnection value)?  $default,){
final _that = this;
switch (_that) {
case _LineConnection() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Offset start,  Offset end,  Color color)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LineConnection() when $default != null:
return $default(_that.start,_that.end,_that.color);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Offset start,  Offset end,  Color color)  $default,) {final _that = this;
switch (_that) {
case _LineConnection():
return $default(_that.start,_that.end,_that.color);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Offset start,  Offset end,  Color color)?  $default,) {final _that = this;
switch (_that) {
case _LineConnection() when $default != null:
return $default(_that.start,_that.end,_that.color);case _:
  return null;

}
}

}

/// @nodoc


class _LineConnection implements LineConnection {
  const _LineConnection({required this.start, required this.end, required this.color});
  

@override final  Offset start;
@override final  Offset end;
@override final  Color color;

/// Create a copy of LineConnection
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LineConnectionCopyWith<_LineConnection> get copyWith => __$LineConnectionCopyWithImpl<_LineConnection>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LineConnection&&(identical(other.start, start) || other.start == start)&&(identical(other.end, end) || other.end == end)&&(identical(other.color, color) || other.color == color));
}


@override
int get hashCode => Object.hash(runtimeType,start,end,color);

@override
String toString() {
  return 'LineConnection(start: $start, end: $end, color: $color)';
}


}

/// @nodoc
abstract mixin class _$LineConnectionCopyWith<$Res> implements $LineConnectionCopyWith<$Res> {
  factory _$LineConnectionCopyWith(_LineConnection value, $Res Function(_LineConnection) _then) = __$LineConnectionCopyWithImpl;
@override @useResult
$Res call({
 Offset start, Offset end, Color color
});




}
/// @nodoc
class __$LineConnectionCopyWithImpl<$Res>
    implements _$LineConnectionCopyWith<$Res> {
  __$LineConnectionCopyWithImpl(this._self, this._then);

  final _LineConnection _self;
  final $Res Function(_LineConnection) _then;

/// Create a copy of LineConnection
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? start = null,Object? end = null,Object? color = null,}) {
  return _then(_LineConnection(
start: null == start ? _self.start : start // ignore: cast_nullable_to_non_nullable
as Offset,end: null == end ? _self.end : end // ignore: cast_nullable_to_non_nullable
as Offset,color: null == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as Color,
  ));
}


}

// dart format on
