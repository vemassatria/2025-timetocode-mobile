// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'matrix_question_bank_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MatrixQuestionBankModel {

 List<MatrixLevelModel> get level1; List<MatrixLevelModel> get level2; List<MatrixLevelModel> get level3; List<MatrixLevelModel> get level4; List<MatrixLevelModel> get level5;
/// Create a copy of MatrixQuestionBankModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MatrixQuestionBankModelCopyWith<MatrixQuestionBankModel> get copyWith => _$MatrixQuestionBankModelCopyWithImpl<MatrixQuestionBankModel>(this as MatrixQuestionBankModel, _$identity);

  /// Serializes this MatrixQuestionBankModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MatrixQuestionBankModel&&const DeepCollectionEquality().equals(other.level1, level1)&&const DeepCollectionEquality().equals(other.level2, level2)&&const DeepCollectionEquality().equals(other.level3, level3)&&const DeepCollectionEquality().equals(other.level4, level4)&&const DeepCollectionEquality().equals(other.level5, level5));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(level1),const DeepCollectionEquality().hash(level2),const DeepCollectionEquality().hash(level3),const DeepCollectionEquality().hash(level4),const DeepCollectionEquality().hash(level5));

@override
String toString() {
  return 'MatrixQuestionBankModel(level1: $level1, level2: $level2, level3: $level3, level4: $level4, level5: $level5)';
}


}

/// @nodoc
abstract mixin class $MatrixQuestionBankModelCopyWith<$Res>  {
  factory $MatrixQuestionBankModelCopyWith(MatrixQuestionBankModel value, $Res Function(MatrixQuestionBankModel) _then) = _$MatrixQuestionBankModelCopyWithImpl;
@useResult
$Res call({
 List<MatrixLevelModel> level1, List<MatrixLevelModel> level2, List<MatrixLevelModel> level3, List<MatrixLevelModel> level4, List<MatrixLevelModel> level5
});




}
/// @nodoc
class _$MatrixQuestionBankModelCopyWithImpl<$Res>
    implements $MatrixQuestionBankModelCopyWith<$Res> {
  _$MatrixQuestionBankModelCopyWithImpl(this._self, this._then);

  final MatrixQuestionBankModel _self;
  final $Res Function(MatrixQuestionBankModel) _then;

/// Create a copy of MatrixQuestionBankModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? level1 = null,Object? level2 = null,Object? level3 = null,Object? level4 = null,Object? level5 = null,}) {
  return _then(_self.copyWith(
level1: null == level1 ? _self.level1 : level1 // ignore: cast_nullable_to_non_nullable
as List<MatrixLevelModel>,level2: null == level2 ? _self.level2 : level2 // ignore: cast_nullable_to_non_nullable
as List<MatrixLevelModel>,level3: null == level3 ? _self.level3 : level3 // ignore: cast_nullable_to_non_nullable
as List<MatrixLevelModel>,level4: null == level4 ? _self.level4 : level4 // ignore: cast_nullable_to_non_nullable
as List<MatrixLevelModel>,level5: null == level5 ? _self.level5 : level5 // ignore: cast_nullable_to_non_nullable
as List<MatrixLevelModel>,
  ));
}

}


/// Adds pattern-matching-related methods to [MatrixQuestionBankModel].
extension MatrixQuestionBankModelPatterns on MatrixQuestionBankModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MatrixQuestionBankModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MatrixQuestionBankModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MatrixQuestionBankModel value)  $default,){
final _that = this;
switch (_that) {
case _MatrixQuestionBankModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MatrixQuestionBankModel value)?  $default,){
final _that = this;
switch (_that) {
case _MatrixQuestionBankModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<MatrixLevelModel> level1,  List<MatrixLevelModel> level2,  List<MatrixLevelModel> level3,  List<MatrixLevelModel> level4,  List<MatrixLevelModel> level5)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MatrixQuestionBankModel() when $default != null:
return $default(_that.level1,_that.level2,_that.level3,_that.level4,_that.level5);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<MatrixLevelModel> level1,  List<MatrixLevelModel> level2,  List<MatrixLevelModel> level3,  List<MatrixLevelModel> level4,  List<MatrixLevelModel> level5)  $default,) {final _that = this;
switch (_that) {
case _MatrixQuestionBankModel():
return $default(_that.level1,_that.level2,_that.level3,_that.level4,_that.level5);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<MatrixLevelModel> level1,  List<MatrixLevelModel> level2,  List<MatrixLevelModel> level3,  List<MatrixLevelModel> level4,  List<MatrixLevelModel> level5)?  $default,) {final _that = this;
switch (_that) {
case _MatrixQuestionBankModel() when $default != null:
return $default(_that.level1,_that.level2,_that.level3,_that.level4,_that.level5);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MatrixQuestionBankModel implements MatrixQuestionBankModel {
   _MatrixQuestionBankModel({required final  List<MatrixLevelModel> level1, required final  List<MatrixLevelModel> level2, required final  List<MatrixLevelModel> level3, required final  List<MatrixLevelModel> level4, required final  List<MatrixLevelModel> level5}): _level1 = level1,_level2 = level2,_level3 = level3,_level4 = level4,_level5 = level5;
  factory _MatrixQuestionBankModel.fromJson(Map<String, dynamic> json) => _$MatrixQuestionBankModelFromJson(json);

 final  List<MatrixLevelModel> _level1;
@override List<MatrixLevelModel> get level1 {
  if (_level1 is EqualUnmodifiableListView) return _level1;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_level1);
}

 final  List<MatrixLevelModel> _level2;
@override List<MatrixLevelModel> get level2 {
  if (_level2 is EqualUnmodifiableListView) return _level2;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_level2);
}

 final  List<MatrixLevelModel> _level3;
@override List<MatrixLevelModel> get level3 {
  if (_level3 is EqualUnmodifiableListView) return _level3;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_level3);
}

 final  List<MatrixLevelModel> _level4;
