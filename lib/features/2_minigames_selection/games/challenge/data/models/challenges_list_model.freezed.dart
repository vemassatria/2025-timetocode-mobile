// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'challenges_list_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ChallengesListModel {

 List<ChallengeModel> get challenges;
/// Create a copy of ChallengesListModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChallengesListModelCopyWith<ChallengesListModel> get copyWith => _$ChallengesListModelCopyWithImpl<ChallengesListModel>(this as ChallengesListModel, _$identity);

  /// Serializes this ChallengesListModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChallengesListModel&&const DeepCollectionEquality().equals(other.challenges, challenges));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(challenges));

@override
String toString() {
  return 'ChallengesListModel(challenges: $challenges)';
}


}

/// @nodoc
abstract mixin class $ChallengesListModelCopyWith<$Res>  {
  factory $ChallengesListModelCopyWith(ChallengesListModel value, $Res Function(ChallengesListModel) _then) = _$ChallengesListModelCopyWithImpl;
@useResult
$Res call({
 List<ChallengeModel> challenges
});




}
/// @nodoc
class _$ChallengesListModelCopyWithImpl<$Res>
    implements $ChallengesListModelCopyWith<$Res> {
  _$ChallengesListModelCopyWithImpl(this._self, this._then);

  final ChallengesListModel _self;
  final $Res Function(ChallengesListModel) _then;

/// Create a copy of ChallengesListModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? challenges = null,}) {
  return _then(_self.copyWith(
challenges: null == challenges ? _self.challenges : challenges // ignore: cast_nullable_to_non_nullable
as List<ChallengeModel>,
  ));
}

}


/// Adds pattern-matching-related methods to [ChallengesListModel].
extension ChallengesListModelPatterns on ChallengesListModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ChallengesListModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ChallengesListModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ChallengesListModel value)  $default,){
final _that = this;
switch (_that) {
case _ChallengesListModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ChallengesListModel value)?  $default,){
final _that = this;
switch (_that) {
case _ChallengesListModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<ChallengeModel> challenges)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ChallengesListModel() when $default != null:
return $default(_that.challenges);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<ChallengeModel> challenges)  $default,) {final _that = this;
switch (_that) {
case _ChallengesListModel():
return $default(_that.challenges);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<ChallengeModel> challenges)?  $default,) {final _that = this;
switch (_that) {
case _ChallengesListModel() when $default != null:
return $default(_that.challenges);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ChallengesListModel implements ChallengesListModel {
  const _ChallengesListModel({required final  List<ChallengeModel> challenges}): _challenges = challenges;
  factory _ChallengesListModel.fromJson(Map<String, dynamic> json) => _$ChallengesListModelFromJson(json);

 final  List<ChallengeModel> _challenges;
@override List<ChallengeModel> get challenges {
  if (_challenges is EqualUnmodifiableListView) return _challenges;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_challenges);
}


/// Create a copy of ChallengesListModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChallengesListModelCopyWith<_ChallengesListModel> get copyWith => __$ChallengesListModelCopyWithImpl<_ChallengesListModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ChallengesListModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChallengesListModel&&const DeepCollectionEquality().equals(other._challenges, _challenges));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_challenges));

@override
String toString() {
  return 'ChallengesListModel(challenges: $challenges)';
}


}

/// @nodoc
abstract mixin class _$ChallengesListModelCopyWith<$Res> implements $ChallengesListModelCopyWith<$Res> {
  factory _$ChallengesListModelCopyWith(_ChallengesListModel value, $Res Function(_ChallengesListModel) _then) = __$ChallengesListModelCopyWithImpl;
@override @useResult
$Res call({
 List<ChallengeModel> challenges
});




}
/// @nodoc
class __$ChallengesListModelCopyWithImpl<$Res>
    implements _$ChallengesListModelCopyWith<$Res> {
  __$ChallengesListModelCopyWithImpl(this._self, this._then);

  final _ChallengesListModel _self;
  final $Res Function(_ChallengesListModel) _then;

/// Create a copy of ChallengesListModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? challenges = null,}) {
  return _then(_ChallengesListModel(
challenges: null == challenges ? _self._challenges : challenges // ignore: cast_nullable_to_non_nullable
as List<ChallengeModel>,
  ));
}


}

// dart format on
