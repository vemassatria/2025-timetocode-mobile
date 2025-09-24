// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'player_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PlayerModel {

 int get id; List<LogicGateCardModel> get hand; int get targetValue;
/// Create a copy of PlayerModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PlayerModelCopyWith<PlayerModel> get copyWith => _$PlayerModelCopyWithImpl<PlayerModel>(this as PlayerModel, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PlayerModel&&(identical(other.id, id) || other.id == id)&&const DeepCollectionEquality().equals(other.hand, hand)&&(identical(other.targetValue, targetValue) || other.targetValue == targetValue));
}


@override
int get hashCode => Object.hash(runtimeType,id,const DeepCollectionEquality().hash(hand),targetValue);

@override
String toString() {
  return 'PlayerModel(id: $id, hand: $hand, targetValue: $targetValue)';
}


}

/// @nodoc
abstract mixin class $PlayerModelCopyWith<$Res>  {
  factory $PlayerModelCopyWith(PlayerModel value, $Res Function(PlayerModel) _then) = _$PlayerModelCopyWithImpl;
@useResult
$Res call({
 int id, List<LogicGateCardModel> hand, int targetValue
});




}
/// @nodoc
class _$PlayerModelCopyWithImpl<$Res>
    implements $PlayerModelCopyWith<$Res> {
  _$PlayerModelCopyWithImpl(this._self, this._then);

  final PlayerModel _self;
  final $Res Function(PlayerModel) _then;

/// Create a copy of PlayerModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? hand = null,Object? targetValue = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,hand: null == hand ? _self.hand : hand // ignore: cast_nullable_to_non_nullable
as List<LogicGateCardModel>,targetValue: null == targetValue ? _self.targetValue : targetValue // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [PlayerModel].
extension PlayerModelPatterns on PlayerModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PlayerModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PlayerModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PlayerModel value)  $default,){
final _that = this;
switch (_that) {
case _PlayerModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PlayerModel value)?  $default,){
final _that = this;
switch (_that) {
case _PlayerModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  List<LogicGateCardModel> hand,  int targetValue)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PlayerModel() when $default != null:
return $default(_that.id,_that.hand,_that.targetValue);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  List<LogicGateCardModel> hand,  int targetValue)  $default,) {final _that = this;
switch (_that) {
case _PlayerModel():
return $default(_that.id,_that.hand,_that.targetValue);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  List<LogicGateCardModel> hand,  int targetValue)?  $default,) {final _that = this;
switch (_that) {
case _PlayerModel() when $default != null:
return $default(_that.id,_that.hand,_that.targetValue);case _:
  return null;

}
}

}

/// @nodoc


class _PlayerModel implements PlayerModel {
  const _PlayerModel({required this.id, required final  List<LogicGateCardModel> hand, required this.targetValue}): _hand = hand;
  

@override final  int id;
 final  List<LogicGateCardModel> _hand;
@override List<LogicGateCardModel> get hand {
  if (_hand is EqualUnmodifiableListView) return _hand;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_hand);
}

@override final  int targetValue;

/// Create a copy of PlayerModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PlayerModelCopyWith<_PlayerModel> get copyWith => __$PlayerModelCopyWithImpl<_PlayerModel>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PlayerModel&&(identical(other.id, id) || other.id == id)&&const DeepCollectionEquality().equals(other._hand, _hand)&&(identical(other.targetValue, targetValue) || other.targetValue == targetValue));
}


@override
int get hashCode => Object.hash(runtimeType,id,const DeepCollectionEquality().hash(_hand),targetValue);

@override
String toString() {
  return 'PlayerModel(id: $id, hand: $hand, targetValue: $targetValue)';
}


}

/// @nodoc
abstract mixin class _$PlayerModelCopyWith<$Res> implements $PlayerModelCopyWith<$Res> {
  factory _$PlayerModelCopyWith(_PlayerModel value, $Res Function(_PlayerModel) _then) = __$PlayerModelCopyWithImpl;
@override @useResult
$Res call({
 int id, List<LogicGateCardModel> hand, int targetValue
});




}
/// @nodoc
class __$PlayerModelCopyWithImpl<$Res>
    implements _$PlayerModelCopyWith<$Res> {
  __$PlayerModelCopyWithImpl(this._self, this._then);

  final _PlayerModel _self;
  final $Res Function(_PlayerModel) _then;

/// Create a copy of PlayerModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? hand = null,Object? targetValue = null,}) {
  return _then(_PlayerModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,hand: null == hand ? _self._hand : hand // ignore: cast_nullable_to_non_nullable
as List<LogicGateCardModel>,targetValue: null == targetValue ? _self.targetValue : targetValue // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
