// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'logic_gate_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$LogicGateState {

 List<BinarySlotModel>? get binarySlots; List<CardSlotModel>? get cardSlots; PlayerModel? get player; PlayerModel? get opponent; int get currentPlayerId; int? get outputBinary; int? get lastUpdatedCardSlotId; bool get vsAI; AiDifficulty get difficulty; bool? get isLoading;
/// Create a copy of LogicGateState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LogicGateStateCopyWith<LogicGateState> get copyWith => _$LogicGateStateCopyWithImpl<LogicGateState>(this as LogicGateState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LogicGateState&&const DeepCollectionEquality().equals(other.binarySlots, binarySlots)&&const DeepCollectionEquality().equals(other.cardSlots, cardSlots)&&(identical(other.player, player) || other.player == player)&&(identical(other.opponent, opponent) || other.opponent == opponent)&&(identical(other.currentPlayerId, currentPlayerId) || other.currentPlayerId == currentPlayerId)&&(identical(other.outputBinary, outputBinary) || other.outputBinary == outputBinary)&&(identical(other.lastUpdatedCardSlotId, lastUpdatedCardSlotId) || other.lastUpdatedCardSlotId == lastUpdatedCardSlotId)&&(identical(other.vsAI, vsAI) || other.vsAI == vsAI)&&(identical(other.difficulty, difficulty) || other.difficulty == difficulty)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(binarySlots),const DeepCollectionEquality().hash(cardSlots),player,opponent,currentPlayerId,outputBinary,lastUpdatedCardSlotId,vsAI,difficulty,isLoading);

@override
String toString() {
  return 'LogicGateState(binarySlots: $binarySlots, cardSlots: $cardSlots, player: $player, opponent: $opponent, currentPlayerId: $currentPlayerId, outputBinary: $outputBinary, lastUpdatedCardSlotId: $lastUpdatedCardSlotId, vsAI: $vsAI, difficulty: $difficulty, isLoading: $isLoading)';
}


}

/// @nodoc
abstract mixin class $LogicGateStateCopyWith<$Res>  {
  factory $LogicGateStateCopyWith(LogicGateState value, $Res Function(LogicGateState) _then) = _$LogicGateStateCopyWithImpl;
@useResult
$Res call({
 List<BinarySlotModel>? binarySlots, List<CardSlotModel>? cardSlots, PlayerModel? player, PlayerModel? opponent, int currentPlayerId, int? outputBinary, int? lastUpdatedCardSlotId, bool vsAI, AiDifficulty difficulty, bool? isLoading
});


$PlayerModelCopyWith<$Res>? get player;$PlayerModelCopyWith<$Res>? get opponent;

}
/// @nodoc
class _$LogicGateStateCopyWithImpl<$Res>
    implements $LogicGateStateCopyWith<$Res> {
  _$LogicGateStateCopyWithImpl(this._self, this._then);

  final LogicGateState _self;
  final $Res Function(LogicGateState) _then;

/// Create a copy of LogicGateState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? binarySlots = freezed,Object? cardSlots = freezed,Object? player = freezed,Object? opponent = freezed,Object? currentPlayerId = null,Object? outputBinary = freezed,Object? lastUpdatedCardSlotId = freezed,Object? vsAI = null,Object? difficulty = null,Object? isLoading = freezed,}) {
  return _then(_self.copyWith(
binarySlots: freezed == binarySlots ? _self.binarySlots : binarySlots // ignore: cast_nullable_to_non_nullable
as List<BinarySlotModel>?,cardSlots: freezed == cardSlots ? _self.cardSlots : cardSlots // ignore: cast_nullable_to_non_nullable
as List<CardSlotModel>?,player: freezed == player ? _self.player : player // ignore: cast_nullable_to_non_nullable
as PlayerModel?,opponent: freezed == opponent ? _self.opponent : opponent // ignore: cast_nullable_to_non_nullable
as PlayerModel?,currentPlayerId: null == currentPlayerId ? _self.currentPlayerId : currentPlayerId // ignore: cast_nullable_to_non_nullable
as int,outputBinary: freezed == outputBinary ? _self.outputBinary : outputBinary // ignore: cast_nullable_to_non_nullable
as int?,lastUpdatedCardSlotId: freezed == lastUpdatedCardSlotId ? _self.lastUpdatedCardSlotId : lastUpdatedCardSlotId // ignore: cast_nullable_to_non_nullable
as int?,vsAI: null == vsAI ? _self.vsAI : vsAI // ignore: cast_nullable_to_non_nullable
as bool,difficulty: null == difficulty ? _self.difficulty : difficulty // ignore: cast_nullable_to_non_nullable
as AiDifficulty,isLoading: freezed == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}
/// Create a copy of LogicGateState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PlayerModelCopyWith<$Res>? get player {
    if (_self.player == null) {
    return null;
  }

  return $PlayerModelCopyWith<$Res>(_self.player!, (value) {
    return _then(_self.copyWith(player: value));
  });
}/// Create a copy of LogicGateState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PlayerModelCopyWith<$Res>? get opponent {
    if (_self.opponent == null) {
    return null;
  }

  return $PlayerModelCopyWith<$Res>(_self.opponent!, (value) {
    return _then(_self.copyWith(opponent: value));
  });
}
}


