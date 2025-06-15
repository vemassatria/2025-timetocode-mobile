import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:timetocode/games/backend/services/music_service.dart';

final musicServiceProvider = NotifierProvider<MusicService, bool>(
  MusicService.new,
);
