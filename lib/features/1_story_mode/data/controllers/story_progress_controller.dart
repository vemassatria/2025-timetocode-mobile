import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:timetocode/app/data/services/hive_service.dart';

final storyProgressProvider = StateNotifierProvider<StoryProgressNotifier, int>(
  (ref) {
    final hiveService = ref.watch(hiveProvider);
    return StoryProgressNotifier(hiveService);
  },
);

class StoryProgressNotifier extends StateNotifier<int> {
  final HiveService _hiveService;

  StoryProgressNotifier(this._hiveService)
    : super(_hiveService.storyGetProgress());

  Future<void> setCompletedLevel(int level) async {
    if (level > state) {
      await _hiveService.storySaveProgress(level);
      state = level;
    }
  }
}
