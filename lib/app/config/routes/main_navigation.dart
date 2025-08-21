import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:timetocode/app/data/services/sound_effect_service.dart';
import 'package:timetocode/app/widgets/popups/confirm_popup.dart';
import 'package:timetocode/app/data/providers/popup_visibility_provider.dart';
import 'package:timetocode/app/config/theme/colors.dart';
import 'package:timetocode/app/config/theme/typography.dart';
import 'package:timetocode/app/utils/overlay_utils.dart';

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
    if (location.startsWith('/logic-gate')) {
      return 2;
    }
    if (location.startsWith('/pengaturan')) {
      return 3;
    }
    return 0;
  }

  void _onItemTapped(int index, BuildContext context) {
    switch (index) {
      case 0:
        context.go('/pembelajaran');
        break;
      case 1:
        context.go('/tantangan');
        break;
      case 2:
        context.go('/logic-gate');
        break;
      case 3:
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
        if (didPop) return;
        final isPopupVisible = ref.read(popupVisibilityProvider);
        if (isPopupVisible) {
          closePopupOverlay(ref);
        } else {
          showPopupOverlay(
            context,
            ConfirmPopup(
              title: 'Keluar Aplikasi?',
              description: 'Apakah kamu yakin ingin keluar dari aplikasi?',
              confirmLabel: 'Keluar',
              onPrimaryButtonPressed: () {
                closePopupOverlay(ref);
                SystemNavigator.pop();
              },
              onGoBack: () {
                closePopupOverlay(ref);
              },
            ),
            ref,
          );
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
        border: Border(
          top: BorderSide(color: AppColors.black1, width: 1.w),
        ),
      ),
      child: SizedBox(
        height: 56.h,
        child: BottomNavigationBar(
          elevation: 0,
          type: BottomNavigationBarType.fixed,
          currentIndex: selectedIndex,
          onTap: (index) {
            ref.read(soundEffectServiceProvider.notifier).playButtonClick2();
            _onItemTapped(index, context);
          },
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
              icon: Icon(Icons.casino_outlined),
              activeIcon: Icon(Icons.casino),
              label: 'Gerbang Logika',
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
