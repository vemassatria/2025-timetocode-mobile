import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:timetocode/games/backend/services/challenge/challenge_service.dart';

final challengeServiceProvider = Provider<ChallengeService>((ref) {
  return ChallengeService();
});
