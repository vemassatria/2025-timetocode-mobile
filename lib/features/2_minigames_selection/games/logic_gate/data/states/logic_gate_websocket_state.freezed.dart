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

 LogicGateWebsocketStatus get status; String? get errorMessage; LogicGateState? get gameState;
/// Create a copy of LogicGateWebsocketState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LogicGateWebsocketStateCopyWith<LogicGateWebsocketState> get copyWith => _$LogicGateWebsocketStateCopyWithImpl<LogicGateWebsocketState>(this as LogicGateWebsocketState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LogicGateWebsocketState&&(identical(other.status, status) || other.status == status)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.gameState, gameState) || other.gameState == gameState));
}


@override
int get hashCode => Object.hash(runtimeType,status,errorMessage,gameState);

@override
String toString() {
  return 'LogicGateWebsocketState(status: $status, errorMessage: $errorMessage, gameState: $gameState)';
}


}

/// @nodoc
abstract mixin class $LogicGateWebsocketStateCopyWith<$Res>  {
  factory $LogicGateWebsocketStateCopyWith(LogicGateWebsocketState value, $Res Function(LogicGateWebsocketState) _then) = _$LogicGateWebsocketStateCopyWithImpl;
@useResult
$Res call({
 LogicGateWebsocketStatus status, String? errorMessage, LogicGateState? gameState
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
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? errorMessage = freezed,Object? gameState = freezed,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as LogicGateWebsocketStatus,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,gameState: freezed == gameState ? _self.gameState : gameState // ignore: cast_nullable_to_non_nullable
as LogicGateState?,
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( LogicGateWebsocketStatus status,  String? errorMessage,  LogicGateState? gameState)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LogicGateWebsocketState() when $default != null:
return $default(_that.status,_that.errorMessage,_that.gameState);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( LogicGateWebsocketStatus status,  String? errorMessage,  LogicGateState? gameState)  $default,) {final _that = this;
switch (_that) {
case _LogicGateWebsocketState():
return $default(_that.status,_that.errorMessage,_that.gameState);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( LogicGateWebsocketStatus status,  String? errorMessage,  LogicGateState? gameState)?  $default,) {final _that = this;
switch (_that) {
case _LogicGateWebsocketState() when $default != null:
return $default(_that.status,_that.errorMessage,_that.gameState);case _:
  return null;

}
}

}

/// @nodoc


class _LogicGateWebsocketState implements LogicGateWebsocketState {
  const _LogicGateWebsocketState({required this.status, this.errorMessage, this.gameState});
  

@override final  LogicGateWebsocketStatus status;
@override final  String? errorMessage;
@override final  LogicGateState? gameState;

/// Create a copy of LogicGateWebsocketState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LogicGateWebsocketStateCopyWith<_LogicGateWebsocketState> get copyWith => __$LogicGateWebsocketStateCopyWithImpl<_LogicGateWebsocketState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LogicGateWebsocketState&&(identical(other.status, status) || other.status == status)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.gameState, gameState) || other.gameState == gameState));
}


@override
int get hashCode => Object.hash(runtimeType,status,errorMessage,gameState);

@override
String toString() {
  return 'LogicGateWebsocketState(status: $status, errorMessage: $errorMessage, gameState: $gameState)';
}


}

/// @nodoc
abstract mixin class _$LogicGateWebsocketStateCopyWith<$Res> implements $LogicGateWebsocketStateCopyWith<$Res> {
  factory _$LogicGateWebsocketStateCopyWith(_LogicGateWebsocketState value, $Res Function(_LogicGateWebsocketState) _then) = __$LogicGateWebsocketStateCopyWithImpl;
@override @useResult
$Res call({
 LogicGateWebsocketStatus status, String? errorMessage, LogicGateState? gameState
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
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? errorMessage = freezed,Object? gameState = freezed,}) {
  return _then(_LogicGateWebsocketState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as LogicGateWebsocketStatus,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,gameState: freezed == gameState ? _self.gameState : gameState // ignore: cast_nullable_to_non_nullable
as LogicGateState?,
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
