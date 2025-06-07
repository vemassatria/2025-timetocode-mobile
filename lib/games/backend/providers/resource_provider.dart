import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:timetocode/games/backend/providers/game_provider.dart';
import '../services/resource_service.dart';
import 'package:flame/cache.dart';

final imagesProvider = Provider<Images>((ref) {
  final game = ref.read(gameEngineProvider);
  return game.images;
});

final resourceServiceProvider = Provider<ResourceService>((ref) {
  final images = ref.read(imagesProvider);
  return ResourceService(images);
});
