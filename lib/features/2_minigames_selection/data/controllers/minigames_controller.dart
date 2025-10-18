import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../app/data/services/sound_effect_service.dart';
import '../../data/models/minigames_model.dart';

class MinigamesController {
  final Ref ref;
  MinigamesController(this.ref);

  final List<MinigamesModel> minigames = const [
    MinigamesModel(
      title: "Kuis Tantangan",
      image: "assets/images/minigames/tantangan.svg",
      route: "/minigames/tantangan",
    ),
    MinigamesModel(
      title: "Gerbang Logika",
      image: "assets/images/minigames/logic-gate.svg",
      route: "/minigames/logic-gate",
    ),
  ];

  void onSelect(BuildContext context, String route) {
    ref.read(soundEffectServiceProvider.notifier).playSelectClick();
    context.push(route);
  }
}
