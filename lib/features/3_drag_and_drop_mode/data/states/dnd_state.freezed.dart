// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dnd_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$DndState {

 DragAndDropModel? get currentDragAndDrop; List<DraggableModel>? get availableOptions; List<DropZoneModel>? get dropZones; String? get modeGame; int? get correctAnswer; int? get wrongAnswer; bool? get isLoading;
/// Create a copy of DndState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DndStateCopyWith<DndState> get copyWith => _$DndStateCopyWithImpl<DndState>(this as DndState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DndState&&(identical(other.currentDragAndDrop, currentDragAndDrop) || other.currentDragAndDrop == currentDragAndDrop)&&const DeepCollectionEquality().equals(other.availableOptions, availableOptions)&&const DeepCollectionEquality().equals(other.dropZones, dropZones)&&(identical(other.modeGame, modeGame) || other.modeGame == modeGame)&&(identical(other.correctAnswer, correctAnswer) || other.correctAnswer == correctAnswer)&&(identical(other.wrongAnswer, wrongAnswer) || other.wrongAnswer == wrongAnswer)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading));
}


@override
int get hashCode => Object.hash(runtimeType,currentDragAndDrop,const DeepCollectionEquality().hash(availableOptions),const DeepCollectionEquality().hash(dropZones),modeGame,correctAnswer,wrongAnswer,isLoading);

@override
String toString() {
  return 'DndState(currentDragAndDrop: $currentDragAndDrop, availableOptions: $availableOptions, dropZones: $dropZones, modeGame: $modeGame, correctAnswer: $correctAnswer, wrongAnswer: $wrongAnswer, isLoading: $isLoading)';
}


}

/// @nodoc
abstract mixin class $DndStateCopyWith<$Res>  {
  factory $DndStateCopyWith(DndState value, $Res Function(DndState) _then) = _$DndStateCopyWithImpl;
@useResult
$Res call({
 DragAndDropModel? currentDragAndDrop, List<DraggableModel>? availableOptions, List<DropZoneModel>? dropZones, String? modeGame, int? correctAnswer, int? wrongAnswer, bool? isLoading
});


$DragAndDropModelCopyWith<$Res>? get currentDragAndDrop;

}
/// @nodoc
class _$DndStateCopyWithImpl<$Res>
    implements $DndStateCopyWith<$Res> {
  _$DndStateCopyWithImpl(this._self, this._then);

  final DndState _self;
  final $Res Function(DndState) _then;

/// Create a copy of DndState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? currentDragAndDrop = freezed,Object? availableOptions = freezed,Object? dropZones = freezed,Object? modeGame = freezed,Object? correctAnswer = freezed,Object? wrongAnswer = freezed,Object? isLoading = freezed,}) {
  return _then(_self.copyWith(
currentDragAndDrop: freezed == currentDragAndDrop ? _self.currentDragAndDrop : currentDragAndDrop // ignore: cast_nullable_to_non_nullable
as DragAndDropModel?,availableOptions: freezed == availableOptions ? _self.availableOptions : availableOptions // ignore: cast_nullable_to_non_nullable
as List<DraggableModel>?,dropZones: freezed == dropZones ? _self.dropZones : dropZones // ignore: cast_nullable_to_non_nullable
as List<DropZoneModel>?,modeGame: freezed == modeGame ? _self.modeGame : modeGame // ignore: cast_nullable_to_non_nullable
as String?,correctAnswer: freezed == correctAnswer ? _self.correctAnswer : correctAnswer // ignore: cast_nullable_to_non_nullable
as int?,wrongAnswer: freezed == wrongAnswer ? _self.wrongAnswer : wrongAnswer // ignore: cast_nullable_to_non_nullable
as int?,isLoading: freezed == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}
/// Create a copy of DndState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DragAndDropModelCopyWith<$Res>? get currentDragAndDrop {
    if (_self.currentDragAndDrop == null) {
    return null;
  }

  return $DragAndDropModelCopyWith<$Res>(_self.currentDragAndDrop!, (value) {
    return _then(_self.copyWith(currentDragAndDrop: value));
  });
}
}


