// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'draggable_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DraggableModel {

 String get id; ContentComponentModel get content; String? get info;
/// Create a copy of DraggableModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DraggableModelCopyWith<DraggableModel> get copyWith => _$DraggableModelCopyWithImpl<DraggableModel>(this as DraggableModel, _$identity);

  /// Serializes this DraggableModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DraggableModel&&(identical(other.id, id) || other.id == id)&&(identical(other.content, content) || other.content == content)&&(identical(other.info, info) || other.info == info));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,content,info);

@override
String toString() {
  return 'DraggableModel(id: $id, content: $content, info: $info)';
}


}

/// @nodoc
abstract mixin class $DraggableModelCopyWith<$Res>  {
  factory $DraggableModelCopyWith(DraggableModel value, $Res Function(DraggableModel) _then) = _$DraggableModelCopyWithImpl;
@useResult
$Res call({
 String id, ContentComponentModel content, String? info
});


$ContentComponentModelCopyWith<$Res> get content;

}
/// @nodoc
class _$DraggableModelCopyWithImpl<$Res>
    implements $DraggableModelCopyWith<$Res> {
  _$DraggableModelCopyWithImpl(this._self, this._then);

  final DraggableModel _self;
  final $Res Function(DraggableModel) _then;

/// Create a copy of DraggableModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? content = null,Object? info = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as ContentComponentModel,info: freezed == info ? _self.info : info // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of DraggableModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ContentComponentModelCopyWith<$Res> get content {
  
  return $ContentComponentModelCopyWith<$Res>(_self.content, (value) {
    return _then(_self.copyWith(content: value));
  });
}
}


/// Adds pattern-matching-related methods to [DraggableModel].
extension DraggableModelPatterns on DraggableModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DraggableModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DraggableModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DraggableModel value)  $default,){
final _that = this;
switch (_that) {
case _DraggableModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DraggableModel value)?  $default,){
final _that = this;
switch (_that) {
case _DraggableModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  ContentComponentModel content,  String? info)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DraggableModel() when $default != null:
return $default(_that.id,_that.content,_that.info);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  ContentComponentModel content,  String? info)  $default,) {final _that = this;
switch (_that) {
case _DraggableModel():
return $default(_that.id,_that.content,_that.info);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  ContentComponentModel content,  String? info)?  $default,) {final _that = this;
switch (_that) {
case _DraggableModel() when $default != null:
return $default(_that.id,_that.content,_that.info);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DraggableModel implements DraggableModel {
  const _DraggableModel({required this.id, required this.content, this.info});
  factory _DraggableModel.fromJson(Map<String, dynamic> json) => _$DraggableModelFromJson(json);

@override final  String id;
@override final  ContentComponentModel content;
@override final  String? info;

/// Create a copy of DraggableModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DraggableModelCopyWith<_DraggableModel> get copyWith => __$DraggableModelCopyWithImpl<_DraggableModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DraggableModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DraggableModel&&(identical(other.id, id) || other.id == id)&&(identical(other.content, content) || other.content == content)&&(identical(other.info, info) || other.info == info));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,content,info);

@override
String toString() {
  return 'DraggableModel(id: $id, content: $content, info: $info)';
}


}

/// @nodoc
abstract mixin class _$DraggableModelCopyWith<$Res> implements $DraggableModelCopyWith<$Res> {
  factory _$DraggableModelCopyWith(_DraggableModel value, $Res Function(_DraggableModel) _then) = __$DraggableModelCopyWithImpl;
@override @useResult
$Res call({
 String id, ContentComponentModel content, String? info
});


@override $ContentComponentModelCopyWith<$Res> get content;

}
/// @nodoc
class __$DraggableModelCopyWithImpl<$Res>
    implements _$DraggableModelCopyWith<$Res> {
  __$DraggableModelCopyWithImpl(this._self, this._then);

  final _DraggableModel _self;
  final $Res Function(_DraggableModel) _then;

/// Create a copy of DraggableModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? content = null,Object? info = freezed,}) {
  return _then(_DraggableModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as ContentComponentModel,info: freezed == info ? _self.info : info // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of DraggableModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ContentComponentModelCopyWith<$Res> get content {
  
  return $ContentComponentModelCopyWith<$Res>(_self.content, (value) {
    return _then(_self.copyWith(content: value));
  });
}
}

// dart format on
