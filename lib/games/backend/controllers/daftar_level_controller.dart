import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CompletedLevelNotifier extends StateNotifier<int> {
  CompletedLevelNotifier() : super(0) {
    _loadCompletedLevel();
  }

  Future<void> _loadCompletedLevel() async {
    final prefs = await SharedPreferences.getInstance();
    final completedLevel = prefs.getInt('completedLevel') ?? 0;
    state = completedLevel;
  }

  Future<void> setCompletedLevel(int level) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('completedLevel', level);
    state = level;
  }
}
