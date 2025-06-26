import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:timetocode/games/backend/controllers/challenge/challenge_gameplay_controller.dart';

final challengeControllerProvider =
    AutoDisposeAsyncNotifierProvider<ChallengeController, ChallengeState>(
      () => ChallengeController(),
    );
