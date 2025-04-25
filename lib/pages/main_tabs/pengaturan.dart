import 'package:flutter/material.dart';
import 'package:timetocode/main.dart';

class PengaturanPage extends StatefulWidget {
  const PengaturanPage({super.key});

  @override
  State<PengaturanPage> createState() => _PengaturanPageState();
}

class _PengaturanPageState extends State<PengaturanPage> {
  bool _efekSuara = false;
  bool _musikLatar = true;

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
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Pengaturan Aplikasi',
              style: TextStyle(fontSize: 16, color: Colors.white),
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
