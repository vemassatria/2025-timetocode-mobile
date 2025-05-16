import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:timetocode/games/backend/game_engine.dart';

final gameEngineProvider = Provider<GameEngine>((ref) {
  final game = GameEngine();
  ref.onDispose(game.onRemove);
  return game;
});