/// Adds pattern-matching-related methods to [LogicGateState].
extension LogicGateStatePatterns on LogicGateState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LogicGateState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LogicGateState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LogicGateState value)  $default,){
final _that = this;
switch (_that) {
case _LogicGateState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LogicGateState value)?  $default,){
final _that = this;
switch (_that) {
case _LogicGateState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<BinarySlotModel>? binarySlots,  List<CardSlotModel>? cardSlots,  PlayerModel? player,  PlayerModel? opponent,  int currentPlayerId,  int? outputBinary,  int? lastUpdatedCardSlotId,  bool vsAI,  AiDifficulty difficulty,  bool? isLoading)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LogicGateState() when $default != null:
return $default(_that.binarySlots,_that.cardSlots,_that.player,_that.opponent,_that.currentPlayerId,_that.outputBinary,_that.lastUpdatedCardSlotId,_that.vsAI,_that.difficulty,_that.isLoading);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<BinarySlotModel>? binarySlots,  List<CardSlotModel>? cardSlots,  PlayerModel? player,  PlayerModel? opponent,  int currentPlayerId,  int? outputBinary,  int? lastUpdatedCardSlotId,  bool vsAI,  AiDifficulty difficulty,  bool? isLoading)  $default,) {final _that = this;
switch (_that) {
case _LogicGateState():
return $default(_that.binarySlots,_that.cardSlots,_that.player,_that.opponent,_that.currentPlayerId,_that.outputBinary,_that.lastUpdatedCardSlotId,_that.vsAI,_that.difficulty,_that.isLoading);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<BinarySlotModel>? binarySlots,  List<CardSlotModel>? cardSlots,  PlayerModel? player,  PlayerModel? opponent,  int currentPlayerId,  int? outputBinary,  int? lastUpdatedCardSlotId,  bool vsAI,  AiDifficulty difficulty,  bool? isLoading)?  $default,) {final _that = this;
switch (_that) {
case _LogicGateState() when $default != null:
return $default(_that.binarySlots,_that.cardSlots,_that.player,_that.opponent,_that.currentPlayerId,_that.outputBinary,_that.lastUpdatedCardSlotId,_that.vsAI,_that.difficulty,_that.isLoading);case _:
  return null;

}
}

}

/// @nodoc


class _LogicGateState implements LogicGateState {
  const _LogicGateState({final  List<BinarySlotModel>? binarySlots, final  List<CardSlotModel>? cardSlots, this.player, this.opponent, this.currentPlayerId = 1, this.outputBinary, this.lastUpdatedCardSlotId, this.vsAI = false, this.difficulty = AiDifficulty.medium, this.isLoading}): _binarySlots = binarySlots,_cardSlots = cardSlots;
  

