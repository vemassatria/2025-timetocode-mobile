import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:timetocode/games/backend/controllers/level_controller.dart';

final completedLevelProvider =
    StateNotifierProvider<CompletedLevelNotifier, int>((ref) {
      return CompletedLevelNotifier();
    });
