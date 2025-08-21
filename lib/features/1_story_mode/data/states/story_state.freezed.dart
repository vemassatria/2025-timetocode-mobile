// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'story_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$StoryState {

 StoryModel? get activeLevel; PreDialogModel? get preDialog; DialogModel? get currentDialog; QuestionModel? get currentQuestion; int? get indexDialog; int? get correctAnswer; int? get wrongAnswer; bool? get falsePrevious; String? get activeMode; bool? get isLoading;
/// Create a copy of StoryState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StoryStateCopyWith<StoryState> get copyWith => _$StoryStateCopyWithImpl<StoryState>(this as StoryState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StoryState&&(identical(other.activeLevel, activeLevel) || other.activeLevel == activeLevel)&&(identical(other.preDialog, preDialog) || other.preDialog == preDialog)&&(identical(other.currentDialog, currentDialog) || other.currentDialog == currentDialog)&&(identical(other.currentQuestion, currentQuestion) || other.currentQuestion == currentQuestion)&&(identical(other.indexDialog, indexDialog) || other.indexDialog == indexDialog)&&(identical(other.correctAnswer, correctAnswer) || other.correctAnswer == correctAnswer)&&(identical(other.wrongAnswer, wrongAnswer) || other.wrongAnswer == wrongAnswer)&&(identical(other.falsePrevious, falsePrevious) || other.falsePrevious == falsePrevious)&&(identical(other.activeMode, activeMode) || other.activeMode == activeMode)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading));
}


@override
int get hashCode => Object.hash(runtimeType,activeLevel,preDialog,currentDialog,currentQuestion,indexDialog,correctAnswer,wrongAnswer,falsePrevious,activeMode,isLoading);

@override
String toString() {
  return 'StoryState(activeLevel: $activeLevel, preDialog: $preDialog, currentDialog: $currentDialog, currentQuestion: $currentQuestion, indexDialog: $indexDialog, correctAnswer: $correctAnswer, wrongAnswer: $wrongAnswer, falsePrevious: $falsePrevious, activeMode: $activeMode, isLoading: $isLoading)';
}


}

/// @nodoc
abstract mixin class $StoryStateCopyWith<$Res>  {
  factory $StoryStateCopyWith(StoryState value, $Res Function(StoryState) _then) = _$StoryStateCopyWithImpl;
@useResult
$Res call({
 StoryModel? activeLevel, PreDialogModel? preDialog, DialogModel? currentDialog, QuestionModel? currentQuestion, int? indexDialog, int? correctAnswer, int? wrongAnswer, bool? falsePrevious, String? activeMode, bool? isLoading
});


$StoryModelCopyWith<$Res>? get activeLevel;$PreDialogModelCopyWith<$Res>? get preDialog;$DialogModelCopyWith<$Res>? get currentDialog;$QuestionModelCopyWith<$Res>? get currentQuestion;

}
/// @nodoc
class _$StoryStateCopyWithImpl<$Res>
    implements $StoryStateCopyWith<$Res> {
  _$StoryStateCopyWithImpl(this._self, this._then);

  final StoryState _self;
  final $Res Function(StoryState) _then;

/// Create a copy of StoryState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? activeLevel = freezed,Object? preDialog = freezed,Object? currentDialog = freezed,Object? currentQuestion = freezed,Object? indexDialog = freezed,Object? correctAnswer = freezed,Object? wrongAnswer = freezed,Object? falsePrevious = freezed,Object? activeMode = freezed,Object? isLoading = freezed,}) {
  return _then(_self.copyWith(
activeLevel: freezed == activeLevel ? _self.activeLevel : activeLevel // ignore: cast_nullable_to_non_nullable
as StoryModel?,preDialog: freezed == preDialog ? _self.preDialog : preDialog // ignore: cast_nullable_to_non_nullable
as PreDialogModel?,currentDialog: freezed == currentDialog ? _self.currentDialog : currentDialog // ignore: cast_nullable_to_non_nullable
as DialogModel?,currentQuestion: freezed == currentQuestion ? _self.currentQuestion : currentQuestion // ignore: cast_nullable_to_non_nullable
as QuestionModel?,indexDialog: freezed == indexDialog ? _self.indexDialog : indexDialog // ignore: cast_nullable_to_non_nullable
as int?,correctAnswer: freezed == correctAnswer ? _self.correctAnswer : correctAnswer // ignore: cast_nullable_to_non_nullable
as int?,wrongAnswer: freezed == wrongAnswer ? _self.wrongAnswer : wrongAnswer // ignore: cast_nullable_to_non_nullable
as int?,falsePrevious: freezed == falsePrevious ? _self.falsePrevious : falsePrevious // ignore: cast_nullable_to_non_nullable
as bool?,activeMode: freezed == activeMode ? _self.activeMode : activeMode // ignore: cast_nullable_to_non_nullable
as String?,isLoading: freezed == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}
/// Create a copy of StoryState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$StoryModelCopyWith<$Res>? get activeLevel {
    if (_self.activeLevel == null) {
    return null;
  }

  return $StoryModelCopyWith<$Res>(_self.activeLevel!, (value) {
    return _then(_self.copyWith(activeLevel: value));
  });
}/// Create a copy of StoryState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PreDialogModelCopyWith<$Res>? get preDialog {
    if (_self.preDialog == null) {
    return null;
  }

  return $PreDialogModelCopyWith<$Res>(_self.preDialog!, (value) {
    return _then(_self.copyWith(preDialog: value));
  });
}/// Create a copy of StoryState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DialogModelCopyWith<$Res>? get currentDialog {
    if (_self.currentDialog == null) {
    return null;
  }

  return $DialogModelCopyWith<$Res>(_self.currentDialog!, (value) {
    return _then(_self.copyWith(currentDialog: value));
  });
}/// Create a copy of StoryState
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


