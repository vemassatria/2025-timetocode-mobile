// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'challenge_level_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ChallengeLevelModel {

 int get id; String get levelName; QuestionDifficultyModel get questions;
/// Create a copy of ChallengeLevelModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChallengeLevelModelCopyWith<ChallengeLevelModel> get copyWith => _$ChallengeLevelModelCopyWithImpl<ChallengeLevelModel>(this as ChallengeLevelModel, _$identity);

  /// Serializes this ChallengeLevelModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChallengeLevelModel&&(identical(other.id, id) || other.id == id)&&(identical(other.levelName, levelName) || other.levelName == levelName)&&(identical(other.questions, questions) || other.questions == questions));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,levelName,questions);

@override
String toString() {
  return 'ChallengeLevelModel(id: $id, levelName: $levelName, questions: $questions)';
}


}

/// @nodoc
abstract mixin class $ChallengeLevelModelCopyWith<$Res>  {
  factory $ChallengeLevelModelCopyWith(ChallengeLevelModel value, $Res Function(ChallengeLevelModel) _then) = _$ChallengeLevelModelCopyWithImpl;
@useResult
$Res call({
 int id, String levelName, QuestionDifficultyModel questions
});


$QuestionDifficultyModelCopyWith<$Res> get questions;

}
/// @nodoc
class _$ChallengeLevelModelCopyWithImpl<$Res>
    implements $ChallengeLevelModelCopyWith<$Res> {
  _$ChallengeLevelModelCopyWithImpl(this._self, this._then);

  final ChallengeLevelModel _self;
  final $Res Function(ChallengeLevelModel) _then;

/// Create a copy of ChallengeLevelModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? levelName = null,Object? questions = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,levelName: null == levelName ? _self.levelName : levelName // ignore: cast_nullable_to_non_nullable
as String,questions: null == questions ? _self.questions : questions // ignore: cast_nullable_to_non_nullable
as QuestionDifficultyModel,
  ));
}
/// Create a copy of ChallengeLevelModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$QuestionDifficultyModelCopyWith<$Res> get questions {
  
  return $QuestionDifficultyModelCopyWith<$Res>(_self.questions, (value) {
    return _then(_self.copyWith(questions: value));
  });
}
}


/// Adds pattern-matching-related methods to [ChallengeLevelModel].
extension ChallengeLevelModelPatterns on ChallengeLevelModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ChallengeLevelModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ChallengeLevelModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ChallengeLevelModel value)  $default,){
final _that = this;
switch (_that) {
case _ChallengeLevelModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ChallengeLevelModel value)?  $default,){
final _that = this;
switch (_that) {
case _ChallengeLevelModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String levelName,  QuestionDifficultyModel questions)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ChallengeLevelModel() when $default != null:
return $default(_that.id,_that.levelName,_that.questions);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String levelName,  QuestionDifficultyModel questions)  $default,) {final _that = this;
switch (_that) {
case _ChallengeLevelModel():
return $default(_that.id,_that.levelName,_that.questions);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String levelName,  QuestionDifficultyModel questions)?  $default,) {final _that = this;
switch (_that) {
case _ChallengeLevelModel() when $default != null:
return $default(_that.id,_that.levelName,_that.questions);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ChallengeLevelModel implements ChallengeLevelModel {
  const _ChallengeLevelModel({required this.id, required this.levelName, required this.questions});
  factory _ChallengeLevelModel.fromJson(Map<String, dynamic> json) => _$ChallengeLevelModelFromJson(json);

@override final  int id;
@override final  String levelName;
@override final  QuestionDifficultyModel questions;

/// Create a copy of ChallengeLevelModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChallengeLevelModelCopyWith<_ChallengeLevelModel> get copyWith => __$ChallengeLevelModelCopyWithImpl<_ChallengeLevelModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ChallengeLevelModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChallengeLevelModel&&(identical(other.id, id) || other.id == id)&&(identical(other.levelName, levelName) || other.levelName == levelName)&&(identical(other.questions, questions) || other.questions == questions));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,levelName,questions);

@override
String toString() {
  return 'ChallengeLevelModel(id: $id, levelName: $levelName, questions: $questions)';
}


}

/// @nodoc
abstract mixin class _$ChallengeLevelModelCopyWith<$Res> implements $ChallengeLevelModelCopyWith<$Res> {
  factory _$ChallengeLevelModelCopyWith(_ChallengeLevelModel value, $Res Function(_ChallengeLevelModel) _then) = __$ChallengeLevelModelCopyWithImpl;
@override @useResult
$Res call({
 int id, String levelName, QuestionDifficultyModel questions
});


@override $QuestionDifficultyModelCopyWith<$Res> get questions;

}
/// @nodoc
class __$ChallengeLevelModelCopyWithImpl<$Res>
    implements _$ChallengeLevelModelCopyWith<$Res> {
  __$ChallengeLevelModelCopyWithImpl(this._self, this._then);

  final _ChallengeLevelModel _self;
  final $Res Function(_ChallengeLevelModel) _then;

/// Create a copy of ChallengeLevelModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? levelName = null,Object? questions = null,}) {
  return _then(_ChallengeLevelModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,levelName: null == levelName ? _self.levelName : levelName // ignore: cast_nullable_to_non_nullable
as String,questions: null == questions ? _self.questions : questions // ignore: cast_nullable_to_non_nullable
as QuestionDifficultyModel,
  ));
}

/// Create a copy of ChallengeLevelModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$QuestionDifficultyModelCopyWith<$Res> get questions {
  
  return $QuestionDifficultyModelCopyWith<$Res>(_self.questions, (value) {
    return _then(_self.copyWith(questions: value));
  });
}
}

// dart format on