@override List<MatrixLevelModel> get level4 {
  if (_level4 is EqualUnmodifiableListView) return _level4;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_level4);
}

 final  List<MatrixLevelModel> _level5;
@override List<MatrixLevelModel> get level5 {
  if (_level5 is EqualUnmodifiableListView) return _level5;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_level5);
}


/// Create a copy of MatrixQuestionBankModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MatrixQuestionBankModelCopyWith<_MatrixQuestionBankModel> get copyWith => __$MatrixQuestionBankModelCopyWithImpl<_MatrixQuestionBankModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MatrixQuestionBankModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MatrixQuestionBankModel&&const DeepCollectionEquality().equals(other._level1, _level1)&&const DeepCollectionEquality().equals(other._level2, _level2)&&const DeepCollectionEquality().equals(other._level3, _level3)&&const DeepCollectionEquality().equals(other._level4, _level4)&&const DeepCollectionEquality().equals(other._level5, _level5));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_level1),const DeepCollectionEquality().hash(_level2),const DeepCollectionEquality().hash(_level3),const DeepCollectionEquality().hash(_level4),const DeepCollectionEquality().hash(_level5));

@override
String toString() {
  return 'MatrixQuestionBankModel(level1: $level1, level2: $level2, level3: $level3, level4: $level4, level5: $level5)';
}


}

/// @nodoc
abstract mixin class _$MatrixQuestionBankModelCopyWith<$Res> implements $MatrixQuestionBankModelCopyWith<$Res> {
  factory _$MatrixQuestionBankModelCopyWith(_MatrixQuestionBankModel value, $Res Function(_MatrixQuestionBankModel) _then) = __$MatrixQuestionBankModelCopyWithImpl;
@override @useResult
$Res call({
 List<MatrixLevelModel> level1, List<MatrixLevelModel> level2, List<MatrixLevelModel> level3, List<MatrixLevelModel> level4, List<MatrixLevelModel> level5
});




}
/// @nodoc
class __$MatrixQuestionBankModelCopyWithImpl<$Res>
    implements _$MatrixQuestionBankModelCopyWith<$Res> {
  __$MatrixQuestionBankModelCopyWithImpl(this._self, this._then);

  final _MatrixQuestionBankModel _self;
  final $Res Function(_MatrixQuestionBankModel) _then;

/// Create a copy of MatrixQuestionBankModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? level1 = null,Object? level2 = null,Object? level3 = null,Object? level4 = null,Object? level5 = null,}) {
  return _then(_MatrixQuestionBankModel(
level1: null == level1 ? _self._level1 : level1 // ignore: cast_nullable_to_non_nullable
as List<MatrixLevelModel>,level2: null == level2 ? _self._level2 : level2 // ignore: cast_nullable_to_non_nullable
as List<MatrixLevelModel>,level3: null == level3 ? _self._level3 : level3 // ignore: cast_nullable_to_non_nullable
as List<MatrixLevelModel>,level4: null == level4 ? _self._level4 : level4 // ignore: cast_nullable_to_non_nullable
as List<MatrixLevelModel>,level5: null == level5 ? _self._level5 : level5 // ignore: cast_nullable_to_non_nullable
as List<MatrixLevelModel>,
  ));
}


}

// dart format on
