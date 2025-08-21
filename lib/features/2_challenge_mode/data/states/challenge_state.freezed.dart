// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'challenge_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ChallengeState {

 ChallengeLevelModel? get currentLevel; String? get currentDifficulty; QuestionModel? get currentQuestion; int? get correctAnswer; int? get wrongAnswer; bool? get isLoading;
/// Create a copy of ChallengeState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChallengeStateCopyWith<ChallengeState> get copyWith => _$ChallengeStateCopyWithImpl<ChallengeState>(this as ChallengeState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChallengeState&&(identical(other.currentLevel, currentLevel) || other.currentLevel == currentLevel)&&(identical(other.currentDifficulty, currentDifficulty) || other.currentDifficulty == currentDifficulty)&&(identical(other.currentQuestion, currentQuestion) || other.currentQuestion == currentQuestion)&&(identical(other.correctAnswer, correctAnswer) || other.correctAnswer == correctAnswer)&&(identical(other.wrongAnswer, wrongAnswer) || other.wrongAnswer == wrongAnswer)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading));
}


@override
int get hashCode => Object.hash(runtimeType,currentLevel,currentDifficulty,currentQuestion,correctAnswer,wrongAnswer,isLoading);

@override
String toString() {
  return 'ChallengeState(currentLevel: $currentLevel, currentDifficulty: $currentDifficulty, currentQuestion: $currentQuestion, correctAnswer: $correctAnswer, wrongAnswer: $wrongAnswer, isLoading: $isLoading)';
}


}

/// @nodoc
abstract mixin class $ChallengeStateCopyWith<$Res>  {
  factory $ChallengeStateCopyWith(ChallengeState value, $Res Function(ChallengeState) _then) = _$ChallengeStateCopyWithImpl;
@useResult
$Res call({
 ChallengeLevelModel? currentLevel, String? currentDifficulty, QuestionModel? currentQuestion, int? correctAnswer, int? wrongAnswer, bool? isLoading
});


$ChallengeLevelModelCopyWith<$Res>? get currentLevel;$QuestionModelCopyWith<$Res>? get currentQuestion;

}
/// @nodoc
class _$ChallengeStateCopyWithImpl<$Res>
    implements $ChallengeStateCopyWith<$Res> {
  _$ChallengeStateCopyWithImpl(this._self, this._then);

  final ChallengeState _self;
  final $Res Function(ChallengeState) _then;

/// Create a copy of ChallengeState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? currentLevel = freezed,Object? currentDifficulty = freezed,Object? currentQuestion = freezed,Object? correctAnswer = freezed,Object? wrongAnswer = freezed,Object? isLoading = freezed,}) {
  return _then(_self.copyWith(
currentLevel: freezed == currentLevel ? _self.currentLevel : currentLevel // ignore: cast_nullable_to_non_nullable
as ChallengeLevelModel?,currentDifficulty: freezed == currentDifficulty ? _self.currentDifficulty : currentDifficulty // ignore: cast_nullable_to_non_nullable
as String?,currentQuestion: freezed == currentQuestion ? _self.currentQuestion : currentQuestion // ignore: cast_nullable_to_non_nullable
as QuestionModel?,correctAnswer: freezed == correctAnswer ? _self.correctAnswer : correctAnswer // ignore: cast_nullable_to_non_nullable
as int?,wrongAnswer: freezed == wrongAnswer ? _self.wrongAnswer : wrongAnswer // ignore: cast_nullable_to_non_nullable
as int?,isLoading: freezed == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}
/// Create a copy of ChallengeState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ChallengeLevelModelCopyWith<$Res>? get currentLevel {
    if (_self.currentLevel == null) {
    return null;
  }

  return $ChallengeLevelModelCopyWith<$Res>(_self.currentLevel!, (value) {
    return _then(_self.copyWith(currentLevel: value));
  });
}/// Create a copy of ChallengeState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$QuestionModelCopyWith<$Res>? get currentQuestion {
    if (_self.currentQuestion == null) {
    return null;
  }

  return $QuestionModelCopyWith<$Res>(_self.currentQuestion!, (value) {
    return _then(_self.copyWith(currentQuestion: value));
  });
}
}


