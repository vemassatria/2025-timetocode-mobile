import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../controllers/story_controller.dart';

final storyControllerProvider =
    AsyncNotifierProvider<StoryController, StoryState>(() => StoryController());