/// Adds pattern-matching-related methods to [StoryState].
extension StoryStatePatterns on StoryState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StoryState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StoryState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StoryState value)  $default,){
final _that = this;
switch (_that) {
case _StoryState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StoryState value)?  $default,){
final _that = this;
switch (_that) {
case _StoryState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( StoryModel? activeLevel,  PreDialogModel? preDialog,  DialogModel? currentDialog,  QuestionModel? currentQuestion,  int? indexDialog,  int? correctAnswer,  int? wrongAnswer,  bool? falsePrevious,  String? activeMode,  bool? isLoading)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StoryState() when $default != null:
return $default(_that.activeLevel,_that.preDialog,_that.currentDialog,_that.currentQuestion,_that.indexDialog,_that.correctAnswer,_that.wrongAnswer,_that.falsePrevious,_that.activeMode,_that.isLoading);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( StoryModel? activeLevel,  PreDialogModel? preDialog,  DialogModel? currentDialog,  QuestionModel? currentQuestion,  int? indexDialog,  int? correctAnswer,  int? wrongAnswer,  bool? falsePrevious,  String? activeMode,  bool? isLoading)  $default,) {final _that = this;
switch (_that) {
case _StoryState():
return $default(_that.activeLevel,_that.preDialog,_that.currentDialog,_that.currentQuestion,_that.indexDialog,_that.correctAnswer,_that.wrongAnswer,_that.falsePrevious,_that.activeMode,_that.isLoading);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( StoryModel? activeLevel,  PreDialogModel? preDialog,  DialogModel? currentDialog,  QuestionModel? currentQuestion,  int? indexDialog,  int? correctAnswer,  int? wrongAnswer,  bool? falsePrevious,  String? activeMode,  bool? isLoading)?  $default,) {final _that = this;
switch (_that) {
case _StoryState() when $default != null:
return $default(_that.activeLevel,_that.preDialog,_that.currentDialog,_that.currentQuestion,_that.indexDialog,_that.correctAnswer,_that.wrongAnswer,_that.falsePrevious,_that.activeMode,_that.isLoading);case _:
  return null;

}
}

}

/// @nodoc


class _StoryState implements StoryState {
  const _StoryState({this.activeLevel, this.preDialog, this.currentDialog, this.currentQuestion, this.indexDialog, this.correctAnswer, this.wrongAnswer, this.falsePrevious, this.activeMode, this.isLoading});
  

@override final  StoryModel? activeLevel;
@override final  PreDialogModel? preDialog;
@override final  DialogModel? currentDialog;
@override final  QuestionModel? currentQuestion;
@override final  int? indexDialog;
@override final  int? correctAnswer;
@override final  int? wrongAnswer;
@override final  bool? falsePrevious;
@override final  String? activeMode;
@override final  bool? isLoading;

/// Create a copy of StoryState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StoryStateCopyWith<_StoryState> get copyWith => __$StoryStateCopyWithImpl<_StoryState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StoryState&&(identical(other.activeLevel, activeLevel) || other.activeLevel == activeLevel)&&(identical(other.preDialog, preDialog) || other.preDialog == preDialog)&&(identical(other.currentDialog, currentDialog) || other.currentDialog == currentDialog)&&(identical(other.currentQuestion, currentQuestion) || other.currentQuestion == currentQuestion)&&(identical(other.indexDialog, indexDialog) || other.indexDialog == indexDialog)&&(identical(other.correctAnswer, correctAnswer) || other.correctAnswer == correctAnswer)&&(identical(other.wrongAnswer, wrongAnswer) || other.wrongAnswer == wrongAnswer)&&(identical(other.falsePrevious, falsePrevious) || other.falsePrevious == falsePrevious)&&(identical(other.activeMode, activeMode) || other.activeMode == activeMode)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading));
}


@override
int get hashCode => Object.hash(runtimeType,activeLevel,preDialog,currentDialog,currentQuestion,indexDialog,correctAnswer,wrongAnswer,falsePrevious,activeMode,isLoading);

@override
String toString() {
  return 'StoryState(activeLevel: $activeLevel, preDialog: $preDialog, currentDialog: $currentDialog, currentQuestion: $currentQuestion, indexDialog: $indexDialog, correctAnswer: $correctAnswer, wrongAnswer: $wrongAnswer, falsePrevious: $falsePrevious, activeMode: $activeMode, isLoading: $isLoading)';
}


}

