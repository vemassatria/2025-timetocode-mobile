// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'minigame_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MinigameModel {

 List<QuestionModel>? get questions; List<DragAndDropModel>? get dragAndDrop;
/// Create a copy of MinigameModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MinigameModelCopyWith<MinigameModel> get copyWith => _$MinigameModelCopyWithImpl<MinigameModel>(this as MinigameModel, _$identity);

  /// Serializes this MinigameModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MinigameModel&&const DeepCollectionEquality().equals(other.questions, questions)&&const DeepCollectionEquality().equals(other.dragAndDrop, dragAndDrop));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(questions),const DeepCollectionEquality().hash(dragAndDrop));

@override
String toString() {
  return 'MinigameModel(questions: $questions, dragAndDrop: $dragAndDrop)';
}


}

/// @nodoc
abstract mixin class $MinigameModelCopyWith<$Res>  {
  factory $MinigameModelCopyWith(MinigameModel value, $Res Function(MinigameModel) _then) = _$MinigameModelCopyWithImpl;
@useResult
$Res call({
 List<QuestionModel>? questions, List<DragAndDropModel>? dragAndDrop
});




}
/// @nodoc
class _$MinigameModelCopyWithImpl<$Res>
    implements $MinigameModelCopyWith<$Res> {
  _$MinigameModelCopyWithImpl(this._self, this._then);

  final MinigameModel _self;
  final $Res Function(MinigameModel) _then;

/// Create a copy of MinigameModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? questions = freezed,Object? dragAndDrop = freezed,}) {
  return _then(_self.copyWith(
questions: freezed == questions ? _self.questions : questions // ignore: cast_nullable_to_non_nullable
as List<QuestionModel>?,dragAndDrop: freezed == dragAndDrop ? _self.dragAndDrop : dragAndDrop // ignore: cast_nullable_to_non_nullable
as List<DragAndDropModel>?,
  ));
}

}


/// Adds pattern-matching-related methods to [MinigameModel].
extension MinigameModelPatterns on MinigameModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MinigameModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MinigameModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MinigameModel value)  $default,){
final _that = this;
switch (_that) {
case _MinigameModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MinigameModel value)?  $default,){
final _that = this;
switch (_that) {
case _MinigameModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<QuestionModel>? questions,  List<DragAndDropModel>? dragAndDrop)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MinigameModel() when $default != null:
return $default(_that.questions,_that.dragAndDrop);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<QuestionModel>? questions,  List<DragAndDropModel>? dragAndDrop)  $default,) {final _that = this;
switch (_that) {
case _MinigameModel():
return $default(_that.questions,_that.dragAndDrop);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<QuestionModel>? questions,  List<DragAndDropModel>? dragAndDrop)?  $default,) {final _that = this;
switch (_that) {
case _MinigameModel() when $default != null:
return $default(_that.questions,_that.dragAndDrop);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MinigameModel implements MinigameModel {
  const _MinigameModel({final  List<QuestionModel>? questions, final  List<DragAndDropModel>? dragAndDrop}): _questions = questions,_dragAndDrop = dragAndDrop;
  factory _MinigameModel.fromJson(Map<String, dynamic> json) => _$MinigameModelFromJson(json);

 final  List<QuestionModel>? _questions;
@override List<QuestionModel>? get questions {
  final value = _questions;
  if (value == null) return null;
  if (_questions is EqualUnmodifiableListView) return _questions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<DragAndDropModel>? _dragAndDrop;
@override List<DragAndDropModel>? get dragAndDrop {
  final value = _dragAndDrop;
  if (value == null) return null;
  if (_dragAndDrop is EqualUnmodifiableListView) return _dragAndDrop;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of MinigameModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MinigameModelCopyWith<_MinigameModel> get copyWith => __$MinigameModelCopyWithImpl<_MinigameModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MinigameModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MinigameModel&&const DeepCollectionEquality().equals(other._questions, _questions)&&const DeepCollectionEquality().equals(other._dragAndDrop, _dragAndDrop));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_questions),const DeepCollectionEquality().hash(_dragAndDrop));

@override
String toString() {
  return 'MinigameModel(questions: $questions, dragAndDrop: $dragAndDrop)';
}


}

/// @nodoc
abstract mixin class _$MinigameModelCopyWith<$Res> implements $MinigameModelCopyWith<$Res> {
  factory _$MinigameModelCopyWith(_MinigameModel value, $Res Function(_MinigameModel) _then) = __$MinigameModelCopyWithImpl;
@override @useResult
$Res call({
 List<QuestionModel>? questions, List<DragAndDropModel>? dragAndDrop
});




}
/// @nodoc
class __$MinigameModelCopyWithImpl<$Res>
    implements _$MinigameModelCopyWith<$Res> {
  __$MinigameModelCopyWithImpl(this._self, this._then);

  final _MinigameModel _self;
  final $Res Function(_MinigameModel) _then;

/// Create a copy of MinigameModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? questions = freezed,Object? dragAndDrop = freezed,}) {
  return _then(_MinigameModel(
questions: freezed == questions ? _self._questions : questions // ignore: cast_nullable_to_non_nullable
as List<QuestionModel>?,dragAndDrop: freezed == dragAndDrop ? _self._dragAndDrop : dragAndDrop // ignore: cast_nullable_to_non_nullable
as List<DragAndDropModel>?,
  ));
}


}

// dart format on
