// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'predialog_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PreDialogModel {

 String get id; String get text; String get next; String get nextType;
/// Create a copy of PreDialogModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PreDialogModelCopyWith<PreDialogModel> get copyWith => _$PreDialogModelCopyWithImpl<PreDialogModel>(this as PreDialogModel, _$identity);

  /// Serializes this PreDialogModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PreDialogModel&&(identical(other.id, id) || other.id == id)&&(identical(other.text, text) || other.text == text)&&(identical(other.next, next) || other.next == next)&&(identical(other.nextType, nextType) || other.nextType == nextType));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,text,next,nextType);

@override
String toString() {
  return 'PreDialogModel(id: $id, text: $text, next: $next, nextType: $nextType)';
}


}

/// @nodoc
abstract mixin class $PreDialogModelCopyWith<$Res>  {
  factory $PreDialogModelCopyWith(PreDialogModel value, $Res Function(PreDialogModel) _then) = _$PreDialogModelCopyWithImpl;
@useResult
$Res call({
 String id, String text, String next, String nextType
});




}
/// @nodoc
class _$PreDialogModelCopyWithImpl<$Res>
    implements $PreDialogModelCopyWith<$Res> {
  _$PreDialogModelCopyWithImpl(this._self, this._then);

  final PreDialogModel _self;
  final $Res Function(PreDialogModel) _then;

/// Create a copy of PreDialogModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? text = null,Object? next = null,Object? nextType = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,text: null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,next: null == next ? _self.next : next // ignore: cast_nullable_to_non_nullable
as String,nextType: null == nextType ? _self.nextType : nextType // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [PreDialogModel].
extension PreDialogModelPatterns on PreDialogModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PreDialogModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PreDialogModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PreDialogModel value)  $default,){
final _that = this;
switch (_that) {
case _PreDialogModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PreDialogModel value)?  $default,){
final _that = this;
switch (_that) {
case _PreDialogModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String text,  String next,  String nextType)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PreDialogModel() when $default != null:
return $default(_that.id,_that.text,_that.next,_that.nextType);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String text,  String next,  String nextType)  $default,) {final _that = this;
switch (_that) {
case _PreDialogModel():
return $default(_that.id,_that.text,_that.next,_that.nextType);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String text,  String next,  String nextType)?  $default,) {final _that = this;
switch (_that) {
case _PreDialogModel() when $default != null:
return $default(_that.id,_that.text,_that.next,_that.nextType);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PreDialogModel implements PreDialogModel {
  const _PreDialogModel({required this.id, required this.text, required this.next, required this.nextType});
  factory _PreDialogModel.fromJson(Map<String, dynamic> json) => _$PreDialogModelFromJson(json);

@override final  String id;
@override final  String text;
@override final  String next;
@override final  String nextType;

/// Create a copy of PreDialogModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PreDialogModelCopyWith<_PreDialogModel> get copyWith => __$PreDialogModelCopyWithImpl<_PreDialogModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PreDialogModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PreDialogModel&&(identical(other.id, id) || other.id == id)&&(identical(other.text, text) || other.text == text)&&(identical(other.next, next) || other.next == next)&&(identical(other.nextType, nextType) || other.nextType == nextType));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,text,next,nextType);

@override
String toString() {
  return 'PreDialogModel(id: $id, text: $text, next: $next, nextType: $nextType)';
}


}

/// @nodoc
abstract mixin class _$PreDialogModelCopyWith<$Res> implements $PreDialogModelCopyWith<$Res> {
  factory _$PreDialogModelCopyWith(_PreDialogModel value, $Res Function(_PreDialogModel) _then) = __$PreDialogModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String text, String next, String nextType
});




}
/// @nodoc
class __$PreDialogModelCopyWithImpl<$Res>
    implements _$PreDialogModelCopyWith<$Res> {
  __$PreDialogModelCopyWithImpl(this._self, this._then);

  final _PreDialogModel _self;
  final $Res Function(_PreDialogModel) _then;

/// Create a copy of PreDialogModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? text = null,Object? next = null,Object? nextType = null,}) {
  return _then(_PreDialogModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,text: null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,next: null == next ? _self.next : next // ignore: cast_nullable_to_non_nullable
as String,nextType: null == nextType ? _self.nextType : nextType // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
