import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../controllers/visual_novel/story_gameplay_controller.dart';

final storyControllerProvider =
    AutoDisposeAsyncNotifierProvider<StoryController, StoryState>(() {
      return StoryController();
    });
