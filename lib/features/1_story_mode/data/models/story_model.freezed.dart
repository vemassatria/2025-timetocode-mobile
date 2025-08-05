// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'story_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$StoryModel {

 int get level; String get description; String get title; String get background; String get character1; String get character2; List<String> get character1Images; List<String> get character2Images; List<String> get ilustrations; List<PreDialogModel>? get preDialog; List<DialogModel> get dialogs; List<QuestionModel> get questions; List<DragAndDropModel>? get dragAndDrop; List<String>? get summary; String get start; String get typeStart;
/// Create a copy of StoryModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StoryModelCopyWith<StoryModel> get copyWith => _$StoryModelCopyWithImpl<StoryModel>(this as StoryModel, _$identity);

  /// Serializes this StoryModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StoryModel&&(identical(other.level, level) || other.level == level)&&(identical(other.description, description) || other.description == description)&&(identical(other.title, title) || other.title == title)&&(identical(other.background, background) || other.background == background)&&(identical(other.character1, character1) || other.character1 == character1)&&(identical(other.character2, character2) || other.character2 == character2)&&const DeepCollectionEquality().equals(other.character1Images, character1Images)&&const DeepCollectionEquality().equals(other.character2Images, character2Images)&&const DeepCollectionEquality().equals(other.ilustrations, ilustrations)&&const DeepCollectionEquality().equals(other.preDialog, preDialog)&&const DeepCollectionEquality().equals(other.dialogs, dialogs)&&const DeepCollectionEquality().equals(other.questions, questions)&&const DeepCollectionEquality().equals(other.dragAndDrop, dragAndDrop)&&const DeepCollectionEquality().equals(other.summary, summary)&&(identical(other.start, start) || other.start == start)&&(identical(other.typeStart, typeStart) || other.typeStart == typeStart));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,level,description,title,background,character1,character2,const DeepCollectionEquality().hash(character1Images),const DeepCollectionEquality().hash(character2Images),const DeepCollectionEquality().hash(ilustrations),const DeepCollectionEquality().hash(preDialog),const DeepCollectionEquality().hash(dialogs),const DeepCollectionEquality().hash(questions),const DeepCollectionEquality().hash(dragAndDrop),const DeepCollectionEquality().hash(summary),start,typeStart);

@override
String toString() {
  return 'StoryModel(level: $level, description: $description, title: $title, background: $background, character1: $character1, character2: $character2, character1Images: $character1Images, character2Images: $character2Images, ilustrations: $ilustrations, preDialog: $preDialog, dialogs: $dialogs, questions: $questions, dragAndDrop: $dragAndDrop, summary: $summary, start: $start, typeStart: $typeStart)';
}


}

