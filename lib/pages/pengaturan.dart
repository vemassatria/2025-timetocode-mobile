import 'package:flutter/material.dart';
import 'package:timetocode/main.dart';
import 'package:timetocode/pages/daftar_level_page.dart';

class PengaturanPage extends StatefulWidget {
  const PengaturanPage({super.key});

  @override
  State<PengaturanPage> createState() => _PengaturanPageState();
}

class _PengaturanPageState extends State<PengaturanPage> {
  bool _efekSuara = false;
  bool _musikLatar = true;
  int _selectedIndex = 1; // index 1 untuk halaman Pengaturan

  void _onItemTapped(int index) {
    if (index == 0) {
      // Navigasi ke halaman DaftarLevelPage
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const DaftarLevelPage()),
      );
    }
    // index 1 tetap di halaman ini
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0B0E2A),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0B0E2A),
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Pengaturan',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Pengaturan Aplikasi',
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 16),
            _buildSettingTile(
              icon: Icons.volume_up,
              label: 'Efek Suara',
              value: _efekSuara,
              onChanged: (value) {
                setState(() {
                  _efekSuara = value;
                });
              },
            ),
            const SizedBox(height: 12),
            _buildSettingTile(
              icon: Icons.music_note,
              label: 'Musik latar',
              value: _musikLatar,
              onChanged: (value) {
                setState(() {
                  _musikLatar = value;
                  playMusic(value);
                });
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedLabelStyle: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.bold,
        ),
        unselectedLabelStyle: const TextStyle(fontSize: 12),
        backgroundColor: const Color(0xFF0B0E2A),
        selectedItemColor: Colors.blueAccent,
        unselectedItemColor: Colors.white,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'Pembelajaran',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Pengaturan',
          ),
        ],
      ),
    );
  }

  Widget _buildSettingTile({
    required IconData icon,
    required String label,
    required bool value,
    required Function(bool) onChanged,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Icon(icon, color: Colors.white),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              label,
              style: const TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
          Switch(
            value: value,
            onChanged: onChanged,
            activeColor: Colors.blueAccent,
          ),
        ],
      ),
    );
  }
}