 final  List<BinarySlotModel>? _binarySlots;
@override List<BinarySlotModel>? get binarySlots {
  final value = _binarySlots;
  if (value == null) return null;
  if (_binarySlots is EqualUnmodifiableListView) return _binarySlots;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<CardSlotModel>? _cardSlots;
@override List<CardSlotModel>? get cardSlots {
  final value = _cardSlots;
  if (value == null) return null;
  if (_cardSlots is EqualUnmodifiableListView) return _cardSlots;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  PlayerModel? player;
@override final  PlayerModel? opponent;
@override@JsonKey() final  int currentPlayerId;
@override final  int? outputBinary;
@override final  int? lastUpdatedCardSlotId;
@override@JsonKey() final  bool vsAI;
@override@JsonKey() final  AiDifficulty difficulty;
@override final  bool? isLoading;

/// Create a copy of LogicGateState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LogicGateStateCopyWith<_LogicGateState> get copyWith => __$LogicGateStateCopyWithImpl<_LogicGateState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LogicGateState&&const DeepCollectionEquality().equals(other._binarySlots, _binarySlots)&&const DeepCollectionEquality().equals(other._cardSlots, _cardSlots)&&(identical(other.player, player) || other.player == player)&&(identical(other.opponent, opponent) || other.opponent == opponent)&&(identical(other.currentPlayerId, currentPlayerId) || other.currentPlayerId == currentPlayerId)&&(identical(other.outputBinary, outputBinary) || other.outputBinary == outputBinary)&&(identical(other.lastUpdatedCardSlotId, lastUpdatedCardSlotId) || other.lastUpdatedCardSlotId == lastUpdatedCardSlotId)&&(identical(other.vsAI, vsAI) || other.vsAI == vsAI)&&(identical(other.difficulty, difficulty) || other.difficulty == difficulty)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_binarySlots),const DeepCollectionEquality().hash(_cardSlots),player,opponent,currentPlayerId,outputBinary,lastUpdatedCardSlotId,vsAI,difficulty,isLoading);

@override
String toString() {
  return 'LogicGateState(binarySlots: $binarySlots, cardSlots: $cardSlots, player: $player, opponent: $opponent, currentPlayerId: $currentPlayerId, outputBinary: $outputBinary, lastUpdatedCardSlotId: $lastUpdatedCardSlotId, vsAI: $vsAI, difficulty: $difficulty, isLoading: $isLoading)';
}


}

/// @nodoc
abstract mixin class _$LogicGateStateCopyWith<$Res> implements $LogicGateStateCopyWith<$Res> {
  factory _$LogicGateStateCopyWith(_LogicGateState value, $Res Function(_LogicGateState) _then) = __$LogicGateStateCopyWithImpl;
@override @useResult
$Res call({
 List<BinarySlotModel>? binarySlots, List<CardSlotModel>? cardSlots, PlayerModel? player, PlayerModel? opponent, int currentPlayerId, int? outputBinary, int? lastUpdatedCardSlotId, bool vsAI, AiDifficulty difficulty, bool? isLoading
});


@override $PlayerModelCopyWith<$Res>? get player;@override $PlayerModelCopyWith<$Res>? get opponent;

}
/// @nodoc
class __$LogicGateStateCopyWithImpl<$Res>
    implements _$LogicGateStateCopyWith<$Res> {
  __$LogicGateStateCopyWithImpl(this._self, this._then);

  final _LogicGateState _self;
  final $Res Function(_LogicGateState) _then;

/// Create a copy of LogicGateState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? binarySlots = freezed,Object? cardSlots = freezed,Object? player = freezed,Object? opponent = freezed,Object? currentPlayerId = null,Object? outputBinary = freezed,Object? lastUpdatedCardSlotId = freezed,Object? vsAI = null,Object? difficulty = null,Object? isLoading = freezed,}) {
  return _then(_LogicGateState(
binarySlots: freezed == binarySlots ? _self._binarySlots : binarySlots // ignore: cast_nullable_to_non_nullable
as List<BinarySlotModel>?,cardSlots: freezed == cardSlots ? _self._cardSlots : cardSlots // ignore: cast_nullable_to_non_nullable
as List<CardSlotModel>?,player: freezed == player ? _self.player : player // ignore: cast_nullable_to_non_nullable
as PlayerModel?,opponent: freezed == opponent ? _self.opponent : opponent // ignore: cast_nullable_to_non_nullable
as PlayerModel?,currentPlayerId: null == currentPlayerId ? _self.currentPlayerId : currentPlayerId // ignore: cast_nullable_to_non_nullable
as int,outputBinary: freezed == outputBinary ? _self.outputBinary : outputBinary // ignore: cast_nullable_to_non_nullable
as int?,lastUpdatedCardSlotId: freezed == lastUpdatedCardSlotId ? _self.lastUpdatedCardSlotId : lastUpdatedCardSlotId // ignore: cast_nullable_to_non_nullable
as int?,vsAI: null == vsAI ? _self.vsAI : vsAI // ignore: cast_nullable_to_non_nullable
as bool,difficulty: null == difficulty ? _self.difficulty : difficulty // ignore: cast_nullable_to_non_nullable
as AiDifficulty,isLoading: freezed == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}

/// Create a copy of LogicGateState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PlayerModelCopyWith<$Res>? get player {
    if (_self.player == null) {
    return null;
  }

  return $PlayerModelCopyWith<$Res>(_self.player!, (value) {
    return _then(_self.copyWith(player: value));
  });
}/// Create a copy of LogicGateState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PlayerModelCopyWith<$Res>? get opponent {
    if (_self.opponent == null) {
    return null;
  }

  return $PlayerModelCopyWith<$Res>(_self.opponent!, (value) {
    return _then(_self.copyWith(opponent: value));
  });
}
}

// dart format on
