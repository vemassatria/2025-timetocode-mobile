// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'material_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MaterialModel {

 int get level; String get title; List<ContentBlockModel> get content; String? get videoUrl;
/// Create a copy of MaterialModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MaterialModelCopyWith<MaterialModel> get copyWith => _$MaterialModelCopyWithImpl<MaterialModel>(this as MaterialModel, _$identity);

  /// Serializes this MaterialModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MaterialModel&&(identical(other.level, level) || other.level == level)&&(identical(other.title, title) || other.title == title)&&const DeepCollectionEquality().equals(other.content, content)&&(identical(other.videoUrl, videoUrl) || other.videoUrl == videoUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,level,title,const DeepCollectionEquality().hash(content),videoUrl);

@override
String toString() {
  return 'MaterialModel(level: $level, title: $title, content: $content, videoUrl: $videoUrl)';
}


}

/// @nodoc
abstract mixin class $MaterialModelCopyWith<$Res>  {
  factory $MaterialModelCopyWith(MaterialModel value, $Res Function(MaterialModel) _then) = _$MaterialModelCopyWithImpl;
@useResult
$Res call({
 int level, String title, List<ContentBlockModel> content, String? videoUrl
});




}
/// @nodoc
class _$MaterialModelCopyWithImpl<$Res>
    implements $MaterialModelCopyWith<$Res> {
  _$MaterialModelCopyWithImpl(this._self, this._then);

  final MaterialModel _self;
  final $Res Function(MaterialModel) _then;

/// Create a copy of MaterialModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? level = null,Object? title = null,Object? content = null,Object? videoUrl = freezed,}) {
  return _then(_self.copyWith(
level: null == level ? _self.level : level // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as List<ContentBlockModel>,videoUrl: freezed == videoUrl ? _self.videoUrl : videoUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [MaterialModel].
extension MaterialModelPatterns on MaterialModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MaterialModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MaterialModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MaterialModel value)  $default,){
final _that = this;
switch (_that) {
case _MaterialModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MaterialModel value)?  $default,){
final _that = this;
switch (_that) {
case _MaterialModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int level,  String title,  List<ContentBlockModel> content,  String? videoUrl)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MaterialModel() when $default != null:
return $default(_that.level,_that.title,_that.content,_that.videoUrl);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int level,  String title,  List<ContentBlockModel> content,  String? videoUrl)  $default,) {final _that = this;
switch (_that) {
case _MaterialModel():
return $default(_that.level,_that.title,_that.content,_that.videoUrl);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int level,  String title,  List<ContentBlockModel> content,  String? videoUrl)?  $default,) {final _that = this;
switch (_that) {
case _MaterialModel() when $default != null:
return $default(_that.level,_that.title,_that.content,_that.videoUrl);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MaterialModel extends MaterialModel {
  const _MaterialModel({required this.level, required this.title, required final  List<ContentBlockModel> content, this.videoUrl}): _content = content,super._();
  factory _MaterialModel.fromJson(Map<String, dynamic> json) => _$MaterialModelFromJson(json);

@override final  int level;
@override final  String title;
 final  List<ContentBlockModel> _content;
@override List<ContentBlockModel> get content {
  if (_content is EqualUnmodifiableListView) return _content;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_content);
}

@override final  String? videoUrl;

/// Create a copy of MaterialModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MaterialModelCopyWith<_MaterialModel> get copyWith => __$MaterialModelCopyWithImpl<_MaterialModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MaterialModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MaterialModel&&(identical(other.level, level) || other.level == level)&&(identical(other.title, title) || other.title == title)&&const DeepCollectionEquality().equals(other._content, _content)&&(identical(other.videoUrl, videoUrl) || other.videoUrl == videoUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,level,title,const DeepCollectionEquality().hash(_content),videoUrl);

@override
String toString() {
  return 'MaterialModel(level: $level, title: $title, content: $content, videoUrl: $videoUrl)';
}


}

/// @nodoc
abstract mixin class _$MaterialModelCopyWith<$Res> implements $MaterialModelCopyWith<$Res> {
  factory _$MaterialModelCopyWith(_MaterialModel value, $Res Function(_MaterialModel) _then) = __$MaterialModelCopyWithImpl;
@override @useResult
$Res call({
 int level, String title, List<ContentBlockModel> content, String? videoUrl
});




}
/// @nodoc
class __$MaterialModelCopyWithImpl<$Res>
    implements _$MaterialModelCopyWith<$Res> {
  __$MaterialModelCopyWithImpl(this._self, this._then);

  final _MaterialModel _self;
  final $Res Function(_MaterialModel) _then;

/// Create a copy of MaterialModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? level = null,Object? title = null,Object? content = null,Object? videoUrl = freezed,}) {
  return _then(_MaterialModel(
level: null == level ? _self.level : level // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,content: null == content ? _self._content : content // ignore: cast_nullable_to_non_nullable
as List<ContentBlockModel>,videoUrl: freezed == videoUrl ? _self.videoUrl : videoUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
