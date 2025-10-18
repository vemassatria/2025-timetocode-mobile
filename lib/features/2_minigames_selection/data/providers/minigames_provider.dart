import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../controllers/minigames_controller.dart';

final minigamesProvider = Provider<MinigamesController>((ref) {
  return MinigamesController(ref);
});
