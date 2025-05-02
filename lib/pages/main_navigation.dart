import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timetocode/pages/main_tabs/daftar_level_page.dart';
import 'package:timetocode/pages/main_tabs/pengaturan.dart';
import 'package:timetocode/themes/colors.dart';
import 'package:timetocode/themes/typography.dart';
import 'package:timetocode/utils/screen_utils.dart';

class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() => _selectedIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    initScreenUtil(context);

    final pages = <Widget>[DaftarLevelPage(), PengaturanPage()];

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: pages[_selectedIndex],
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget _buildBottomNavigationBar() {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Color(0x4D000000),
            offset: Offset(0, -4),
            blurRadius: 8,
            spreadRadius: 2,
          ),
        ],
      ),
      child: BottomNavigationBar(
        elevation: 0,
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedLabelStyle: AppTypography.smallBold(color: AppColors.skyByte),
        unselectedLabelStyle: AppTypography.small(color: AppColors.primaryText),
        selectedIconTheme: IconThemeData(size: 32.sp),
        unselectedIconTheme: IconThemeData(size: 32.sp),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.school_outlined),
            activeIcon: Icon(Icons.school),
            label: 'Pembelajaran',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings_outlined),
            activeIcon: Icon(Icons.settings),
            label: 'Pengaturan',
          ),
        ],
      ),
    );
  }
}
