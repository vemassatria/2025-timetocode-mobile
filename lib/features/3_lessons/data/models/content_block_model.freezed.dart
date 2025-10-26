// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'content_block_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ContentBlockModel {

 String get type;// "heading" | "text" | "image" | "list" | "table"
 ContentBlockData get data;
/// Create a copy of ContentBlockModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ContentBlockModelCopyWith<ContentBlockModel> get copyWith => _$ContentBlockModelCopyWithImpl<ContentBlockModel>(this as ContentBlockModel, _$identity);

  /// Serializes this ContentBlockModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ContentBlockModel&&(identical(other.type, type) || other.type == type)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,type,data);

@override
String toString() {
  return 'ContentBlockModel(type: $type, data: $data)';
}


}

/// @nodoc
abstract mixin class $ContentBlockModelCopyWith<$Res>  {
  factory $ContentBlockModelCopyWith(ContentBlockModel value, $Res Function(ContentBlockModel) _then) = _$ContentBlockModelCopyWithImpl;
@useResult
$Res call({
 String type, ContentBlockData data
});


$ContentBlockDataCopyWith<$Res> get data;

}
/// @nodoc
class _$ContentBlockModelCopyWithImpl<$Res>
    implements $ContentBlockModelCopyWith<$Res> {
  _$ContentBlockModelCopyWithImpl(this._self, this._then);

  final ContentBlockModel _self;
  final $Res Function(ContentBlockModel) _then;

/// Create a copy of ContentBlockModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? type = null,Object? data = null,}) {
  return _then(_self.copyWith(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as ContentBlockData,
  ));
}
/// Create a copy of ContentBlockModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ContentBlockDataCopyWith<$Res> get data {
  
  return $ContentBlockDataCopyWith<$Res>(_self.data, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// Adds pattern-matching-related methods to [ContentBlockModel].
extension ContentBlockModelPatterns on ContentBlockModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ContentBlockModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ContentBlockModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ContentBlockModel value)  $default,){
final _that = this;
switch (_that) {
case _ContentBlockModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ContentBlockModel value)?  $default,){
final _that = this;
switch (_that) {
case _ContentBlockModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String type,  ContentBlockData data)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ContentBlockModel() when $default != null:
return $default(_that.type,_that.data);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String type,  ContentBlockData data)  $default,) {final _that = this;
switch (_that) {
case _ContentBlockModel():
return $default(_that.type,_that.data);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String type,  ContentBlockData data)?  $default,) {final _that = this;
switch (_that) {
case _ContentBlockModel() when $default != null:
return $default(_that.type,_that.data);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ContentBlockModel extends ContentBlockModel {
  const _ContentBlockModel({required this.type, required this.data}): super._();
  factory _ContentBlockModel.fromJson(Map<String, dynamic> json) => _$ContentBlockModelFromJson(json);

@override final  String type;
// "heading" | "text" | "image" | "list" | "table"
@override final  ContentBlockData data;

/// Create a copy of ContentBlockModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ContentBlockModelCopyWith<_ContentBlockModel> get copyWith => __$ContentBlockModelCopyWithImpl<_ContentBlockModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ContentBlockModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ContentBlockModel&&(identical(other.type, type) || other.type == type)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,type,data);

@override
String toString() {
  return 'ContentBlockModel(type: $type, data: $data)';
}


}

/// @nodoc
abstract mixin class _$ContentBlockModelCopyWith<$Res> implements $ContentBlockModelCopyWith<$Res> {
  factory _$ContentBlockModelCopyWith(_ContentBlockModel value, $Res Function(_ContentBlockModel) _then) = __$ContentBlockModelCopyWithImpl;
@override @useResult
$Res call({
 String type, ContentBlockData data
});


@override $ContentBlockDataCopyWith<$Res> get data;

}
/// @nodoc
class __$ContentBlockModelCopyWithImpl<$Res>
    implements _$ContentBlockModelCopyWith<$Res> {
  __$ContentBlockModelCopyWithImpl(this._self, this._then);

  final _ContentBlockModel _self;
  final $Res Function(_ContentBlockModel) _then;

/// Create a copy of ContentBlockModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? type = null,Object? data = null,}) {
  return _then(_ContentBlockModel(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as ContentBlockData,
  ));
}

/// Create a copy of ContentBlockModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ContentBlockDataCopyWith<$Res> get data {
  
  return $ContentBlockDataCopyWith<$Res>(_self.data, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}

// dart format on