/// Adds pattern-matching-related methods to [ChallengeState].
extension ChallengeStatePatterns on ChallengeState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ChallengeState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ChallengeState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ChallengeState value)  $default,){
final _that = this;
switch (_that) {
case _ChallengeState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ChallengeState value)?  $default,){
final _that = this;
switch (_that) {
case _ChallengeState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( ChallengeLevelModel? currentLevel,  String? currentDifficulty,  QuestionModel? currentQuestion,  int? correctAnswer,  int? wrongAnswer,  bool? isLoading)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ChallengeState() when $default != null:
return $default(_that.currentLevel,_that.currentDifficulty,_that.currentQuestion,_that.correctAnswer,_that.wrongAnswer,_that.isLoading);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( ChallengeLevelModel? currentLevel,  String? currentDifficulty,  QuestionModel? currentQuestion,  int? correctAnswer,  int? wrongAnswer,  bool? isLoading)  $default,) {final _that = this;
switch (_that) {
case _ChallengeState():
return $default(_that.currentLevel,_that.currentDifficulty,_that.currentQuestion,_that.correctAnswer,_that.wrongAnswer,_that.isLoading);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( ChallengeLevelModel? currentLevel,  String? currentDifficulty,  QuestionModel? currentQuestion,  int? correctAnswer,  int? wrongAnswer,  bool? isLoading)?  $default,) {final _that = this;
switch (_that) {
case _ChallengeState() when $default != null:
return $default(_that.currentLevel,_that.currentDifficulty,_that.currentQuestion,_that.correctAnswer,_that.wrongAnswer,_that.isLoading);case _:
  return null;

}
}

}

/// @nodoc


class _ChallengeState implements ChallengeState {
  const _ChallengeState({this.currentLevel, this.currentDifficulty, this.currentQuestion, this.correctAnswer, this.wrongAnswer, this.isLoading});
  

@override final  ChallengeLevelModel? currentLevel;
@override final  String? currentDifficulty;
@override final  QuestionModel? currentQuestion;
@override final  int? correctAnswer;
@override final  int? wrongAnswer;
@override final  bool? isLoading;

/// Create a copy of ChallengeState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChallengeStateCopyWith<_ChallengeState> get copyWith => __$ChallengeStateCopyWithImpl<_ChallengeState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChallengeState&&(identical(other.currentLevel, currentLevel) || other.currentLevel == currentLevel)&&(identical(other.currentDifficulty, currentDifficulty) || other.currentDifficulty == currentDifficulty)&&(identical(other.currentQuestion, currentQuestion) || other.currentQuestion == currentQuestion)&&(identical(other.correctAnswer, correctAnswer) || other.correctAnswer == correctAnswer)&&(identical(other.wrongAnswer, wrongAnswer) || other.wrongAnswer == wrongAnswer)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading));
}


@override
int get hashCode => Object.hash(runtimeType,currentLevel,currentDifficulty,currentQuestion,correctAnswer,wrongAnswer,isLoading);

@override
String toString() {
  return 'ChallengeState(currentLevel: $currentLevel, currentDifficulty: $currentDifficulty, currentQuestion: $currentQuestion, correctAnswer: $correctAnswer, wrongAnswer: $wrongAnswer, isLoading: $isLoading)';
}


}

/// @nodoc
abstract mixin class _$ChallengeStateCopyWith<$Res> implements $ChallengeStateCopyWith<$Res> {
  factory _$ChallengeStateCopyWith(_ChallengeState value, $Res Function(_ChallengeState) _then) = __$ChallengeStateCopyWithImpl;
@override @useResult
$Res call({
 ChallengeLevelModel? currentLevel, String? currentDifficulty, QuestionModel? currentQuestion, int? correctAnswer, int? wrongAnswer, bool? isLoading
});


@override $ChallengeLevelModelCopyWith<$Res>? get currentLevel;@override $QuestionModelCopyWith<$Res>? get currentQuestion;

}
/// @nodoc
class __$ChallengeStateCopyWithImpl<$Res>
    implements _$ChallengeStateCopyWith<$Res> {
  __$ChallengeStateCopyWithImpl(this._self, this._then);

  final _ChallengeState _self;
  final $Res Function(_ChallengeState) _then;

/// Create a copy of ChallengeState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? currentLevel = freezed,Object? currentDifficulty = freezed,Object? currentQuestion = freezed,Object? correctAnswer = freezed,Object? wrongAnswer = freezed,Object? isLoading = freezed,}) {
  return _then(_ChallengeState(
currentLevel: freezed == currentLevel ? _self.currentLevel : currentLevel // ignore: cast_nullable_to_non_nullable
as ChallengeLevelModel?,currentDifficulty: freezed == currentDifficulty ? _self.currentDifficulty : currentDifficulty // ignore: cast_nullable_to_non_nullable
as String?,currentQuestion: freezed == currentQuestion ? _self.currentQuestion : currentQuestion // ignore: cast_nullable_to_non_nullable
as QuestionModel?,correctAnswer: freezed == correctAnswer ? _self.correctAnswer : correctAnswer // ignore: cast_nullable_to_non_nullable
as int?,wrongAnswer: freezed == wrongAnswer ? _self.wrongAnswer : wrongAnswer // ignore: cast_nullable_to_non_nullable
as int?,isLoading: freezed == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}

/// Create a copy of ChallengeState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ChallengeLevelModelCopyWith<$Res>? get currentLevel {
    if (_self.currentLevel == null) {
    return null;
  }

  return $ChallengeLevelModelCopyWith<$Res>(_self.currentLevel!, (value) {
    return _then(_self.copyWith(currentLevel: value));
  });
}/// Create a copy of ChallengeState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$QuestionModelCopyWith<$Res>? get currentQuestion {
    if (_self.currentQuestion == null) {
    return null;
  }

  return $QuestionModelCopyWith<$Res>(_self.currentQuestion!, (value) {
    return _then(_self.copyWith(currentQuestion: value));
  });
}
}

// dart format on
