import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:timetocode/games/backend/services/sound_effect_service.dart';

final soundEffectServiceProvider = NotifierProvider<SoundEffectService, bool>(
  SoundEffectService.new,
);
