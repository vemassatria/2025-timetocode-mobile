// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'question_difficulty_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$QuestionDifficultyModel {

 List<QuestionModel> get mudah; List<QuestionModel> get sedang; List<QuestionModel> get susah;
/// Create a copy of QuestionDifficultyModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$QuestionDifficultyModelCopyWith<QuestionDifficultyModel> get copyWith => _$QuestionDifficultyModelCopyWithImpl<QuestionDifficultyModel>(this as QuestionDifficultyModel, _$identity);

  /// Serializes this QuestionDifficultyModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is QuestionDifficultyModel&&const DeepCollectionEquality().equals(other.mudah, mudah)&&const DeepCollectionEquality().equals(other.sedang, sedang)&&const DeepCollectionEquality().equals(other.susah, susah));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(mudah),const DeepCollectionEquality().hash(sedang),const DeepCollectionEquality().hash(susah));

@override
String toString() {
  return 'QuestionDifficultyModel(mudah: $mudah, sedang: $sedang, susah: $susah)';
}


}

/// @nodoc
abstract mixin class $QuestionDifficultyModelCopyWith<$Res>  {
  factory $QuestionDifficultyModelCopyWith(QuestionDifficultyModel value, $Res Function(QuestionDifficultyModel) _then) = _$QuestionDifficultyModelCopyWithImpl;
@useResult
$Res call({
 List<QuestionModel> mudah, List<QuestionModel> sedang, List<QuestionModel> susah
});




}
/// @nodoc
class _$QuestionDifficultyModelCopyWithImpl<$Res>
    implements $QuestionDifficultyModelCopyWith<$Res> {
  _$QuestionDifficultyModelCopyWithImpl(this._self, this._then);

  final QuestionDifficultyModel _self;
  final $Res Function(QuestionDifficultyModel) _then;

/// Create a copy of QuestionDifficultyModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? mudah = null,Object? sedang = null,Object? susah = null,}) {
  return _then(_self.copyWith(
mudah: null == mudah ? _self.mudah : mudah // ignore: cast_nullable_to_non_nullable
as List<QuestionModel>,sedang: null == sedang ? _self.sedang : sedang // ignore: cast_nullable_to_non_nullable
as List<QuestionModel>,susah: null == susah ? _self.susah : susah // ignore: cast_nullable_to_non_nullable
as List<QuestionModel>,
  ));
}

}


/// Adds pattern-matching-related methods to [QuestionDifficultyModel].
extension QuestionDifficultyModelPatterns on QuestionDifficultyModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _QuestionDifficultyModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _QuestionDifficultyModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _QuestionDifficultyModel value)  $default,){
final _that = this;
switch (_that) {
case _QuestionDifficultyModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _QuestionDifficultyModel value)?  $default,){
final _that = this;
switch (_that) {
case _QuestionDifficultyModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<QuestionModel> mudah,  List<QuestionModel> sedang,  List<QuestionModel> susah)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _QuestionDifficultyModel() when $default != null:
return $default(_that.mudah,_that.sedang,_that.susah);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<QuestionModel> mudah,  List<QuestionModel> sedang,  List<QuestionModel> susah)  $default,) {final _that = this;
switch (_that) {
case _QuestionDifficultyModel():
return $default(_that.mudah,_that.sedang,_that.susah);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<QuestionModel> mudah,  List<QuestionModel> sedang,  List<QuestionModel> susah)?  $default,) {final _that = this;
switch (_that) {
case _QuestionDifficultyModel() when $default != null:
return $default(_that.mudah,_that.sedang,_that.susah);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _QuestionDifficultyModel implements QuestionDifficultyModel {
  const _QuestionDifficultyModel({required final  List<QuestionModel> mudah, required final  List<QuestionModel> sedang, required final  List<QuestionModel> susah}): _mudah = mudah,_sedang = sedang,_susah = susah;
  factory _QuestionDifficultyModel.fromJson(Map<String, dynamic> json) => _$QuestionDifficultyModelFromJson(json);

 final  List<QuestionModel> _mudah;
@override List<QuestionModel> get mudah {
  if (_mudah is EqualUnmodifiableListView) return _mudah;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_mudah);
}

 final  List<QuestionModel> _sedang;
@override List<QuestionModel> get sedang {
  if (_sedang is EqualUnmodifiableListView) return _sedang;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_sedang);
}

 final  List<QuestionModel> _susah;
@override List<QuestionModel> get susah {
  if (_susah is EqualUnmodifiableListView) return _susah;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_susah);
}


/// Create a copy of QuestionDifficultyModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$QuestionDifficultyModelCopyWith<_QuestionDifficultyModel> get copyWith => __$QuestionDifficultyModelCopyWithImpl<_QuestionDifficultyModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$QuestionDifficultyModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _QuestionDifficultyModel&&const DeepCollectionEquality().equals(other._mudah, _mudah)&&const DeepCollectionEquality().equals(other._sedang, _sedang)&&const DeepCollectionEquality().equals(other._susah, _susah));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_mudah),const DeepCollectionEquality().hash(_sedang),const DeepCollectionEquality().hash(_susah));

@override
String toString() {
  return 'QuestionDifficultyModel(mudah: $mudah, sedang: $sedang, susah: $susah)';
}


}

/// @nodoc
abstract mixin class _$QuestionDifficultyModelCopyWith<$Res> implements $QuestionDifficultyModelCopyWith<$Res> {
  factory _$QuestionDifficultyModelCopyWith(_QuestionDifficultyModel value, $Res Function(_QuestionDifficultyModel) _then) = __$QuestionDifficultyModelCopyWithImpl;
@override @useResult
$Res call({
 List<QuestionModel> mudah, List<QuestionModel> sedang, List<QuestionModel> susah
});




}
/// @nodoc
class __$QuestionDifficultyModelCopyWithImpl<$Res>
    implements _$QuestionDifficultyModelCopyWith<$Res> {
  __$QuestionDifficultyModelCopyWithImpl(this._self, this._then);

  final _QuestionDifficultyModel _self;
  final $Res Function(_QuestionDifficultyModel) _then;

/// Create a copy of QuestionDifficultyModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? mudah = null,Object? sedang = null,Object? susah = null,}) {
  return _then(_QuestionDifficultyModel(
mudah: null == mudah ? _self._mudah : mudah // ignore: cast_nullable_to_non_nullable
as List<QuestionModel>,sedang: null == sedang ? _self._sedang : sedang // ignore: cast_nullable_to_non_nullable
as List<QuestionModel>,susah: null == susah ? _self._susah : susah // ignore: cast_nullable_to_non_nullable
as List<QuestionModel>,
  ));
}


}

// dart format on
