import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:timetocode/games/backend/models/visual_novel/level_model.dart';
import 'package:timetocode/games/backend/providers/visual_novel/story_service_provider.dart';

final storyLevelProvider = FutureProvider<List<LevelModel>>((ref) {
  final levelService = ref.read(storyServiceProvider);
  return levelService.loadAllLevels('assets/stories/stage1.json');
});
