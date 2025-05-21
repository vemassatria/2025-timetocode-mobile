import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CompletedLevelNotifier extends StateNotifier<int> {
  final SharedPreferences _prefs;
  CompletedLevelNotifier(this._prefs) : super(0) {
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
