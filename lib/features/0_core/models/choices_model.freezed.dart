// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'choices_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ChoicesModel {

 String get text; String? get next; String? get nextType; bool? get isCorrect;
/// Create a copy of ChoicesModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChoicesModelCopyWith<ChoicesModel> get copyWith => _$ChoicesModelCopyWithImpl<ChoicesModel>(this as ChoicesModel, _$identity);

  /// Serializes this ChoicesModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChoicesModel&&(identical(other.text, text) || other.text == text)&&(identical(other.next, next) || other.next == next)&&(identical(other.nextType, nextType) || other.nextType == nextType)&&(identical(other.isCorrect, isCorrect) || other.isCorrect == isCorrect));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,text,next,nextType,isCorrect);

@override
String toString() {
  return 'ChoicesModel(text: $text, next: $next, nextType: $nextType, isCorrect: $isCorrect)';
}


}

/// @nodoc
abstract mixin class $ChoicesModelCopyWith<$Res>  {
  factory $ChoicesModelCopyWith(ChoicesModel value, $Res Function(ChoicesModel) _then) = _$ChoicesModelCopyWithImpl;
@useResult
$Res call({
 String text, String? next, String? nextType, bool? isCorrect
});




}
/// @nodoc
class _$ChoicesModelCopyWithImpl<$Res>
    implements $ChoicesModelCopyWith<$Res> {
  _$ChoicesModelCopyWithImpl(this._self, this._then);

  final ChoicesModel _self;
  final $Res Function(ChoicesModel) _then;

/// Create a copy of ChoicesModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? text = null,Object? next = freezed,Object? nextType = freezed,Object? isCorrect = freezed,}) {
  return _then(_self.copyWith(
text: null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,next: freezed == next ? _self.next : next // ignore: cast_nullable_to_non_nullable
as String?,nextType: freezed == nextType ? _self.nextType : nextType // ignore: cast_nullable_to_non_nullable
as String?,isCorrect: freezed == isCorrect ? _self.isCorrect : isCorrect // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}

}


/// Adds pattern-matching-related methods to [ChoicesModel].
extension ChoicesModelPatterns on ChoicesModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ChoicesModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ChoicesModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ChoicesModel value)  $default,){
final _that = this;
switch (_that) {
case _ChoicesModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ChoicesModel value)?  $default,){
final _that = this;
switch (_that) {
case _ChoicesModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String text,  String? next,  String? nextType,  bool? isCorrect)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ChoicesModel() when $default != null:
return $default(_that.text,_that.next,_that.nextType,_that.isCorrect);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String text,  String? next,  String? nextType,  bool? isCorrect)  $default,) {final _that = this;
switch (_that) {
case _ChoicesModel():
return $default(_that.text,_that.next,_that.nextType,_that.isCorrect);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String text,  String? next,  String? nextType,  bool? isCorrect)?  $default,) {final _that = this;
switch (_that) {
case _ChoicesModel() when $default != null:
return $default(_that.text,_that.next,_that.nextType,_that.isCorrect);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ChoicesModel implements ChoicesModel {
  const _ChoicesModel({required this.text, this.next, this.nextType, this.isCorrect});
  factory _ChoicesModel.fromJson(Map<String, dynamic> json) => _$ChoicesModelFromJson(json);

@override final  String text;
@override final  String? next;
@override final  String? nextType;
@override final  bool? isCorrect;

/// Create a copy of ChoicesModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChoicesModelCopyWith<_ChoicesModel> get copyWith => __$ChoicesModelCopyWithImpl<_ChoicesModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ChoicesModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChoicesModel&&(identical(other.text, text) || other.text == text)&&(identical(other.next, next) || other.next == next)&&(identical(other.nextType, nextType) || other.nextType == nextType)&&(identical(other.isCorrect, isCorrect) || other.isCorrect == isCorrect));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,text,next,nextType,isCorrect);

@override
String toString() {
  return 'ChoicesModel(text: $text, next: $next, nextType: $nextType, isCorrect: $isCorrect)';
}


}

/// @nodoc
abstract mixin class _$ChoicesModelCopyWith<$Res> implements $ChoicesModelCopyWith<$Res> {
  factory _$ChoicesModelCopyWith(_ChoicesModel value, $Res Function(_ChoicesModel) _then) = __$ChoicesModelCopyWithImpl;
@override @useResult
$Res call({
 String text, String? next, String? nextType, bool? isCorrect
});




}
/// @nodoc
class __$ChoicesModelCopyWithImpl<$Res>
    implements _$ChoicesModelCopyWith<$Res> {
  __$ChoicesModelCopyWithImpl(this._self, this._then);

  final _ChoicesModel _self;
  final $Res Function(_ChoicesModel) _then;

/// Create a copy of ChoicesModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? text = null,Object? next = freezed,Object? nextType = freezed,Object? isCorrect = freezed,}) {
  return _then(_ChoicesModel(
text: null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,next: freezed == next ? _self.next : next // ignore: cast_nullable_to_non_nullable
as String?,nextType: freezed == nextType ? _self.nextType : nextType // ignore: cast_nullable_to_non_nullable
as String?,isCorrect: freezed == isCorrect ? _self.isCorrect : isCorrect // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}


}

// dart format on
