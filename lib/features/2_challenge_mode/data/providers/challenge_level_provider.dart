import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:timetocode/features/2_challenge_mode/data/models/challenge_model.dart';
import 'package:timetocode/features/2_challenge_mode/data/providers/challenge_load_service_provider.dart';

final challengeLevelProvider = FutureProvider<ChallengeModel>((ref) {
  return ref
      .read(challengeLoadServiceProvider)
      .loadChallenges('assets/stories/challenge.json');
});
