// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'matrix_command_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MatrixCommandModel {

 String get command;// "UP", "DOWN", "LEFT", "RIGHT"
 int get value;
/// Create a copy of MatrixCommandModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MatrixCommandModelCopyWith<MatrixCommandModel> get copyWith => _$MatrixCommandModelCopyWithImpl<MatrixCommandModel>(this as MatrixCommandModel, _$identity);

  /// Serializes this MatrixCommandModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MatrixCommandModel&&(identical(other.command, command) || other.command == command)&&(identical(other.value, value) || other.value == value));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,command,value);

@override
String toString() {
  return 'MatrixCommandModel(command: $command, value: $value)';
}


}

/// @nodoc
abstract mixin class $MatrixCommandModelCopyWith<$Res>  {
  factory $MatrixCommandModelCopyWith(MatrixCommandModel value, $Res Function(MatrixCommandModel) _then) = _$MatrixCommandModelCopyWithImpl;
@useResult
$Res call({
 String command, int value
});




}
/// @nodoc
class _$MatrixCommandModelCopyWithImpl<$Res>
    implements $MatrixCommandModelCopyWith<$Res> {
  _$MatrixCommandModelCopyWithImpl(this._self, this._then);

  final MatrixCommandModel _self;
  final $Res Function(MatrixCommandModel) _then;

/// Create a copy of MatrixCommandModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? command = null,Object? value = null,}) {
  return _then(_self.copyWith(
command: null == command ? _self.command : command // ignore: cast_nullable_to_non_nullable
as String,value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [MatrixCommandModel].
extension MatrixCommandModelPatterns on MatrixCommandModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MatrixCommandModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MatrixCommandModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MatrixCommandModel value)  $default,){
final _that = this;
switch (_that) {
case _MatrixCommandModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MatrixCommandModel value)?  $default,){
final _that = this;
switch (_that) {
case _MatrixCommandModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String command,  int value)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MatrixCommandModel() when $default != null:
return $default(_that.command,_that.value);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String command,  int value)  $default,) {final _that = this;
switch (_that) {
case _MatrixCommandModel():
return $default(_that.command,_that.value);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String command,  int value)?  $default,) {final _that = this;
switch (_that) {
case _MatrixCommandModel() when $default != null:
return $default(_that.command,_that.value);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MatrixCommandModel implements MatrixCommandModel {
  const _MatrixCommandModel({required this.command, required this.value});
  factory _MatrixCommandModel.fromJson(Map<String, dynamic> json) => _$MatrixCommandModelFromJson(json);

@override final  String command;
// "UP", "DOWN", "LEFT", "RIGHT"
@override final  int value;

/// Create a copy of MatrixCommandModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MatrixCommandModelCopyWith<_MatrixCommandModel> get copyWith => __$MatrixCommandModelCopyWithImpl<_MatrixCommandModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MatrixCommandModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MatrixCommandModel&&(identical(other.command, command) || other.command == command)&&(identical(other.value, value) || other.value == value));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,command,value);

@override
String toString() {
  return 'MatrixCommandModel(command: $command, value: $value)';
}


}

/// @nodoc
abstract mixin class _$MatrixCommandModelCopyWith<$Res> implements $MatrixCommandModelCopyWith<$Res> {
  factory _$MatrixCommandModelCopyWith(_MatrixCommandModel value, $Res Function(_MatrixCommandModel) _then) = __$MatrixCommandModelCopyWithImpl;
@override @useResult
$Res call({
 String command, int value
});




}
/// @nodoc
class __$MatrixCommandModelCopyWithImpl<$Res>
    implements _$MatrixCommandModelCopyWith<$Res> {
  __$MatrixCommandModelCopyWithImpl(this._self, this._then);

  final _MatrixCommandModel _self;
  final $Res Function(_MatrixCommandModel) _then;

/// Create a copy of MatrixCommandModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? command = null,Object? value = null,}) {
  return _then(_MatrixCommandModel(
command: null == command ? _self.command : command // ignore: cast_nullable_to_non_nullable
as String,value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
