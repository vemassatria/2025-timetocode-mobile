import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:timetocode/features/1_story_mode/data/services/story_load_service.dart';

final storyLoadServiceProvider = Provider.autoDispose<StoryLoadService>((ref) {
  return StoryLoadService();
});
