// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'challenge_progress_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ChallengeProgressState {

 int get level; int get stars;
/// Create a copy of ChallengeProgressState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChallengeProgressStateCopyWith<ChallengeProgressState> get copyWith => _$ChallengeProgressStateCopyWithImpl<ChallengeProgressState>(this as ChallengeProgressState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChallengeProgressState&&(identical(other.level, level) || other.level == level)&&(identical(other.stars, stars) || other.stars == stars));
}


@override
int get hashCode => Object.hash(runtimeType,level,stars);

@override
String toString() {
  return 'ChallengeProgressState(level: $level, stars: $stars)';
}


}

/// @nodoc
abstract mixin class $ChallengeProgressStateCopyWith<$Res>  {
  factory $ChallengeProgressStateCopyWith(ChallengeProgressState value, $Res Function(ChallengeProgressState) _then) = _$ChallengeProgressStateCopyWithImpl;
@useResult
$Res call({
 int level, int stars
});




}
/// @nodoc
class _$ChallengeProgressStateCopyWithImpl<$Res>
    implements $ChallengeProgressStateCopyWith<$Res> {
  _$ChallengeProgressStateCopyWithImpl(this._self, this._then);

  final ChallengeProgressState _self;
  final $Res Function(ChallengeProgressState) _then;

/// Create a copy of ChallengeProgressState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? level = null,Object? stars = null,}) {
  return _then(_self.copyWith(
level: null == level ? _self.level : level // ignore: cast_nullable_to_non_nullable
as int,stars: null == stars ? _self.stars : stars // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [ChallengeProgressState].
extension ChallengeProgressStatePatterns on ChallengeProgressState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ChallengeProgressState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ChallengeProgressState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ChallengeProgressState value)  $default,){
final _that = this;
switch (_that) {
case _ChallengeProgressState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ChallengeProgressState value)?  $default,){
final _that = this;
switch (_that) {
case _ChallengeProgressState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int level,  int stars)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ChallengeProgressState() when $default != null:
return $default(_that.level,_that.stars);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int level,  int stars)  $default,) {final _that = this;
switch (_that) {
case _ChallengeProgressState():
return $default(_that.level,_that.stars);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int level,  int stars)?  $default,) {final _that = this;
switch (_that) {
case _ChallengeProgressState() when $default != null:
return $default(_that.level,_that.stars);case _:
  return null;

}
}

}

/// @nodoc


class _ChallengeProgressState implements ChallengeProgressState {
  const _ChallengeProgressState({required this.level, required this.stars});
  

@override final  int level;
@override final  int stars;

/// Create a copy of ChallengeProgressState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChallengeProgressStateCopyWith<_ChallengeProgressState> get copyWith => __$ChallengeProgressStateCopyWithImpl<_ChallengeProgressState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChallengeProgressState&&(identical(other.level, level) || other.level == level)&&(identical(other.stars, stars) || other.stars == stars));
}


@override
int get hashCode => Object.hash(runtimeType,level,stars);

@override
String toString() {
  return 'ChallengeProgressState(level: $level, stars: $stars)';
}


}

/// @nodoc
abstract mixin class _$ChallengeProgressStateCopyWith<$Res> implements $ChallengeProgressStateCopyWith<$Res> {
  factory _$ChallengeProgressStateCopyWith(_ChallengeProgressState value, $Res Function(_ChallengeProgressState) _then) = __$ChallengeProgressStateCopyWithImpl;
@override @useResult
$Res call({
 int level, int stars
});




}
/// @nodoc
class __$ChallengeProgressStateCopyWithImpl<$Res>
    implements _$ChallengeProgressStateCopyWith<$Res> {
  __$ChallengeProgressStateCopyWithImpl(this._self, this._then);

  final _ChallengeProgressState _self;
  final $Res Function(_ChallengeProgressState) _then;

/// Create a copy of ChallengeProgressState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? level = null,Object? stars = null,}) {
  return _then(_ChallengeProgressState(
level: null == level ? _self.level : level // ignore: cast_nullable_to_non_nullable
as int,stars: null == stars ? _self.stars : stars // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