/// @nodoc
abstract mixin class $StoryModelCopyWith<$Res>  {
  factory $StoryModelCopyWith(StoryModel value, $Res Function(StoryModel) _then) = _$StoryModelCopyWithImpl;
@useResult
$Res call({
 int level, String description, String title, String background, String character1, String character2, List<String> character1Images, List<String> character2Images, List<String> ilustrations, List<PreDialogModel>? preDialog, List<DialogModel> dialogs, List<QuestionModel> questions, List<DragAndDropModel>? dragAndDrop, List<String>? summary, String start, String typeStart
});




}
/// @nodoc
class _$StoryModelCopyWithImpl<$Res>
    implements $StoryModelCopyWith<$Res> {
  _$StoryModelCopyWithImpl(this._self, this._then);

  final StoryModel _self;
  final $Res Function(StoryModel) _then;

/// Create a copy of StoryModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? level = null,Object? description = null,Object? title = null,Object? background = null,Object? character1 = null,Object? character2 = null,Object? character1Images = null,Object? character2Images = null,Object? ilustrations = null,Object? preDialog = freezed,Object? dialogs = null,Object? questions = null,Object? dragAndDrop = freezed,Object? summary = freezed,Object? start = null,Object? typeStart = null,}) {
  return _then(_self.copyWith(
level: null == level ? _self.level : level // ignore: cast_nullable_to_non_nullable
as int,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,background: null == background ? _self.background : background // ignore: cast_nullable_to_non_nullable
as String,character1: null == character1 ? _self.character1 : character1 // ignore: cast_nullable_to_non_nullable
as String,character2: null == character2 ? _self.character2 : character2 // ignore: cast_nullable_to_non_nullable
as String,character1Images: null == character1Images ? _self.character1Images : character1Images // ignore: cast_nullable_to_non_nullable
as List<String>,character2Images: null == character2Images ? _self.character2Images : character2Images // ignore: cast_nullable_to_non_nullable
as List<String>,ilustrations: null == ilustrations ? _self.ilustrations : ilustrations // ignore: cast_nullable_to_non_nullable
as List<String>,preDialog: freezed == preDialog ? _self.preDialog : preDialog // ignore: cast_nullable_to_non_nullable
as List<PreDialogModel>?,dialogs: null == dialogs ? _self.dialogs : dialogs // ignore: cast_nullable_to_non_nullable
as List<DialogModel>,questions: null == questions ? _self.questions : questions // ignore: cast_nullable_to_non_nullable
as List<QuestionModel>,dragAndDrop: freezed == dragAndDrop ? _self.dragAndDrop : dragAndDrop // ignore: cast_nullable_to_non_nullable
as List<DragAndDropModel>?,summary: freezed == summary ? _self.summary : summary // ignore: cast_nullable_to_non_nullable
as List<String>?,start: null == start ? _self.start : start // ignore: cast_nullable_to_non_nullable
as String,typeStart: null == typeStart ? _self.typeStart : typeStart // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [StoryModel].
extension StoryModelPatterns on StoryModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StoryModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StoryModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StoryModel value)  $default,){
final _that = this;
switch (_that) {
case _StoryModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StoryModel value)?  $default,){
final _that = this;
switch (_that) {
case _StoryModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int level,  String description,  String title,  String background,  String character1,  String character2,  List<String> character1Images,  List<String> character2Images,  List<String> ilustrations,  List<PreDialogModel>? preDialog,  List<DialogModel> dialogs,  List<QuestionModel> questions,  List<DragAndDropModel>? dragAndDrop,  List<String>? summary,  String start,  String typeStart)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StoryModel() when $default != null:
return $default(_that.level,_that.description,_that.title,_that.background,_that.character1,_that.character2,_that.character1Images,_that.character2Images,_that.ilustrations,_that.preDialog,_that.dialogs,_that.questions,_that.dragAndDrop,_that.summary,_that.start,_that.typeStart);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int level,  String description,  String title,  String background,  String character1,  String character2,  List<String> character1Images,  List<String> character2Images,  List<String> ilustrations,  List<PreDialogModel>? preDialog,  List<DialogModel> dialogs,  List<QuestionModel> questions,  List<DragAndDropModel>? dragAndDrop,  List<String>? summary,  String start,  String typeStart)  $default,) {final _that = this;
switch (_that) {
case _StoryModel():
return $default(_that.level,_that.description,_that.title,_that.background,_that.character1,_that.character2,_that.character1Images,_that.character2Images,_that.ilustrations,_that.preDialog,_that.dialogs,_that.questions,_that.dragAndDrop,_that.summary,_that.start,_that.typeStart);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int level,  String description,  String title,  String background,  String character1,  String character2,  List<String> character1Images,  List<String> character2Images,  List<String> ilustrations,  List<PreDialogModel>? preDialog,  List<DialogModel> dialogs,  List<QuestionModel> questions,  List<DragAndDropModel>? dragAndDrop,  List<String>? summary,  String start,  String typeStart)?  $default,) {final _that = this;
switch (_that) {
case _StoryModel() when $default != null:
return $default(_that.level,_that.description,_that.title,_that.background,_that.character1,_that.character2,_that.character1Images,_that.character2Images,_that.ilustrations,_that.preDialog,_that.dialogs,_that.questions,_that.dragAndDrop,_that.summary,_that.start,_that.typeStart);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _StoryModel implements StoryModel {
  const _StoryModel({required this.level, required this.description, required this.title, required this.background, required this.character1, required this.character2, required final  List<String> character1Images, required final  List<String> character2Images, required final  List<String> ilustrations, final  List<PreDialogModel>? preDialog, required final  List<DialogModel> dialogs, required final  List<QuestionModel> questions, final  List<DragAndDropModel>? dragAndDrop, final  List<String>? summary, required this.start, required this.typeStart}): _character1Images = character1Images,_character2Images = character2Images,_ilustrations = ilustrations,_preDialog = preDialog,_dialogs = dialogs,_questions = questions,_dragAndDrop = dragAndDrop,_summary = summary;
  factory _StoryModel.fromJson(Map<String, dynamic> json) => _$StoryModelFromJson(json);

@override final  int level;
@override final  String description;
@override final  String title;
@override final  String background;
@override final  String character1;
@override final  String character2;
 final  List<String> _character1Images;
@override List<String> get character1Images {
  if (_character1Images is EqualUnmodifiableListView) return _character1Images;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_character1Images);
}

 final  List<String> _character2Images;
@override List<String> get character2Images {
  if (_character2Images is EqualUnmodifiableListView) return _character2Images;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_character2Images);
}

 final  List<String> _ilustrations;
@override List<String> get ilustrations {
  if (_ilustrations is EqualUnmodifiableListView) return _ilustrations;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_ilustrations);
}

 final  List<PreDialogModel>? _preDialog;
