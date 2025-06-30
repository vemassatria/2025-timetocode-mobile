import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:timetocode/games/backend/services/visual_novel/level_service.dart';

final storyServiceProvider = Provider<LevelService>((ref) {
  return LevelService();
});
