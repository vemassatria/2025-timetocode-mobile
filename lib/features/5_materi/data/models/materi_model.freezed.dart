// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'materi_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MateriModel {

 int get level; String get title; List<ContentBlockModel> get content;
/// Create a copy of MateriModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MateriModelCopyWith<MateriModel> get copyWith => _$MateriModelCopyWithImpl<MateriModel>(this as MateriModel, _$identity);

  /// Serializes this MateriModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MateriModel&&(identical(other.level, level) || other.level == level)&&(identical(other.title, title) || other.title == title)&&const DeepCollectionEquality().equals(other.content, content));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,level,title,const DeepCollectionEquality().hash(content));

@override
String toString() {
  return 'MateriModel(level: $level, title: $title, content: $content)';
}


}

/// @nodoc
abstract mixin class $MateriModelCopyWith<$Res>  {
  factory $MateriModelCopyWith(MateriModel value, $Res Function(MateriModel) _then) = _$MateriModelCopyWithImpl;
@useResult
$Res call({
 int level, String title, List<ContentBlockModel> content
});




}
/// @nodoc
class _$MateriModelCopyWithImpl<$Res>
    implements $MateriModelCopyWith<$Res> {
  _$MateriModelCopyWithImpl(this._self, this._then);

  final MateriModel _self;
  final $Res Function(MateriModel) _then;

/// Create a copy of MateriModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? level = null,Object? title = null,Object? content = null,}) {
  return _then(_self.copyWith(
level: null == level ? _self.level : level // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as List<ContentBlockModel>,
  ));
}

}


/// Adds pattern-matching-related methods to [MateriModel].
extension MateriModelPatterns on MateriModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MateriModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MateriModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MateriModel value)  $default,){
final _that = this;
switch (_that) {
case _MateriModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MateriModel value)?  $default,){
final _that = this;
switch (_that) {
case _MateriModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int level,  String title,  List<ContentBlockModel> content)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MateriModel() when $default != null:
return $default(_that.level,_that.title,_that.content);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int level,  String title,  List<ContentBlockModel> content)  $default,) {final _that = this;
switch (_that) {
case _MateriModel():
return $default(_that.level,_that.title,_that.content);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int level,  String title,  List<ContentBlockModel> content)?  $default,) {final _that = this;
switch (_that) {
case _MateriModel() when $default != null:
return $default(_that.level,_that.title,_that.content);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MateriModel implements MateriModel {
  const _MateriModel({required this.level, required this.title, required final  List<ContentBlockModel> content}): _content = content;
  factory _MateriModel.fromJson(Map<String, dynamic> json) => _$MateriModelFromJson(json);

@override final  int level;
@override final  String title;
 final  List<ContentBlockModel> _content;
@override List<ContentBlockModel> get content {
  if (_content is EqualUnmodifiableListView) return _content;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_content);
}


/// Create a copy of MateriModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MateriModelCopyWith<_MateriModel> get copyWith => __$MateriModelCopyWithImpl<_MateriModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MateriModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MateriModel&&(identical(other.level, level) || other.level == level)&&(identical(other.title, title) || other.title == title)&&const DeepCollectionEquality().equals(other._content, _content));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,level,title,const DeepCollectionEquality().hash(_content));

@override
String toString() {
  return 'MateriModel(level: $level, title: $title, content: $content)';
}


}

/// @nodoc
abstract mixin class _$MateriModelCopyWith<$Res> implements $MateriModelCopyWith<$Res> {
  factory _$MateriModelCopyWith(_MateriModel value, $Res Function(_MateriModel) _then) = __$MateriModelCopyWithImpl;
@override @useResult
$Res call({
 int level, String title, List<ContentBlockModel> content
});




}
/// @nodoc
class __$MateriModelCopyWithImpl<$Res>
    implements _$MateriModelCopyWith<$Res> {
  __$MateriModelCopyWithImpl(this._self, this._then);

  final _MateriModel _self;
  final $Res Function(_MateriModel) _then;

/// Create a copy of MateriModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? level = null,Object? title = null,Object? content = null,}) {
  return _then(_MateriModel(
level: null == level ? _self.level : level // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,content: null == content ? _self._content : content // ignore: cast_nullable_to_non_nullable
as List<ContentBlockModel>,
  ));
}


}

// dart format on
