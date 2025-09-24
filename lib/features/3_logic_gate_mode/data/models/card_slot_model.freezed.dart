// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'card_slot_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CardSlotModel {

 int get id; LogicGateCardModel? get placedCard;
/// Create a copy of CardSlotModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CardSlotModelCopyWith<CardSlotModel> get copyWith => _$CardSlotModelCopyWithImpl<CardSlotModel>(this as CardSlotModel, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CardSlotModel&&(identical(other.id, id) || other.id == id)&&(identical(other.placedCard, placedCard) || other.placedCard == placedCard));
}


@override
int get hashCode => Object.hash(runtimeType,id,placedCard);

@override
String toString() {
  return 'CardSlotModel(id: $id, placedCard: $placedCard)';
}


}

/// @nodoc
abstract mixin class $CardSlotModelCopyWith<$Res>  {
  factory $CardSlotModelCopyWith(CardSlotModel value, $Res Function(CardSlotModel) _then) = _$CardSlotModelCopyWithImpl;
@useResult
$Res call({
 int id, LogicGateCardModel? placedCard
});


$LogicGateCardModelCopyWith<$Res>? get placedCard;

}
/// @nodoc
class _$CardSlotModelCopyWithImpl<$Res>
    implements $CardSlotModelCopyWith<$Res> {
  _$CardSlotModelCopyWithImpl(this._self, this._then);

  final CardSlotModel _self;
  final $Res Function(CardSlotModel) _then;

/// Create a copy of CardSlotModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? placedCard = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,placedCard: freezed == placedCard ? _self.placedCard : placedCard // ignore: cast_nullable_to_non_nullable
as LogicGateCardModel?,
  ));
}
/// Create a copy of CardSlotModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LogicGateCardModelCopyWith<$Res>? get placedCard {
    if (_self.placedCard == null) {
    return null;
  }

  return $LogicGateCardModelCopyWith<$Res>(_self.placedCard!, (value) {
    return _then(_self.copyWith(placedCard: value));
  });
}
}


/// Adds pattern-matching-related methods to [CardSlotModel].
extension CardSlotModelPatterns on CardSlotModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CardSlotModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CardSlotModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CardSlotModel value)  $default,){
final _that = this;
switch (_that) {
case _CardSlotModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CardSlotModel value)?  $default,){
final _that = this;
switch (_that) {
case _CardSlotModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  LogicGateCardModel? placedCard)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CardSlotModel() when $default != null:
return $default(_that.id,_that.placedCard);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  LogicGateCardModel? placedCard)  $default,) {final _that = this;
switch (_that) {
case _CardSlotModel():
return $default(_that.id,_that.placedCard);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  LogicGateCardModel? placedCard)?  $default,) {final _that = this;
switch (_that) {
case _CardSlotModel() when $default != null:
return $default(_that.id,_that.placedCard);case _:
  return null;

}
}

}

/// @nodoc


class _CardSlotModel implements CardSlotModel {
  const _CardSlotModel({required this.id, this.placedCard});
  

@override final  int id;
@override final  LogicGateCardModel? placedCard;

/// Create a copy of CardSlotModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CardSlotModelCopyWith<_CardSlotModel> get copyWith => __$CardSlotModelCopyWithImpl<_CardSlotModel>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CardSlotModel&&(identical(other.id, id) || other.id == id)&&(identical(other.placedCard, placedCard) || other.placedCard == placedCard));
}


@override
int get hashCode => Object.hash(runtimeType,id,placedCard);

@override
String toString() {
  return 'CardSlotModel(id: $id, placedCard: $placedCard)';
}


}

/// @nodoc
abstract mixin class _$CardSlotModelCopyWith<$Res> implements $CardSlotModelCopyWith<$Res> {
  factory _$CardSlotModelCopyWith(_CardSlotModel value, $Res Function(_CardSlotModel) _then) = __$CardSlotModelCopyWithImpl;
@override @useResult
$Res call({
 int id, LogicGateCardModel? placedCard
});


@override $LogicGateCardModelCopyWith<$Res>? get placedCard;

}
/// @nodoc
class __$CardSlotModelCopyWithImpl<$Res>
    implements _$CardSlotModelCopyWith<$Res> {
  __$CardSlotModelCopyWithImpl(this._self, this._then);

  final _CardSlotModel _self;
  final $Res Function(_CardSlotModel) _then;

/// Create a copy of CardSlotModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? placedCard = freezed,}) {
  return _then(_CardSlotModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,placedCard: freezed == placedCard ? _self.placedCard : placedCard // ignore: cast_nullable_to_non_nullable
as LogicGateCardModel?,
  ));
}

/// Create a copy of CardSlotModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LogicGateCardModelCopyWith<$Res>? get placedCard {
    if (_self.placedCard == null) {
    return null;
  }

  return $LogicGateCardModelCopyWith<$Res>(_self.placedCard!, (value) {
    return _then(_self.copyWith(placedCard: value));
  });
}
}

// dart format on
