import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../services/resource_service.dart';
import 'package:flame/cache.dart';

final imagesProvider = Provider<Images>((ref) {
  return Images();
});

final resourceServiceProvider = Provider<ResourceService>((ref) {
  final images = ref.read(imagesProvider);
  return ResourceService(images);
});
