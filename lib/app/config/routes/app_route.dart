import 'package:flutter/material.dart';
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
import 'package:timetocode/features/4_settings/presentation/screens/pengaturan_page.dart';
import 'package:timetocode/features/1_story_mode/presentation/screens/story_gameplay_page.dart';
import 'package:timetocode/features/2_minigames_selection/games/matriks/presentation/screens/matrix_level_selection_page.dart';
import 'package:timetocode/features/2_minigames_selection/games/matriks/presentation/screens/matrix_pointer_page.dart';
import 'package:timetocode/features/2_minigames_selection/games/matriks/presentation/screens/matrix_end_game_level_page.dart';
import 'package:timetocode/features/3_material/data/models/material_model.dart';
import 'package:timetocode/features/3_material/presentation/screens/material_detailed_screen.dart';
import 'package:timetocode/features/3_material/presentation/screens/material_screen.dart';

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
            path: '/material',
            pageBuilder: (context, state) =>
                const NoTransitionPage(child: MaterialScreen()),
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

      GoRoute(
        path: '/minigames/matriks',
        pageBuilder: (context, state) =>
            const NoTransitionPage(child: MatrixLevelSelectionPage()),
        routes: [
          GoRoute(
            path: 'level',
            parentNavigatorKey: _rootNavigatorKey,
            builder: (context, state) {
              final levelNumber = state.extra as int;
              return MatrixPointerPage(levelNumber: levelNumber);
            },
          ),
          GoRoute(
            path: 'end/:levelNumber/:correctAnswers',
            parentNavigatorKey: _rootNavigatorKey,
            builder: (context, state) {
              final levelNumber = int.tryParse(
                state.pathParameters['levelNumber'] ?? '1',
              )!;
              final correctAnswers = int.tryParse(
                state.pathParameters['correctAnswers'] ?? '0',
              )!;
              return MatrixEndLevelPage(
                levelNumber: levelNumber,
                correctAnswers: correctAnswers,
              );
            },
          ),
        ],
      ),

      GoRoute(
        path: '/material/detail',
        parentNavigatorKey: _rootNavigatorKey,
        builder: (context, state) {
          final materi = state.extra;
          if (materi is! MaterialModel) {
            return const Scaffold(
              body: Center(child: Text('Data materi tidak ditemukan')),
            );
          }
          return MaterialDetailedScreen(material: materi);
        },
      ),
    ],
  );
});