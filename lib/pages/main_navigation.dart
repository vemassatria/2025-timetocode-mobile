import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:timetocode/pages/main_tabs/daftar_level_page.dart';
import 'package:timetocode/pages/main_tabs/pengaturan.dart';
import 'package:timetocode/SFX/music_service.dart';

class MainNavigation extends StatefulWidget {
  final FlameGame game;
  const MainNavigation({Key? key, required this.game}) : super(key: key);

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    MusicService.sfxButtonClick();
    setState(() => _selectedIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    final pages = <Widget>[
      DaftarLevelPage(game: widget.game),
      PengaturanPage(),
    ];

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: pages[_selectedIndex],
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget _buildBottomNavigationBar() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: _selectedIndex,
      onTap: _onItemTapped,
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
    );
  }
}
