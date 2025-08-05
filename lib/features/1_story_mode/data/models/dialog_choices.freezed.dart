// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dialog_choices.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DialogChoices {

 String get text; String get next; String get nextType;
/// Create a copy of DialogChoices
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DialogChoicesCopyWith<DialogChoices> get copyWith => _$DialogChoicesCopyWithImpl<DialogChoices>(this as DialogChoices, _$identity);

  /// Serializes this DialogChoices to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DialogChoices&&(identical(other.text, text) || other.text == text)&&(identical(other.next, next) || other.next == next)&&(identical(other.nextType, nextType) || other.nextType == nextType));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,text,next,nextType);

@override
String toString() {
  return 'DialogChoices(text: $text, next: $next, nextType: $nextType)';
}


}

/// @nodoc
abstract mixin class $DialogChoicesCopyWith<$Res>  {
  factory $DialogChoicesCopyWith(DialogChoices value, $Res Function(DialogChoices) _then) = _$DialogChoicesCopyWithImpl;
@useResult
$Res call({
 String text, String next, String nextType
});




}
/// @nodoc
class _$DialogChoicesCopyWithImpl<$Res>
    implements $DialogChoicesCopyWith<$Res> {
  _$DialogChoicesCopyWithImpl(this._self, this._then);

  final DialogChoices _self;
  final $Res Function(DialogChoices) _then;

/// Create a copy of DialogChoices
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? text = null,Object? next = null,Object? nextType = null,}) {
  return _then(_self.copyWith(
text: null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,next: null == next ? _self.next : next // ignore: cast_nullable_to_non_nullable
as String,nextType: null == nextType ? _self.nextType : nextType // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [DialogChoices].
extension DialogChoicesPatterns on DialogChoices {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DialogChoices value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DialogChoices() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DialogChoices value)  $default,){
final _that = this;
switch (_that) {
case _DialogChoices():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DialogChoices value)?  $default,){
final _that = this;
switch (_that) {
case _DialogChoices() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String text,  String next,  String nextType)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DialogChoices() when $default != null:
return $default(_that.text,_that.next,_that.nextType);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String text,  String next,  String nextType)  $default,) {final _that = this;
switch (_that) {
case _DialogChoices():
return $default(_that.text,_that.next,_that.nextType);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String text,  String next,  String nextType)?  $default,) {final _that = this;
switch (_that) {
case _DialogChoices() when $default != null:
return $default(_that.text,_that.next,_that.nextType);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DialogChoices implements DialogChoices {
  const _DialogChoices({required this.text, required this.next, required this.nextType});
  factory _DialogChoices.fromJson(Map<String, dynamic> json) => _$DialogChoicesFromJson(json);

@override final  String text;
@override final  String next;
@override final  String nextType;

/// Create a copy of DialogChoices
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DialogChoicesCopyWith<_DialogChoices> get copyWith => __$DialogChoicesCopyWithImpl<_DialogChoices>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DialogChoicesToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DialogChoices&&(identical(other.text, text) || other.text == text)&&(identical(other.next, next) || other.next == next)&&(identical(other.nextType, nextType) || other.nextType == nextType));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,text,next,nextType);

@override
String toString() {
  return 'DialogChoices(text: $text, next: $next, nextType: $nextType)';
}


}

/// @nodoc
abstract mixin class _$DialogChoicesCopyWith<$Res> implements $DialogChoicesCopyWith<$Res> {
  factory _$DialogChoicesCopyWith(_DialogChoices value, $Res Function(_DialogChoices) _then) = __$DialogChoicesCopyWithImpl;
@override @useResult
$Res call({
 String text, String next, String nextType
});




}
/// @nodoc
class __$DialogChoicesCopyWithImpl<$Res>
    implements _$DialogChoicesCopyWith<$Res> {
  __$DialogChoicesCopyWithImpl(this._self, this._then);

  final _DialogChoices _self;
  final $Res Function(_DialogChoices) _then;

/// Create a copy of DialogChoices
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? text = null,Object? next = null,Object? nextType = null,}) {
  return _then(_DialogChoices(
text: null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,next: null == next ? _self.next : next // ignore: cast_nullable_to_non_nullable
as String,nextType: null == nextType ? _self.nextType : nextType // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
