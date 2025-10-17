// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'matrix_level_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MatrixLevelModel {

 int get levelId; String get code; int get initialPointerPosition; int get targetPointerPosition; List<MatrixCommandModel> get commands;
/// Create a copy of MatrixLevelModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MatrixLevelModelCopyWith<MatrixLevelModel> get copyWith => _$MatrixLevelModelCopyWithImpl<MatrixLevelModel>(this as MatrixLevelModel, _$identity);

  /// Serializes this MatrixLevelModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MatrixLevelModel&&(identical(other.levelId, levelId) || other.levelId == levelId)&&(identical(other.code, code) || other.code == code)&&(identical(other.initialPointerPosition, initialPointerPosition) || other.initialPointerPosition == initialPointerPosition)&&(identical(other.targetPointerPosition, targetPointerPosition) || other.targetPointerPosition == targetPointerPosition)&&const DeepCollectionEquality().equals(other.commands, commands));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,levelId,code,initialPointerPosition,targetPointerPosition,const DeepCollectionEquality().hash(commands));

@override
String toString() {
  return 'MatrixLevelModel(levelId: $levelId, code: $code, initialPointerPosition: $initialPointerPosition, targetPointerPosition: $targetPointerPosition, commands: $commands)';
}


}

/// @nodoc
abstract mixin class $MatrixLevelModelCopyWith<$Res>  {
  factory $MatrixLevelModelCopyWith(MatrixLevelModel value, $Res Function(MatrixLevelModel) _then) = _$MatrixLevelModelCopyWithImpl;
@useResult
$Res call({
 int levelId, String code, int initialPointerPosition, int targetPointerPosition, List<MatrixCommandModel> commands
});




}
/// @nodoc
class _$MatrixLevelModelCopyWithImpl<$Res>
    implements $MatrixLevelModelCopyWith<$Res> {
  _$MatrixLevelModelCopyWithImpl(this._self, this._then);

  final MatrixLevelModel _self;
  final $Res Function(MatrixLevelModel) _then;

/// Create a copy of MatrixLevelModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? levelId = null,Object? code = null,Object? initialPointerPosition = null,Object? targetPointerPosition = null,Object? commands = null,}) {
  return _then(_self.copyWith(
levelId: null == levelId ? _self.levelId : levelId // ignore: cast_nullable_to_non_nullable
as int,code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,initialPointerPosition: null == initialPointerPosition ? _self.initialPointerPosition : initialPointerPosition // ignore: cast_nullable_to_non_nullable
as int,targetPointerPosition: null == targetPointerPosition ? _self.targetPointerPosition : targetPointerPosition // ignore: cast_nullable_to_non_nullable
as int,commands: null == commands ? _self.commands : commands // ignore: cast_nullable_to_non_nullable
as List<MatrixCommandModel>,
  ));
}

}


/// Adds pattern-matching-related methods to [MatrixLevelModel].
extension MatrixLevelModelPatterns on MatrixLevelModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MatrixLevelModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MatrixLevelModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MatrixLevelModel value)  $default,){
final _that = this;
switch (_that) {
case _MatrixLevelModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MatrixLevelModel value)?  $default,){
final _that = this;
switch (_that) {
case _MatrixLevelModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int levelId,  String code,  int initialPointerPosition,  int targetPointerPosition,  List<MatrixCommandModel> commands)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MatrixLevelModel() when $default != null:
return $default(_that.levelId,_that.code,_that.initialPointerPosition,_that.targetPointerPosition,_that.commands);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int levelId,  String code,  int initialPointerPosition,  int targetPointerPosition,  List<MatrixCommandModel> commands)  $default,) {final _that = this;
switch (_that) {
case _MatrixLevelModel():
return $default(_that.levelId,_that.code,_that.initialPointerPosition,_that.targetPointerPosition,_that.commands);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int levelId,  String code,  int initialPointerPosition,  int targetPointerPosition,  List<MatrixCommandModel> commands)?  $default,) {final _that = this;
switch (_that) {
case _MatrixLevelModel() when $default != null:
return $default(_that.levelId,_that.code,_that.initialPointerPosition,_that.targetPointerPosition,_that.commands);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MatrixLevelModel implements MatrixLevelModel {
  const _MatrixLevelModel({required this.levelId, required this.code, required this.initialPointerPosition, required this.targetPointerPosition, required final  List<MatrixCommandModel> commands}): _commands = commands;
  factory _MatrixLevelModel.fromJson(Map<String, dynamic> json) => _$MatrixLevelModelFromJson(json);

@override final  int levelId;
@override final  String code;
@override final  int initialPointerPosition;
@override final  int targetPointerPosition;
 final  List<MatrixCommandModel> _commands;
@override List<MatrixCommandModel> get commands {
  if (_commands is EqualUnmodifiableListView) return _commands;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_commands);
}


/// Create a copy of MatrixLevelModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MatrixLevelModelCopyWith<_MatrixLevelModel> get copyWith => __$MatrixLevelModelCopyWithImpl<_MatrixLevelModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MatrixLevelModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MatrixLevelModel&&(identical(other.levelId, levelId) || other.levelId == levelId)&&(identical(other.code, code) || other.code == code)&&(identical(other.initialPointerPosition, initialPointerPosition) || other.initialPointerPosition == initialPointerPosition)&&(identical(other.targetPointerPosition, targetPointerPosition) || other.targetPointerPosition == targetPointerPosition)&&const DeepCollectionEquality().equals(other._commands, _commands));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,levelId,code,initialPointerPosition,targetPointerPosition,const DeepCollectionEquality().hash(_commands));

@override
String toString() {
  return 'MatrixLevelModel(levelId: $levelId, code: $code, initialPointerPosition: $initialPointerPosition, targetPointerPosition: $targetPointerPosition, commands: $commands)';
}


}

/// @nodoc
abstract mixin class _$MatrixLevelModelCopyWith<$Res> implements $MatrixLevelModelCopyWith<$Res> {
  factory _$MatrixLevelModelCopyWith(_MatrixLevelModel value, $Res Function(_MatrixLevelModel) _then) = __$MatrixLevelModelCopyWithImpl;
@override @useResult
$Res call({
 int levelId, String code, int initialPointerPosition, int targetPointerPosition, List<MatrixCommandModel> commands
});




}
/// @nodoc
class __$MatrixLevelModelCopyWithImpl<$Res>
    implements _$MatrixLevelModelCopyWith<$Res> {
  __$MatrixLevelModelCopyWithImpl(this._self, this._then);

  final _MatrixLevelModel _self;
  final $Res Function(_MatrixLevelModel) _then;

/// Create a copy of MatrixLevelModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? levelId = null,Object? code = null,Object? initialPointerPosition = null,Object? targetPointerPosition = null,Object? commands = null,}) {
  return _then(_MatrixLevelModel(
levelId: null == levelId ? _self.levelId : levelId // ignore: cast_nullable_to_non_nullable
as int,code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,initialPointerPosition: null == initialPointerPosition ? _self.initialPointerPosition : initialPointerPosition // ignore: cast_nullable_to_non_nullable
as int,targetPointerPosition: null == targetPointerPosition ? _self.targetPointerPosition : targetPointerPosition // ignore: cast_nullable_to_non_nullable
as int,commands: null == commands ? _self._commands : commands // ignore: cast_nullable_to_non_nullable
as List<MatrixCommandModel>,
  ));
}


}

// dart format on
