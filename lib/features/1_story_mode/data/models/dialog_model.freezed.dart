// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dialog_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DialogModel {

 String get id; List<TextDialogModel> get dialogs; String? get next; String? get nextType; List<DialogChoices>? get choices;
/// Create a copy of DialogModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DialogModelCopyWith<DialogModel> get copyWith => _$DialogModelCopyWithImpl<DialogModel>(this as DialogModel, _$identity);

  /// Serializes this DialogModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DialogModel&&(identical(other.id, id) || other.id == id)&&const DeepCollectionEquality().equals(other.dialogs, dialogs)&&(identical(other.next, next) || other.next == next)&&(identical(other.nextType, nextType) || other.nextType == nextType)&&const DeepCollectionEquality().equals(other.choices, choices));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,const DeepCollectionEquality().hash(dialogs),next,nextType,const DeepCollectionEquality().hash(choices));

@override
String toString() {
  return 'DialogModel(id: $id, dialogs: $dialogs, next: $next, nextType: $nextType, choices: $choices)';
}


}

/// @nodoc
abstract mixin class $DialogModelCopyWith<$Res>  {
  factory $DialogModelCopyWith(DialogModel value, $Res Function(DialogModel) _then) = _$DialogModelCopyWithImpl;
@useResult
$Res call({
 String id, List<TextDialogModel> dialogs, String? next, String? nextType, List<DialogChoices>? choices
});




}
/// @nodoc
class _$DialogModelCopyWithImpl<$Res>
    implements $DialogModelCopyWith<$Res> {
  _$DialogModelCopyWithImpl(this._self, this._then);

  final DialogModel _self;
  final $Res Function(DialogModel) _then;

/// Create a copy of DialogModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? dialogs = null,Object? next = freezed,Object? nextType = freezed,Object? choices = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,dialogs: null == dialogs ? _self.dialogs : dialogs // ignore: cast_nullable_to_non_nullable
as List<TextDialogModel>,next: freezed == next ? _self.next : next // ignore: cast_nullable_to_non_nullable
as String?,nextType: freezed == nextType ? _self.nextType : nextType // ignore: cast_nullable_to_non_nullable
as String?,choices: freezed == choices ? _self.choices : choices // ignore: cast_nullable_to_non_nullable
as List<DialogChoices>?,
  ));
}

}


/// Adds pattern-matching-related methods to [DialogModel].
extension DialogModelPatterns on DialogModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DialogModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DialogModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DialogModel value)  $default,){
final _that = this;
switch (_that) {
case _DialogModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DialogModel value)?  $default,){
final _that = this;
switch (_that) {
case _DialogModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  List<TextDialogModel> dialogs,  String? next,  String? nextType,  List<DialogChoices>? choices)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DialogModel() when $default != null:
return $default(_that.id,_that.dialogs,_that.next,_that.nextType,_that.choices);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  List<TextDialogModel> dialogs,  String? next,  String? nextType,  List<DialogChoices>? choices)  $default,) {final _that = this;
switch (_that) {
case _DialogModel():
return $default(_that.id,_that.dialogs,_that.next,_that.nextType,_that.choices);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  List<TextDialogModel> dialogs,  String? next,  String? nextType,  List<DialogChoices>? choices)?  $default,) {final _that = this;
switch (_that) {
case _DialogModel() when $default != null:
return $default(_that.id,_that.dialogs,_that.next,_that.nextType,_that.choices);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DialogModel implements DialogModel {
  const _DialogModel({required this.id, required final  List<TextDialogModel> dialogs, this.next, this.nextType, final  List<DialogChoices>? choices}): _dialogs = dialogs,_choices = choices;
  factory _DialogModel.fromJson(Map<String, dynamic> json) => _$DialogModelFromJson(json);

@override final  String id;
 final  List<TextDialogModel> _dialogs;
@override List<TextDialogModel> get dialogs {
  if (_dialogs is EqualUnmodifiableListView) return _dialogs;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_dialogs);
}

@override final  String? next;
@override final  String? nextType;
 final  List<DialogChoices>? _choices;
@override List<DialogChoices>? get choices {
  final value = _choices;
  if (value == null) return null;
  if (_choices is EqualUnmodifiableListView) return _choices;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of DialogModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DialogModelCopyWith<_DialogModel> get copyWith => __$DialogModelCopyWithImpl<_DialogModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DialogModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DialogModel&&(identical(other.id, id) || other.id == id)&&const DeepCollectionEquality().equals(other._dialogs, _dialogs)&&(identical(other.next, next) || other.next == next)&&(identical(other.nextType, nextType) || other.nextType == nextType)&&const DeepCollectionEquality().equals(other._choices, _choices));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,const DeepCollectionEquality().hash(_dialogs),next,nextType,const DeepCollectionEquality().hash(_choices));

@override
String toString() {
  return 'DialogModel(id: $id, dialogs: $dialogs, next: $next, nextType: $nextType, choices: $choices)';
}


}

/// @nodoc
abstract mixin class _$DialogModelCopyWith<$Res> implements $DialogModelCopyWith<$Res> {
  factory _$DialogModelCopyWith(_DialogModel value, $Res Function(_DialogModel) _then) = __$DialogModelCopyWithImpl;
@override @useResult
$Res call({
 String id, List<TextDialogModel> dialogs, String? next, String? nextType, List<DialogChoices>? choices
});




}
/// @nodoc
class __$DialogModelCopyWithImpl<$Res>
    implements _$DialogModelCopyWith<$Res> {
  __$DialogModelCopyWithImpl(this._self, this._then);

  final _DialogModel _self;
  final $Res Function(_DialogModel) _then;

/// Create a copy of DialogModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? dialogs = null,Object? next = freezed,Object? nextType = freezed,Object? choices = freezed,}) {
  return _then(_DialogModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,dialogs: null == dialogs ? _self._dialogs : dialogs // ignore: cast_nullable_to_non_nullable
as List<TextDialogModel>,next: freezed == next ? _self.next : next // ignore: cast_nullable_to_non_nullable
as String?,nextType: freezed == nextType ? _self.nextType : nextType // ignore: cast_nullable_to_non_nullable
as String?,choices: freezed == choices ? _self._choices : choices // ignore: cast_nullable_to_non_nullable
as List<DialogChoices>?,
  ));
}


}

// dart format on
