import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:timetocode/features/1_story_mode/data/models/story_model.dart';
import 'package:timetocode/features/1_story_mode/data/providers/story_load_service_provider.dart';

final storyLevelProvider = FutureProvider<List<StoryModel>>((ref) {
  return ref
      .read(storyLoadServiceProvider)
      .loadAllLevels('assets/stories/stage1.json');
});
