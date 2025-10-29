// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'content_component_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ContentComponentModel {

 String get type; String get value;
/// Create a copy of ContentComponentModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ContentComponentModelCopyWith<ContentComponentModel> get copyWith => _$ContentComponentModelCopyWithImpl<ContentComponentModel>(this as ContentComponentModel, _$identity);

  /// Serializes this ContentComponentModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ContentComponentModel&&(identical(other.type, type) || other.type == type)&&(identical(other.value, value) || other.value == value));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,type,value);

@override
String toString() {
  return 'ContentComponentModel(type: $type, value: $value)';
}


}

/// @nodoc
abstract mixin class $ContentComponentModelCopyWith<$Res>  {
  factory $ContentComponentModelCopyWith(ContentComponentModel value, $Res Function(ContentComponentModel) _then) = _$ContentComponentModelCopyWithImpl;
@useResult
$Res call({
 String type, String value
});




}
/// @nodoc
class _$ContentComponentModelCopyWithImpl<$Res>
    implements $ContentComponentModelCopyWith<$Res> {
  _$ContentComponentModelCopyWithImpl(this._self, this._then);

  final ContentComponentModel _self;
  final $Res Function(ContentComponentModel) _then;

/// Create a copy of ContentComponentModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? type = null,Object? value = null,}) {
  return _then(_self.copyWith(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ContentComponentModel].
extension ContentComponentModelPatterns on ContentComponentModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ContentComponentModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ContentComponentModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ContentComponentModel value)  $default,){
final _that = this;
switch (_that) {
case _ContentComponentModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ContentComponentModel value)?  $default,){
final _that = this;
switch (_that) {
case _ContentComponentModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String type,  String value)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ContentComponentModel() when $default != null:
return $default(_that.type,_that.value);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String type,  String value)  $default,) {final _that = this;
switch (_that) {
case _ContentComponentModel():
return $default(_that.type,_that.value);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String type,  String value)?  $default,) {final _that = this;
switch (_that) {
case _ContentComponentModel() when $default != null:
return $default(_that.type,_that.value);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ContentComponentModel implements ContentComponentModel {
  const _ContentComponentModel({required this.type, required this.value});
  factory _ContentComponentModel.fromJson(Map<String, dynamic> json) => _$ContentComponentModelFromJson(json);

@override final  String type;
@override final  String value;

/// Create a copy of ContentComponentModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ContentComponentModelCopyWith<_ContentComponentModel> get copyWith => __$ContentComponentModelCopyWithImpl<_ContentComponentModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ContentComponentModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ContentComponentModel&&(identical(other.type, type) || other.type == type)&&(identical(other.value, value) || other.value == value));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,type,value);

@override
String toString() {
  return 'ContentComponentModel(type: $type, value: $value)';
}


}

/// @nodoc
abstract mixin class _$ContentComponentModelCopyWith<$Res> implements $ContentComponentModelCopyWith<$Res> {
  factory _$ContentComponentModelCopyWith(_ContentComponentModel value, $Res Function(_ContentComponentModel) _then) = __$ContentComponentModelCopyWithImpl;
@override @useResult
$Res call({
 String type, String value
});




}
/// @nodoc
class __$ContentComponentModelCopyWithImpl<$Res>
    implements _$ContentComponentModelCopyWith<$Res> {
  __$ContentComponentModelCopyWithImpl(this._self, this._then);

  final _ContentComponentModel _self;
  final $Res Function(_ContentComponentModel) _then;

/// Create a copy of ContentComponentModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? type = null,Object? value = null,}) {
  return _then(_ContentComponentModel(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
