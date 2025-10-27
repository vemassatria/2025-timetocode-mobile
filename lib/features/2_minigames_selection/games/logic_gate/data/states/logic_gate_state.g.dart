// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'logic_gate_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_LogicGateState _$LogicGateStateFromJson(Map<String, dynamic> json) =>
    _LogicGateState(
      binarySlots: (json['binarySlots'] as List<dynamic>?)
          ?.map((e) => BinarySlotModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      cardSlots: (json['cardSlots'] as List<dynamic>?)
          ?.map((e) => CardSlotModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      player: json['player'] == null
          ? null
          : PlayerModel.fromJson(json['player'] as Map<String, dynamic>),
      opponent: json['opponent'] == null
          ? null
          : PlayerModel.fromJson(json['opponent'] as Map<String, dynamic>),
      currentPlayerId: (json['currentPlayerId'] as num?)?.toInt() ?? 1,
      lastUpdatedCardSlotId: (json['lastUpdatedCardSlotId'] as num?)?.toInt(),
      winnerPlayerId: (json['winnerPlayerId'] as num?)?.toInt(),
      vsAI: json['vsAI'] as bool? ?? false,
      isOnline: json['isOnline'] as bool? ?? false,
      difficulty:
          $enumDecodeNullable(_$AiDifficultyEnumMap, json['difficulty']) ??
          AiDifficulty.medium,
      isLoading: json['isLoading'] as bool?,
    );

Map<String, dynamic> _$LogicGateStateToJson(_LogicGateState instance) =>
    <String, dynamic>{
      'binarySlots': instance.binarySlots,
      'cardSlots': instance.cardSlots,
      'player': instance.player,
      'opponent': instance.opponent,
      'currentPlayerId': instance.currentPlayerId,
      'lastUpdatedCardSlotId': instance.lastUpdatedCardSlotId,
      'winnerPlayerId': instance.winnerPlayerId,
      'vsAI': instance.vsAI,
      'isOnline': instance.isOnline,
      'difficulty': _$AiDifficultyEnumMap[instance.difficulty]!,
      'isLoading': instance.isLoading,
    };

const _$AiDifficultyEnumMap = {
  AiDifficulty.easy: 'easy',
  AiDifficulty.medium: 'medium',
  AiDifficulty.hard: 'hard',
};