/// @nodoc
abstract mixin class _$StoryStateCopyWith<$Res> implements $StoryStateCopyWith<$Res> {
  factory _$StoryStateCopyWith(_StoryState value, $Res Function(_StoryState) _then) = __$StoryStateCopyWithImpl;
@override @useResult
$Res call({
 StoryModel? activeLevel, PreDialogModel? preDialog, DialogModel? currentDialog, QuestionModel? currentQuestion, int? indexDialog, int? correctAnswer, int? wrongAnswer, bool? falsePrevious, String? activeMode, bool? isLoading
});


@override $StoryModelCopyWith<$Res>? get activeLevel;@override $PreDialogModelCopyWith<$Res>? get preDialog;@override $DialogModelCopyWith<$Res>? get currentDialog;@override $QuestionModelCopyWith<$Res>? get currentQuestion;

}
/// @nodoc
class __$StoryStateCopyWithImpl<$Res>
    implements _$StoryStateCopyWith<$Res> {
  __$StoryStateCopyWithImpl(this._self, this._then);

  final _StoryState _self;
  final $Res Function(_StoryState) _then;

/// Create a copy of StoryState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? activeLevel = freezed,Object? preDialog = freezed,Object? currentDialog = freezed,Object? currentQuestion = freezed,Object? indexDialog = freezed,Object? correctAnswer = freezed,Object? wrongAnswer = freezed,Object? falsePrevious = freezed,Object? activeMode = freezed,Object? isLoading = freezed,}) {
  return _then(_StoryState(
activeLevel: freezed == activeLevel ? _self.activeLevel : activeLevel // ignore: cast_nullable_to_non_nullable
as StoryModel?,preDialog: freezed == preDialog ? _self.preDialog : preDialog // ignore: cast_nullable_to_non_nullable
as PreDialogModel?,currentDialog: freezed == currentDialog ? _self.currentDialog : currentDialog // ignore: cast_nullable_to_non_nullable
as DialogModel?,currentQuestion: freezed == currentQuestion ? _self.currentQuestion : currentQuestion // ignore: cast_nullable_to_non_nullable
as QuestionModel?,indexDialog: freezed == indexDialog ? _self.indexDialog : indexDialog // ignore: cast_nullable_to_non_nullable
as int?,correctAnswer: freezed == correctAnswer ? _self.correctAnswer : correctAnswer // ignore: cast_nullable_to_non_nullable
as int?,wrongAnswer: freezed == wrongAnswer ? _self.wrongAnswer : wrongAnswer // ignore: cast_nullable_to_non_nullable
as int?,falsePrevious: freezed == falsePrevious ? _self.falsePrevious : falsePrevious // ignore: cast_nullable_to_non_nullable
as bool?,activeMode: freezed == activeMode ? _self.activeMode : activeMode // ignore: cast_nullable_to_non_nullable
as String?,isLoading: freezed == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}

/// Create a copy of StoryState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$StoryModelCopyWith<$Res>? get activeLevel {
    if (_self.activeLevel == null) {
    return null;
  }

  return $StoryModelCopyWith<$Res>(_self.activeLevel!, (value) {
    return _then(_self.copyWith(activeLevel: value));
  });
}/// Create a copy of StoryState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PreDialogModelCopyWith<$Res>? get preDialog {
    if (_self.preDialog == null) {
    return null;
  }

  return $PreDialogModelCopyWith<$Res>(_self.preDialog!, (value) {
    return _then(_self.copyWith(preDialog: value));
  });
}/// Create a copy of StoryState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DialogModelCopyWith<$Res>? get currentDialog {
    if (_self.currentDialog == null) {
    return null;
  }

  return $DialogModelCopyWith<$Res>(_self.currentDialog!, (value) {
    return _then(_self.copyWith(currentDialog: value));
  });
}/// Create a copy of StoryState
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
