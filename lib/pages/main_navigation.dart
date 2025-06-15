import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timetocode/pages/main_tabs/challenge_page.dart';
import 'package:timetocode/pages/main_tabs/daftar_level_page.dart';
import 'package:timetocode/pages/main_tabs/pengaturan.dart';
import 'package:timetocode/themes/colors.dart';
import 'package:timetocode/themes/typography.dart';
import 'package:timetocode/utils/screen_utils.dart';
import 'package:timetocode/utils/overlay_utils.dart';
import 'package:timetocode/components/popups/popscope_popups.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:timetocode/games/backend/providers/main_navigation_provider.dart';

class MainNavigation extends ConsumerStatefulWidget {
  const MainNavigation({super.key});

  @override
  ConsumerState<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends ConsumerState<MainNavigation> {
  int _selectedIndex = 0;

  @override
  void initState() {
    _selectedIndex = ref.read(mainTabIndexProvider);
    super.initState();
  }

  void _onItemTapped(int index) {
    // MusicService.sfxButtonClick();
    ref.read(mainTabIndexProvider.notifier).state = index;
    setState(() => _selectedIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    initScreenUtil(context);

    final pages = <Widget>[
      DaftarLevelPage(),
      ChallengePage(),
      PengaturanPage(),
    ];

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if (PopscopePopups.isPopScopeActive()) {
          exitPopup(context);
          PopscopePopups.setPopScope(false);
        } else {
          closePopupOverlay();
          PopscopePopups.setPopScope(true);
        }
      },
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: pages[_selectedIndex],
        bottomNavigationBar: _buildBottomNavigationBar(),
      ),
    );
  }

  Widget _buildBottomNavigationBar() {
    return Container(
      decoration: BoxDecoration(
        border: Border(top: BorderSide(color: AppColors.black1, width: 1.w)),
      ),
      child: SizedBox(
        height: 56.h, // ini tinggi yang kamu mau
        child: BottomNavigationBar(
          elevation: 0,
          type: BottomNavigationBarType.fixed,
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
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