/// Adds pattern-matching-related methods to [DndState].
extension DndStatePatterns on DndState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DndState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DndState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DndState value)  $default,){
final _that = this;
switch (_that) {
case _DndState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DndState value)?  $default,){
final _that = this;
switch (_that) {
case _DndState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( DragAndDropModel? currentDragAndDrop,  List<DraggableModel>? availableOptions,  List<DropZoneModel>? dropZones,  String? modeGame,  int? correctAnswer,  int? wrongAnswer,  bool? isLoading)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DndState() when $default != null:
return $default(_that.currentDragAndDrop,_that.availableOptions,_that.dropZones,_that.modeGame,_that.correctAnswer,_that.wrongAnswer,_that.isLoading);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( DragAndDropModel? currentDragAndDrop,  List<DraggableModel>? availableOptions,  List<DropZoneModel>? dropZones,  String? modeGame,  int? correctAnswer,  int? wrongAnswer,  bool? isLoading)  $default,) {final _that = this;
switch (_that) {
case _DndState():
return $default(_that.currentDragAndDrop,_that.availableOptions,_that.dropZones,_that.modeGame,_that.correctAnswer,_that.wrongAnswer,_that.isLoading);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( DragAndDropModel? currentDragAndDrop,  List<DraggableModel>? availableOptions,  List<DropZoneModel>? dropZones,  String? modeGame,  int? correctAnswer,  int? wrongAnswer,  bool? isLoading)?  $default,) {final _that = this;
switch (_that) {
case _DndState() when $default != null:
return $default(_that.currentDragAndDrop,_that.availableOptions,_that.dropZones,_that.modeGame,_that.correctAnswer,_that.wrongAnswer,_that.isLoading);case _:
  return null;

}
}

}

/// @nodoc


class _DndState implements DndState {
  const _DndState({this.currentDragAndDrop, final  List<DraggableModel>? availableOptions, final  List<DropZoneModel>? dropZones, this.modeGame, this.correctAnswer, this.wrongAnswer, this.isLoading}): _availableOptions = availableOptions,_dropZones = dropZones;
  

@override final  DragAndDropModel? currentDragAndDrop;
 final  List<DraggableModel>? _availableOptions;
@override List<DraggableModel>? get availableOptions {
  final value = _availableOptions;
  if (value == null) return null;
  if (_availableOptions is EqualUnmodifiableListView) return _availableOptions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<DropZoneModel>? _dropZones;
@override List<DropZoneModel>? get dropZones {
  final value = _dropZones;
  if (value == null) return null;
  if (_dropZones is EqualUnmodifiableListView) return _dropZones;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  String? modeGame;
@override final  int? correctAnswer;
@override final  int? wrongAnswer;
@override final  bool? isLoading;

/// Create a copy of DndState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DndStateCopyWith<_DndState> get copyWith => __$DndStateCopyWithImpl<_DndState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DndState&&(identical(other.currentDragAndDrop, currentDragAndDrop) || other.currentDragAndDrop == currentDragAndDrop)&&const DeepCollectionEquality().equals(other._availableOptions, _availableOptions)&&const DeepCollectionEquality().equals(other._dropZones, _dropZones)&&(identical(other.modeGame, modeGame) || other.modeGame == modeGame)&&(identical(other.correctAnswer, correctAnswer) || other.correctAnswer == correctAnswer)&&(identical(other.wrongAnswer, wrongAnswer) || other.wrongAnswer == wrongAnswer)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading));
}


@override
int get hashCode => Object.hash(runtimeType,currentDragAndDrop,const DeepCollectionEquality().hash(_availableOptions),const DeepCollectionEquality().hash(_dropZones),modeGame,correctAnswer,wrongAnswer,isLoading);

@override
String toString() {
  return 'DndState(currentDragAndDrop: $currentDragAndDrop, availableOptions: $availableOptions, dropZones: $dropZones, modeGame: $modeGame, correctAnswer: $correctAnswer, wrongAnswer: $wrongAnswer, isLoading: $isLoading)';
}


}

/// @nodoc
abstract mixin class _$DndStateCopyWith<$Res> implements $DndStateCopyWith<$Res> {
  factory _$DndStateCopyWith(_DndState value, $Res Function(_DndState) _then) = __$DndStateCopyWithImpl;
@override @useResult
$Res call({
 DragAndDropModel? currentDragAndDrop, List<DraggableModel>? availableOptions, List<DropZoneModel>? dropZones, String? modeGame, int? correctAnswer, int? wrongAnswer, bool? isLoading
});


@override $DragAndDropModelCopyWith<$Res>? get currentDragAndDrop;

}
/// @nodoc
class __$DndStateCopyWithImpl<$Res>
    implements _$DndStateCopyWith<$Res> {
  __$DndStateCopyWithImpl(this._self, this._then);

  final _DndState _self;
  final $Res Function(_DndState) _then;

/// Create a copy of DndState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? currentDragAndDrop = freezed,Object? availableOptions = freezed,Object? dropZones = freezed,Object? modeGame = freezed,Object? correctAnswer = freezed,Object? wrongAnswer = freezed,Object? isLoading = freezed,}) {
  return _then(_DndState(
currentDragAndDrop: freezed == currentDragAndDrop ? _self.currentDragAndDrop : currentDragAndDrop // ignore: cast_nullable_to_non_nullable
as DragAndDropModel?,availableOptions: freezed == availableOptions ? _self._availableOptions : availableOptions // ignore: cast_nullable_to_non_nullable
as List<DraggableModel>?,dropZones: freezed == dropZones ? _self._dropZones : dropZones // ignore: cast_nullable_to_non_nullable
as List<DropZoneModel>?,modeGame: freezed == modeGame ? _self.modeGame : modeGame // ignore: cast_nullable_to_non_nullable
as String?,correctAnswer: freezed == correctAnswer ? _self.correctAnswer : correctAnswer // ignore: cast_nullable_to_non_nullable
as int?,wrongAnswer: freezed == wrongAnswer ? _self.wrongAnswer : wrongAnswer // ignore: cast_nullable_to_non_nullable
as int?,isLoading: freezed == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}

/// Create a copy of DndState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DragAndDropModelCopyWith<$Res>? get currentDragAndDrop {
    if (_self.currentDragAndDrop == null) {
    return null;
  }

  return $DragAndDropModelCopyWith<$Res>(_self.currentDragAndDrop!, (value) {
    return _then(_self.copyWith(currentDragAndDrop: value));
  });
}
}

// dart format on
