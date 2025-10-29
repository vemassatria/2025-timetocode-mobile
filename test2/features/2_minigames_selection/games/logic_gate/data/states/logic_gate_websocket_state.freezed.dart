// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'logic_gate_websocket_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$LogicGateWebsocketState {

 String? get roomId; int? get playerId; LogicGateState? get gameState; LogicGateWebsocketStatus get status; String? get errorMessage;
/// Create a copy of LogicGateWebsocketState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LogicGateWebsocketStateCopyWith<LogicGateWebsocketState> get copyWith => _$LogicGateWebsocketStateCopyWithImpl<LogicGateWebsocketState>(this as LogicGateWebsocketState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LogicGateWebsocketState&&(identical(other.roomId, roomId) || other.roomId == roomId)&&(identical(other.playerId, playerId) || other.playerId == playerId)&&(identical(other.gameState, gameState) || other.gameState == gameState)&&(identical(other.status, status) || other.status == status)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,roomId,playerId,gameState,status,errorMessage);

@override
String toString() {
  return 'LogicGateWebsocketState(roomId: $roomId, playerId: $playerId, gameState: $gameState, status: $status, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $LogicGateWebsocketStateCopyWith<$Res>  {
  factory $LogicGateWebsocketStateCopyWith(LogicGateWebsocketState value, $Res Function(LogicGateWebsocketState) _then) = _$LogicGateWebsocketStateCopyWithImpl;
@useResult
$Res call({
 String? roomId, int? playerId, LogicGateState? gameState, LogicGateWebsocketStatus status, String? errorMessage
});


$LogicGateStateCopyWith<$Res>? get gameState;

}
/// @nodoc
class _$LogicGateWebsocketStateCopyWithImpl<$Res>
    implements $LogicGateWebsocketStateCopyWith<$Res> {
  _$LogicGateWebsocketStateCopyWithImpl(this._self, this._then);

  final LogicGateWebsocketState _self;
  final $Res Function(LogicGateWebsocketState) _then;

/// Create a copy of LogicGateWebsocketState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? roomId = freezed,Object? playerId = freezed,Object? gameState = freezed,Object? status = null,Object? errorMessage = freezed,}) {
  return _then(_self.copyWith(
roomId: freezed == roomId ? _self.roomId : roomId // ignore: cast_nullable_to_non_nullable
as String?,playerId: freezed == playerId ? _self.playerId : playerId // ignore: cast_nullable_to_non_nullable
as int?,gameState: freezed == gameState ? _self.gameState : gameState // ignore: cast_nullable_to_non_nullable
as LogicGateState?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as LogicGateWebsocketStatus,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of LogicGateWebsocketState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LogicGateStateCopyWith<$Res>? get gameState {
    if (_self.gameState == null) {
    return null;
  }

  return $LogicGateStateCopyWith<$Res>(_self.gameState!, (value) {
    return _then(_self.copyWith(gameState: value));
  });
}
}


/// Adds pattern-matching-related methods to [LogicGateWebsocketState].
extension LogicGateWebsocketStatePatterns on LogicGateWebsocketState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LogicGateWebsocketState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LogicGateWebsocketState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LogicGateWebsocketState value)  $default,){
final _that = this;
switch (_that) {
case _LogicGateWebsocketState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LogicGateWebsocketState value)?  $default,){
final _that = this;
switch (_that) {
case _LogicGateWebsocketState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? roomId,  int? playerId,  LogicGateState? gameState,  LogicGateWebsocketStatus status,  String? errorMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LogicGateWebsocketState() when $default != null:
return $default(_that.roomId,_that.playerId,_that.gameState,_that.status,_that.errorMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? roomId,  int? playerId,  LogicGateState? gameState,  LogicGateWebsocketStatus status,  String? errorMessage)  $default,) {final _that = this;
switch (_that) {
case _LogicGateWebsocketState():
return $default(_that.roomId,_that.playerId,_that.gameState,_that.status,_that.errorMessage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? roomId,  int? playerId,  LogicGateState? gameState,  LogicGateWebsocketStatus status,  String? errorMessage)?  $default,) {final _that = this;
switch (_that) {
case _LogicGateWebsocketState() when $default != null:
return $default(_that.roomId,_that.playerId,_that.gameState,_that.status,_that.errorMessage);case _:
  return null;

}
}

}

/// @nodoc


class _LogicGateWebsocketState implements LogicGateWebsocketState {
  const _LogicGateWebsocketState({this.roomId, this.playerId, this.gameState, required this.status, this.errorMessage});
  

@override final  String? roomId;
@override final  int? playerId;
@override final  LogicGateState? gameState;
@override final  LogicGateWebsocketStatus status;
@override final  String? errorMessage;

/// Create a copy of LogicGateWebsocketState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LogicGateWebsocketStateCopyWith<_LogicGateWebsocketState> get copyWith => __$LogicGateWebsocketStateCopyWithImpl<_LogicGateWebsocketState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LogicGateWebsocketState&&(identical(other.roomId, roomId) || other.roomId == roomId)&&(identical(other.playerId, playerId) || other.playerId == playerId)&&(identical(other.gameState, gameState) || other.gameState == gameState)&&(identical(other.status, status) || other.status == status)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,roomId,playerId,gameState,status,errorMessage);

@override
String toString() {
  return 'LogicGateWebsocketState(roomId: $roomId, playerId: $playerId, gameState: $gameState, status: $status, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class _$LogicGateWebsocketStateCopyWith<$Res> implements $LogicGateWebsocketStateCopyWith<$Res> {
  factory _$LogicGateWebsocketStateCopyWith(_LogicGateWebsocketState value, $Res Function(_LogicGateWebsocketState) _then) = __$LogicGateWebsocketStateCopyWithImpl;
@override @useResult
$Res call({
 String? roomId, int? playerId, LogicGateState? gameState, LogicGateWebsocketStatus status, String? errorMessage
});


@override $LogicGateStateCopyWith<$Res>? get gameState;

}
/// @nodoc
class __$LogicGateWebsocketStateCopyWithImpl<$Res>
    implements _$LogicGateWebsocketStateCopyWith<$Res> {
  __$LogicGateWebsocketStateCopyWithImpl(this._self, this._then);

  final _LogicGateWebsocketState _self;
  final $Res Function(_LogicGateWebsocketState) _then;

/// Create a copy of LogicGateWebsocketState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? roomId = freezed,Object? playerId = freezed,Object? gameState = freezed,Object? status = null,Object? errorMessage = freezed,}) {
  return _then(_LogicGateWebsocketState(
roomId: freezed == roomId ? _self.roomId : roomId // ignore: cast_nullable_to_non_nullable
as String?,playerId: freezed == playerId ? _self.playerId : playerId // ignore: cast_nullable_to_non_nullable
as int?,gameState: freezed == gameState ? _self.gameState : gameState // ignore: cast_nullable_to_non_nullable
as LogicGateState?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as LogicGateWebsocketStatus,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of LogicGateWebsocketState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LogicGateStateCopyWith<$Res>? get gameState {
    if (_self.gameState == null) {
    return null;
  }

  return $LogicGateStateCopyWith<$Res>(_self.gameState!, (value) {
    return _then(_self.copyWith(gameState: value));
  });
}
}

// dart format on
