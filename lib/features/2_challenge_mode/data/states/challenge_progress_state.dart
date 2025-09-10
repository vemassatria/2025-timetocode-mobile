import 'package:freezed_annotation/freezed_annotation.dart';

part 'challenge_progress_state.freezed.dart';

@freezed
abstract class ChallengeProgressState with _$ChallengeProgressState {
  const factory ChallengeProgressState({
    required int level,
    required int stars,
  }) = _ChallengeProgressState;
}
