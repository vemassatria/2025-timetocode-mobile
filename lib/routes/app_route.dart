import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:timetocode/pages/challenge/end_game_page.dart';
import 'package:timetocode/pages/drag_and_drop/gameplay.dart';
import 'package:timetocode/routes/main_navigation.dart';
import 'package:timetocode/pages/challenge/challenge_gameplay_page.dart';
import 'package:timetocode/pages/main_tabs/challenge_level_page.dart';
import 'package:timetocode/pages/main_tabs/story_level_page.dart';
import 'package:timetocode/pages/visual_novel/end_game_page.dart';
import 'package:timetocode/pages/main_tabs/pengaturan.dart';
import 'package:timetocode/pages/visual_novel/story_gameplay_page.dart';

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
            pageBuilder:
                (context, state) =>
                    const NoTransitionPage(child: DaftarLevelPage()),
            routes: [
              GoRoute(
                path: 'level',
                parentNavigatorKey: _rootNavigatorKey,
                builder: (context, state) {
                  return const StoryGameplayPage();
                },
              ),
              GoRoute(
                path: 'endgame',
                parentNavigatorKey: _rootNavigatorKey,
                builder: (context, state) {
                  return const EndGameScreen();
                },
              ),
            ],
          ),
          GoRoute(
            path: '/tantangan',
            pageBuilder:
                (context, state) =>
                    const NoTransitionPage(child: ChallengePage()),
            routes: [
              GoRoute(
                path: 'level',
                parentNavigatorKey: _rootNavigatorKey,
                builder: (context, state) {
                  return const ChallengeGameplayPage();
                },
              ),
              GoRoute(
                path: 'endgame',
                parentNavigatorKey: _rootNavigatorKey,
                builder: (context, state) {
                  return const EndGameChallenge();
                },
              ),
            ],
          ),
          GoRoute(
            path: '/pengaturan',
            pageBuilder:
                (context, state) =>
                    const NoTransitionPage(child: PengaturanPage()),
          ),
        ],
      ),
      GoRoute(
        path: '/dnd',
        builder: (context, state) => const DragAndDropQuestionWidget(),
      ),
    ],
  );
});