@override List<PreDialogModel>? get preDialog {
  final value = _preDialog;
  if (value == null) return null;
  if (_preDialog is EqualUnmodifiableListView) return _preDialog;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<DialogModel> _dialogs;
@override List<DialogModel> get dialogs {
  if (_dialogs is EqualUnmodifiableListView) return _dialogs;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_dialogs);
}

 final  List<QuestionModel> _questions;
@override List<QuestionModel> get questions {
  if (_questions is EqualUnmodifiableListView) return _questions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_questions);
}

 final  List<DragAndDropModel>? _dragAndDrop;
@override List<DragAndDropModel>? get dragAndDrop {
  final value = _dragAndDrop;
  if (value == null) return null;
  if (_dragAndDrop is EqualUnmodifiableListView) return _dragAndDrop;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<String>? _summary;
@override List<String>? get summary {
  final value = _summary;
  if (value == null) return null;
  if (_summary is EqualUnmodifiableListView) return _summary;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  String start;
@override final  String typeStart;

/// Create a copy of StoryModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StoryModelCopyWith<_StoryModel> get copyWith => __$StoryModelCopyWithImpl<_StoryModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$StoryModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StoryModel&&(identical(other.level, level) || other.level == level)&&(identical(other.description, description) || other.description == description)&&(identical(other.title, title) || other.title == title)&&(identical(other.background, background) || other.background == background)&&(identical(other.character1, character1) || other.character1 == character1)&&(identical(other.character2, character2) || other.character2 == character2)&&const DeepCollectionEquality().equals(other._character1Images, _character1Images)&&const DeepCollectionEquality().equals(other._character2Images, _character2Images)&&const DeepCollectionEquality().equals(other._ilustrations, _ilustrations)&&const DeepCollectionEquality().equals(other._preDialog, _preDialog)&&const DeepCollectionEquality().equals(other._dialogs, _dialogs)&&const DeepCollectionEquality().equals(other._questions, _questions)&&const DeepCollectionEquality().equals(other._dragAndDrop, _dragAndDrop)&&const DeepCollectionEquality().equals(other._summary, _summary)&&(identical(other.start, start) || other.start == start)&&(identical(other.typeStart, typeStart) || other.typeStart == typeStart));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,level,description,title,background,character1,character2,const DeepCollectionEquality().hash(_character1Images),const DeepCollectionEquality().hash(_character2Images),const DeepCollectionEquality().hash(_ilustrations),const DeepCollectionEquality().hash(_preDialog),const DeepCollectionEquality().hash(_dialogs),const DeepCollectionEquality().hash(_questions),const DeepCollectionEquality().hash(_dragAndDrop),const DeepCollectionEquality().hash(_summary),start,typeStart);

@override
String toString() {
  return 'StoryModel(level: $level, description: $description, title: $title, background: $background, character1: $character1, character2: $character2, character1Images: $character1Images, character2Images: $character2Images, ilustrations: $ilustrations, preDialog: $preDialog, dialogs: $dialogs, questions: $questions, dragAndDrop: $dragAndDrop, summary: $summary, start: $start, typeStart: $typeStart)';
}


}

/// @nodoc
abstract mixin class _$StoryModelCopyWith<$Res> implements $StoryModelCopyWith<$Res> {
  factory _$StoryModelCopyWith(_StoryModel value, $Res Function(_StoryModel) _then) = __$StoryModelCopyWithImpl;
@override @useResult
$Res call({
 int level, String description, String title, String background, String character1, String character2, List<String> character1Images, List<String> character2Images, List<String> ilustrations, List<PreDialogModel>? preDialog, List<DialogModel> dialogs, List<QuestionModel> questions, List<DragAndDropModel>? dragAndDrop, List<String>? summary, String start, String typeStart
});




}
/// @nodoc
class __$StoryModelCopyWithImpl<$Res>
    implements _$StoryModelCopyWith<$Res> {
  __$StoryModelCopyWithImpl(this._self, this._then);

  final _StoryModel _self;
  final $Res Function(_StoryModel) _then;

/// Create a copy of StoryModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? level = null,Object? description = null,Object? title = null,Object? background = null,Object? character1 = null,Object? character2 = null,Object? character1Images = null,Object? character2Images = null,Object? ilustrations = null,Object? preDialog = freezed,Object? dialogs = null,Object? questions = null,Object? dragAndDrop = freezed,Object? summary = freezed,Object? start = null,Object? typeStart = null,}) {
  return _then(_StoryModel(
level: null == level ? _self.level : level // ignore: cast_nullable_to_non_nullable
as int,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,background: null == background ? _self.background : background // ignore: cast_nullable_to_non_nullable
as String,character1: null == character1 ? _self.character1 : character1 // ignore: cast_nullable_to_non_nullable
as String,character2: null == character2 ? _self.character2 : character2 // ignore: cast_nullable_to_non_nullable
as String,character1Images: null == character1Images ? _self._character1Images : character1Images // ignore: cast_nullable_to_non_nullable
as List<String>,character2Images: null == character2Images ? _self._character2Images : character2Images // ignore: cast_nullable_to_non_nullable
as List<String>,ilustrations: null == ilustrations ? _self._ilustrations : ilustrations // ignore: cast_nullable_to_non_nullable
as List<String>,preDialog: freezed == preDialog ? _self._preDialog : preDialog // ignore: cast_nullable_to_non_nullable
as List<PreDialogModel>?,dialogs: null == dialogs ? _self._dialogs : dialogs // ignore: cast_nullable_to_non_nullable
as List<DialogModel>,questions: null == questions ? _self._questions : questions // ignore: cast_nullable_to_non_nullable
as List<QuestionModel>,dragAndDrop: freezed == dragAndDrop ? _self._dragAndDrop : dragAndDrop // ignore: cast_nullable_to_non_nullable
as List<DragAndDropModel>?,summary: freezed == summary ? _self._summary : summary // ignore: cast_nullable_to_non_nullable
as List<String>?,start: null == start ? _self.start : start // ignore: cast_nullable_to_non_nullable
as String,typeStart: null == typeStart ? _self.typeStart : typeStart // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
