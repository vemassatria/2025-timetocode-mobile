import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:timetocode/games/backend/models/challenge/challenge_model.dart';
import 'package:timetocode/games/backend/providers/challenge/challenge_service_provider.dart';

final challengeLevelProvider = FutureProvider<ChallengeModel>((ref) {
  final levelService = ref.read(challengeServiceProvider);
  return levelService.loadChallenges('assets/stories/challenge.json');
});
