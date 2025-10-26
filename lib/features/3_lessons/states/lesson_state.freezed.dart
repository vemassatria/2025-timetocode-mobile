// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'lesson_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$LessonState {

 LessonStatus get status; List<LessonModel> get items; LessonModel? get selected; String? get error;
/// Create a copy of LessonState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LessonStateCopyWith<LessonState> get copyWith => _$LessonStateCopyWithImpl<LessonState>(this as LessonState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LessonState&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other.items, items)&&(identical(other.selected, selected) || other.selected == selected)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,status,const DeepCollectionEquality().hash(items),selected,error);

@override
String toString() {
  return 'LessonState(status: $status, items: $items, selected: $selected, error: $error)';
}


}

/// @nodoc
abstract mixin class $LessonStateCopyWith<$Res>  {
  factory $LessonStateCopyWith(LessonState value, $Res Function(LessonState) _then) = _$LessonStateCopyWithImpl;
@useResult
$Res call({
 LessonStatus status, List<LessonModel> items, LessonModel? selected, String? error
});


$LessonModelCopyWith<$Res>? get selected;

}
/// @nodoc
class _$LessonStateCopyWithImpl<$Res>
    implements $LessonStateCopyWith<$Res> {
  _$LessonStateCopyWithImpl(this._self, this._then);

  final LessonState _self;
  final $Res Function(LessonState) _then;

/// Create a copy of LessonState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? items = null,Object? selected = freezed,Object? error = freezed,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as LessonStatus,items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<LessonModel>,selected: freezed == selected ? _self.selected : selected // ignore: cast_nullable_to_non_nullable
as LessonModel?,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of LessonState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LessonModelCopyWith<$Res>? get selected {
    if (_self.selected == null) {
    return null;
  }

  return $LessonModelCopyWith<$Res>(_self.selected!, (value) {
    return _then(_self.copyWith(selected: value));
  });
}
}


/// Adds pattern-matching-related methods to [LessonState].
extension LessonStatePatterns on LessonState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LessonState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LessonState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LessonState value)  $default,){
final _that = this;
switch (_that) {
case _LessonState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LessonState value)?  $default,){
final _that = this;
switch (_that) {
case _LessonState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( LessonStatus status,  List<LessonModel> items,  LessonModel? selected,  String? error)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LessonState() when $default != null:
return $default(_that.status,_that.items,_that.selected,_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( LessonStatus status,  List<LessonModel> items,  LessonModel? selected,  String? error)  $default,) {final _that = this;
switch (_that) {
case _LessonState():
return $default(_that.status,_that.items,_that.selected,_that.error);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( LessonStatus status,  List<LessonModel> items,  LessonModel? selected,  String? error)?  $default,) {final _that = this;
switch (_that) {
case _LessonState() when $default != null:
return $default(_that.status,_that.items,_that.selected,_that.error);case _:
  return null;

}
}

}

/// @nodoc


class _LessonState implements LessonState {
  const _LessonState({this.status = LessonStatus.initial, final  List<LessonModel> items = const <LessonModel>[], this.selected, this.error}): _items = items;
  

@override@JsonKey() final  LessonStatus status;
 final  List<LessonModel> _items;
@override@JsonKey() List<LessonModel> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}

@override final  LessonModel? selected;
@override final  String? error;

/// Create a copy of LessonState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LessonStateCopyWith<_LessonState> get copyWith => __$LessonStateCopyWithImpl<_LessonState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LessonState&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other._items, _items)&&(identical(other.selected, selected) || other.selected == selected)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,status,const DeepCollectionEquality().hash(_items),selected,error);

@override
String toString() {
  return 'LessonState(status: $status, items: $items, selected: $selected, error: $error)';
}


}

/// @nodoc
abstract mixin class _$LessonStateCopyWith<$Res> implements $LessonStateCopyWith<$Res> {
  factory _$LessonStateCopyWith(_LessonState value, $Res Function(_LessonState) _then) = __$LessonStateCopyWithImpl;
@override @useResult
$Res call({
 LessonStatus status, List<LessonModel> items, LessonModel? selected, String? error
});


@override $LessonModelCopyWith<$Res>? get selected;

}
/// @nodoc
class __$LessonStateCopyWithImpl<$Res>
    implements _$LessonStateCopyWith<$Res> {
  __$LessonStateCopyWithImpl(this._self, this._then);

  final _LessonState _self;
  final $Res Function(_LessonState) _then;

/// Create a copy of LessonState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? items = null,Object? selected = freezed,Object? error = freezed,}) {
  return _then(_LessonState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as LessonStatus,items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<LessonModel>,selected: freezed == selected ? _self.selected : selected // ignore: cast_nullable_to_non_nullable
as LessonModel?,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of LessonState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LessonModelCopyWith<$Res>? get selected {
    if (_self.selected == null) {
    return null;
  }

  return $LessonModelCopyWith<$Res>(_self.selected!, (value) {
    return _then(_self.copyWith(selected: value));
  });
}
}

// dart format on
