import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:timetocode/components/popups/popscope_popups.dart';
import 'package:timetocode/games/backend/providers/sound_effect_service_provider.dart';
import 'package:timetocode/themes/colors.dart';
import 'package:timetocode/themes/typography.dart';
import 'package:timetocode/utils/overlay_utils.dart';

class MainNavigation extends ConsumerWidget {
  final Widget child;

  const MainNavigation({required this.child, super.key});

  int _calculateSelectedIndex(BuildContext context) {
    final String location = GoRouterState.of(context).matchedLocation;
    if (location.startsWith('/pembelajaran')) {
      return 0;
    }
    if (location.startsWith('/tantangan')) {
      return 1;
    }
    if (location.startsWith('/pengaturan')) {
      return 2;
    }
    return 0;
  }

  void _onItemTapped(int index, BuildContext context, WidgetRef ref) {
    ref.read(soundEffectServiceProvider.notifier).playButtonClick2();

    switch (index) {
      case 0:
        context.go('/pembelajaran');
        break;
      case 1:
        context.go('/tantangan');
        break;
      case 2:
        context.go('/pengaturan');
        break;
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedIndex = _calculateSelectedIndex(context);

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if (PopscopePopups.isPopScopeActive()) {
          PopscopePopups.exitPopup(context);
          PopscopePopups.setPopScope(false);
        } else {
          closePopupOverlay();
          PopscopePopups.setPopScope(true);
        }
      },
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: child,
        bottomNavigationBar: _buildBottomNavigationBar(
          context,
          ref,
          selectedIndex,
        ),
      ),
    );
  }

  Widget _buildBottomNavigationBar(
    BuildContext context,
    WidgetRef ref,
    int selectedIndex,
  ) {
    return Container(
      decoration: BoxDecoration(
        border: Border(top: BorderSide(color: AppColors.black1, width: 1.w)),
      ),
      child: SizedBox(
        height: 56.h,
        child: BottomNavigationBar(
          elevation: 0,
          type: BottomNavigationBarType.fixed,
          currentIndex: selectedIndex,
          onTap: (index) => _onItemTapped(index, context, ref),
          selectedLabelStyle: AppTypography.verySmallBold(
            color: AppColors.skyByte,
          ),
          unselectedLabelStyle: AppTypography.verySmall(
            color: AppColors.primaryText,
          ),
          selectedIconTheme: IconThemeData(size: 24.sp),
          unselectedIconTheme: IconThemeData(size: 24.sp),
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.school_outlined),
              activeIcon: Icon(Icons.school),
              label: 'Pembelajaran',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.emoji_events_outlined),
              activeIcon: Icon(Icons.emoji_events),
              label: 'Tantangan',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings_outlined),
              activeIcon: Icon(Icons.settings),
              label: 'Pengaturan',
            ),
          ],
        ),
      ),
    );
  }
}
