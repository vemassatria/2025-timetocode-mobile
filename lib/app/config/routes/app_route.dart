import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:timetocode/features/2_minigames_selection/games/challenge/presentation/screens/end_game_page.dart';
import 'package:timetocode/app/config/routes/main_navigation.dart';
import 'package:timetocode/features/2_minigames_selection/games/challenge/presentation/screens/challenge_gameplay_page.dart';
import 'package:timetocode/features/2_minigames_selection/games/challenge/presentation/screens/challenge_selection_page.dart';
import 'package:timetocode/features/1_story_mode/presentation/screens/story_selection_page.dart';
import 'package:timetocode/features/1_story_mode/presentation/screens/end_game_page.dart';
import 'package:timetocode/features/2_minigames_selection/games/logic_gate/presentation/screens/logic_gate_gameplay.dart';
import 'package:timetocode/features/2_minigames_selection/games/logic_gate/presentation/screens/logic_gate_page.dart';
import 'package:timetocode/features/2_minigames_selection/presentation/screens/minigames_selection_page.dart';
import 'package:timetocode/features/3_settings/presentation/screens/pengaturan_page.dart';
import 'package:timetocode/features/1_story_mode/presentation/screens/story_gameplay_page.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();

final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: '/pembelajaran',

    routes: [
      ShellRoute(
        navigatorKey: _shellNavigatorKey,
        builder: (context, state, child) {
          return MainNavigation(child: child);
        },
        routes: [
          GoRoute(
            path: '/pembelajaran',
            pageBuilder: (context, state) =>
                const NoTransitionPage(child: StorySelectionPage()),
            routes: [
              GoRoute(
                path: 'level',
                parentNavigatorKey: _rootNavigatorKey,
                builder: (context, state) => const StoryGameplayPage(),
              ),
              GoRoute(
                path: 'endgame',
                parentNavigatorKey: _rootNavigatorKey,
                builder: (context, state) => const EndGameScreen(),
              ),
            ],
          ),

          GoRoute(
            path: '/minigames',
            pageBuilder: (context, state) =>
                const NoTransitionPage(child: MinigamesSelectionPage()),
          ),

          GoRoute(
            path: '/pengaturan',
            pageBuilder: (context, state) =>
                const NoTransitionPage(child: PengaturanPage()),
          ),
        ],
      ),

      GoRoute(
        path: '/minigames/tantangan',
        parentNavigatorKey: _rootNavigatorKey,
        pageBuilder: (context, state) =>
            const NoTransitionPage(child: ChallengeSelectionPage()),
        routes: [
          GoRoute(
            path: 'level',
            parentNavigatorKey: _rootNavigatorKey,
            builder: (context, state) => const ChallengeGameplayPage(),
          ),
          GoRoute(
            path: 'endgame',
            parentNavigatorKey: _rootNavigatorKey,
            builder: (context, state) => const EndGameChallenge(),
          ),
        ],
      ),

      GoRoute(
        path: '/minigames/logic-gate',
        parentNavigatorKey: _rootNavigatorKey,
        pageBuilder: (context, state) =>
            const NoTransitionPage(child: LogicGatePage()),
        routes: [
          GoRoute(
            path: 'gameplay',
            parentNavigatorKey: _rootNavigatorKey,
            builder: (context, state) => const LogicGateGameplay(),
          ),
        ],
      ),
    ],
  );
});
