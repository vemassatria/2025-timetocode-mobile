// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'text_dialog_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TextDialogModel {

 String get line; int get reactionIndex; int get characterIndex; int? get ilustrationIndex;
/// Create a copy of TextDialogModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TextDialogModelCopyWith<TextDialogModel> get copyWith => _$TextDialogModelCopyWithImpl<TextDialogModel>(this as TextDialogModel, _$identity);

  /// Serializes this TextDialogModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TextDialogModel&&(identical(other.line, line) || other.line == line)&&(identical(other.reactionIndex, reactionIndex) || other.reactionIndex == reactionIndex)&&(identical(other.characterIndex, characterIndex) || other.characterIndex == characterIndex)&&(identical(other.ilustrationIndex, ilustrationIndex) || other.ilustrationIndex == ilustrationIndex));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,line,reactionIndex,characterIndex,ilustrationIndex);

@override
String toString() {
  return 'TextDialogModel(line: $line, reactionIndex: $reactionIndex, characterIndex: $characterIndex, ilustrationIndex: $ilustrationIndex)';
}


}

/// @nodoc
abstract mixin class $TextDialogModelCopyWith<$Res>  {
  factory $TextDialogModelCopyWith(TextDialogModel value, $Res Function(TextDialogModel) _then) = _$TextDialogModelCopyWithImpl;
@useResult
$Res call({
 String line, int reactionIndex, int characterIndex, int? ilustrationIndex
});




}
/// @nodoc
class _$TextDialogModelCopyWithImpl<$Res>
    implements $TextDialogModelCopyWith<$Res> {
  _$TextDialogModelCopyWithImpl(this._self, this._then);

  final TextDialogModel _self;
  final $Res Function(TextDialogModel) _then;

/// Create a copy of TextDialogModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? line = null,Object? reactionIndex = null,Object? characterIndex = null,Object? ilustrationIndex = freezed,}) {
  return _then(_self.copyWith(
line: null == line ? _self.line : line // ignore: cast_nullable_to_non_nullable
as String,reactionIndex: null == reactionIndex ? _self.reactionIndex : reactionIndex // ignore: cast_nullable_to_non_nullable
as int,characterIndex: null == characterIndex ? _self.characterIndex : characterIndex // ignore: cast_nullable_to_non_nullable
as int,ilustrationIndex: freezed == ilustrationIndex ? _self.ilustrationIndex : ilustrationIndex // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [TextDialogModel].
extension TextDialogModelPatterns on TextDialogModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TextDialogModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TextDialogModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TextDialogModel value)  $default,){
final _that = this;
switch (_that) {
case _TextDialogModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TextDialogModel value)?  $default,){
final _that = this;
switch (_that) {
case _TextDialogModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String line,  int reactionIndex,  int characterIndex,  int? ilustrationIndex)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TextDialogModel() when $default != null:
return $default(_that.line,_that.reactionIndex,_that.characterIndex,_that.ilustrationIndex);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String line,  int reactionIndex,  int characterIndex,  int? ilustrationIndex)  $default,) {final _that = this;
switch (_that) {
case _TextDialogModel():
return $default(_that.line,_that.reactionIndex,_that.characterIndex,_that.ilustrationIndex);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String line,  int reactionIndex,  int characterIndex,  int? ilustrationIndex)?  $default,) {final _that = this;
switch (_that) {
case _TextDialogModel() when $default != null:
return $default(_that.line,_that.reactionIndex,_that.characterIndex,_that.ilustrationIndex);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TextDialogModel implements TextDialogModel {
  const _TextDialogModel({required this.line, required this.reactionIndex, required this.characterIndex, this.ilustrationIndex});
  factory _TextDialogModel.fromJson(Map<String, dynamic> json) => _$TextDialogModelFromJson(json);

@override final  String line;
@override final  int reactionIndex;
@override final  int characterIndex;
@override final  int? ilustrationIndex;

/// Create a copy of TextDialogModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TextDialogModelCopyWith<_TextDialogModel> get copyWith => __$TextDialogModelCopyWithImpl<_TextDialogModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TextDialogModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TextDialogModel&&(identical(other.line, line) || other.line == line)&&(identical(other.reactionIndex, reactionIndex) || other.reactionIndex == reactionIndex)&&(identical(other.characterIndex, characterIndex) || other.characterIndex == characterIndex)&&(identical(other.ilustrationIndex, ilustrationIndex) || other.ilustrationIndex == ilustrationIndex));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,line,reactionIndex,characterIndex,ilustrationIndex);

@override
String toString() {
  return 'TextDialogModel(line: $line, reactionIndex: $reactionIndex, characterIndex: $characterIndex, ilustrationIndex: $ilustrationIndex)';
}


}

/// @nodoc
abstract mixin class _$TextDialogModelCopyWith<$Res> implements $TextDialogModelCopyWith<$Res> {
  factory _$TextDialogModelCopyWith(_TextDialogModel value, $Res Function(_TextDialogModel) _then) = __$TextDialogModelCopyWithImpl;
@override @useResult
$Res call({
 String line, int reactionIndex, int characterIndex, int? ilustrationIndex
});




}
/// @nodoc
class __$TextDialogModelCopyWithImpl<$Res>
    implements _$TextDialogModelCopyWith<$Res> {
  __$TextDialogModelCopyWithImpl(this._self, this._then);

  final _TextDialogModel _self;
  final $Res Function(_TextDialogModel) _then;

/// Create a copy of TextDialogModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? line = null,Object? reactionIndex = null,Object? characterIndex = null,Object? ilustrationIndex = freezed,}) {
  return _then(_TextDialogModel(
line: null == line ? _self.line : line // ignore: cast_nullable_to_non_nullable
as String,reactionIndex: null == reactionIndex ? _self.reactionIndex : reactionIndex // ignore: cast_nullable_to_non_nullable
as int,characterIndex: null == characterIndex ? _self.characterIndex : characterIndex // ignore: cast_nullable_to_non_nullable
as int,ilustrationIndex: freezed == ilustrationIndex ? _self.ilustrationIndex : ilustrationIndex // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
