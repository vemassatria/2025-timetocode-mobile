import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:timetocode/features/2_challenge_mode/data/services/challenge_load_service.dart';

final challengeLoadServiceProvider = Provider.autoDispose<ChallengeLoadService>(
  (ref) {
    return ChallengeLoadService();
  },
);
