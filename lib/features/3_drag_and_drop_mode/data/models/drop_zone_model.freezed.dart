// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'drop_zone_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DropZoneModel {

 String get id; List<String>? get acceptedIds; ContentComponentModel? get content; DraggableModel? get contentDraggable;
/// Create a copy of DropZoneModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DropZoneModelCopyWith<DropZoneModel> get copyWith => _$DropZoneModelCopyWithImpl<DropZoneModel>(this as DropZoneModel, _$identity);

  /// Serializes this DropZoneModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DropZoneModel&&(identical(other.id, id) || other.id == id)&&const DeepCollectionEquality().equals(other.acceptedIds, acceptedIds)&&(identical(other.content, content) || other.content == content)&&(identical(other.contentDraggable, contentDraggable) || other.contentDraggable == contentDraggable));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,const DeepCollectionEquality().hash(acceptedIds),content,contentDraggable);

@override
String toString() {
  return 'DropZoneModel(id: $id, acceptedIds: $acceptedIds, content: $content, contentDraggable: $contentDraggable)';
}


}

/// @nodoc
abstract mixin class $DropZoneModelCopyWith<$Res>  {
  factory $DropZoneModelCopyWith(DropZoneModel value, $Res Function(DropZoneModel) _then) = _$DropZoneModelCopyWithImpl;
@useResult
$Res call({
 String id, List<String>? acceptedIds, ContentComponentModel? content, DraggableModel? contentDraggable
});


$ContentComponentModelCopyWith<$Res>? get content;$DraggableModelCopyWith<$Res>? get contentDraggable;

}
/// @nodoc
class _$DropZoneModelCopyWithImpl<$Res>
    implements $DropZoneModelCopyWith<$Res> {
  _$DropZoneModelCopyWithImpl(this._self, this._then);

  final DropZoneModel _self;
  final $Res Function(DropZoneModel) _then;

/// Create a copy of DropZoneModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? acceptedIds = freezed,Object? content = freezed,Object? contentDraggable = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,acceptedIds: freezed == acceptedIds ? _self.acceptedIds : acceptedIds // ignore: cast_nullable_to_non_nullable
as List<String>?,content: freezed == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as ContentComponentModel?,contentDraggable: freezed == contentDraggable ? _self.contentDraggable : contentDraggable // ignore: cast_nullable_to_non_nullable
as DraggableModel?,
  ));
}
/// Create a copy of DropZoneModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ContentComponentModelCopyWith<$Res>? get content {
    if (_self.content == null) {
    return null;
  }

  return $ContentComponentModelCopyWith<$Res>(_self.content!, (value) {
    return _then(_self.copyWith(content: value));
  });
}/// Create a copy of DropZoneModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DraggableModelCopyWith<$Res>? get contentDraggable {
    if (_self.contentDraggable == null) {
    return null;
  }

  return $DraggableModelCopyWith<$Res>(_self.contentDraggable!, (value) {
    return _then(_self.copyWith(contentDraggable: value));
  });
}
}


/// Adds pattern-matching-related methods to [DropZoneModel].
extension DropZoneModelPatterns on DropZoneModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DropZoneModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DropZoneModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DropZoneModel value)  $default,){
final _that = this;
switch (_that) {
case _DropZoneModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DropZoneModel value)?  $default,){
final _that = this;
switch (_that) {
case _DropZoneModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  List<String>? acceptedIds,  ContentComponentModel? content,  DraggableModel? contentDraggable)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DropZoneModel() when $default != null:
return $default(_that.id,_that.acceptedIds,_that.content,_that.contentDraggable);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  List<String>? acceptedIds,  ContentComponentModel? content,  DraggableModel? contentDraggable)  $default,) {final _that = this;
switch (_that) {
case _DropZoneModel():
return $default(_that.id,_that.acceptedIds,_that.content,_that.contentDraggable);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  List<String>? acceptedIds,  ContentComponentModel? content,  DraggableModel? contentDraggable)?  $default,) {final _that = this;
switch (_that) {
case _DropZoneModel() when $default != null:
return $default(_that.id,_that.acceptedIds,_that.content,_that.contentDraggable);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DropZoneModel implements DropZoneModel {
  const _DropZoneModel({required this.id, final  List<String>? acceptedIds, this.content, this.contentDraggable}): _acceptedIds = acceptedIds;
  factory _DropZoneModel.fromJson(Map<String, dynamic> json) => _$DropZoneModelFromJson(json);

@override final  String id;
 final  List<String>? _acceptedIds;
@override List<String>? get acceptedIds {
  final value = _acceptedIds;
  if (value == null) return null;
  if (_acceptedIds is EqualUnmodifiableListView) return _acceptedIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  ContentComponentModel? content;
@override final  DraggableModel? contentDraggable;

/// Create a copy of DropZoneModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DropZoneModelCopyWith<_DropZoneModel> get copyWith => __$DropZoneModelCopyWithImpl<_DropZoneModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DropZoneModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DropZoneModel&&(identical(other.id, id) || other.id == id)&&const DeepCollectionEquality().equals(other._acceptedIds, _acceptedIds)&&(identical(other.content, content) || other.content == content)&&(identical(other.contentDraggable, contentDraggable) || other.contentDraggable == contentDraggable));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,const DeepCollectionEquality().hash(_acceptedIds),content,contentDraggable);

@override
String toString() {
  return 'DropZoneModel(id: $id, acceptedIds: $acceptedIds, content: $content, contentDraggable: $contentDraggable)';
}


}

/// @nodoc
abstract mixin class _$DropZoneModelCopyWith<$Res> implements $DropZoneModelCopyWith<$Res> {
  factory _$DropZoneModelCopyWith(_DropZoneModel value, $Res Function(_DropZoneModel) _then) = __$DropZoneModelCopyWithImpl;
@override @useResult
$Res call({
 String id, List<String>? acceptedIds, ContentComponentModel? content, DraggableModel? contentDraggable
});


@override $ContentComponentModelCopyWith<$Res>? get content;@override $DraggableModelCopyWith<$Res>? get contentDraggable;

}
/// @nodoc
class __$DropZoneModelCopyWithImpl<$Res>
    implements _$DropZoneModelCopyWith<$Res> {
  __$DropZoneModelCopyWithImpl(this._self, this._then);

  final _DropZoneModel _self;
  final $Res Function(_DropZoneModel) _then;

/// Create a copy of DropZoneModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? acceptedIds = freezed,Object? content = freezed,Object? contentDraggable = freezed,}) {
  return _then(_DropZoneModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,acceptedIds: freezed == acceptedIds ? _self._acceptedIds : acceptedIds // ignore: cast_nullable_to_non_nullable
as List<String>?,content: freezed == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as ContentComponentModel?,contentDraggable: freezed == contentDraggable ? _self.contentDraggable : contentDraggable // ignore: cast_nullable_to_non_nullable
as DraggableModel?,
  ));
}

/// Create a copy of DropZoneModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ContentComponentModelCopyWith<$Res>? get content {
    if (_self.content == null) {
    return null;
  }

  return $ContentComponentModelCopyWith<$Res>(_self.content!, (value) {
    return _then(_self.copyWith(content: value));
  });
}/// Create a copy of DropZoneModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DraggableModelCopyWith<$Res>? get contentDraggable {
    if (_self.contentDraggable == null) {
    return null;
  }

  return $DraggableModelCopyWith<$Res>(_self.contentDraggable!, (value) {
    return _then(_self.copyWith(contentDraggable: value));
  });
}
}

// dart format on
