import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:timetocode/app/data/providers/shared_preferences_provider.dart';

final storyProgressProvider = StateNotifierProvider<StoryProgressNotifier, int>(
  (ref) {
    final prefs = ref.read(sharedPrefsProvider);
    return StoryProgressNotifier(prefs);
  },
);

class StoryProgressNotifier extends StateNotifier<int> {
  final SharedPreferences _prefs;
  StoryProgressNotifier(this._prefs) : super(0) {
    _load();
  }

  Future<void> _load() async {
    state = _prefs.getInt('completedLevel') ?? 0;
  }

  Future<void> setCompletedLevel(int level) async {
    await _prefs.setInt('completedLevel', level);
    state = level;
  }
}
