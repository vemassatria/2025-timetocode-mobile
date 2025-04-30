import 'package:flutter/material.dart';
import 'package:timetocode/components/box/choices_box.dart';
import 'package:timetocode/components/setting_item.dart';
import 'package:timetocode/themes/typography.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:timetocode/SFX/music_service.dart';
import 'package:timetocode/utils/overlay_utils.dart';

class PengaturanPage extends StatefulWidget {
  const PengaturanPage({super.key});

  @override
  State<PengaturanPage> createState() => _PengaturanPageState();
}

class _PengaturanPageState extends State<PengaturanPage> {
  bool _efekSuara = true;
  bool _musikLatar = true;

  @override
  void initState() {
    super.initState();
    _loadMusiklatar();
    _loadEfekSuara();
  }

  Future<void> _loadMusiklatar() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _musikLatar = prefs.getBool('musikLatar') ?? true;
    });
  }

  _updateMusikLatar(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('musikLatar', value);
    setState(() {
      _musikLatar = value;
    });
  }

  Future<void> _loadEfekSuara() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _efekSuara = prefs.getBool('efekSuara') ?? true;
    });
  }

  void _updateEfekSuara(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('efekSuara', value);
    setState(() {
      _efekSuara = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Pengaturan', style: AppTypography.heading5()),
        elevation: 15,
        shadowColor: Color(0x4D000000),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 32.0, horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ChoicesBox(
              correctAnswerIndex: 2,
              choices: ['salah', 'salah', 'benar', 'salah'],
              onCorrect: closePopupOverlay,
              onWrong: closePopupOverlay,
            ),
            const SizedBox(height: 64),
            Text('Pengaturan Aplikasi', style: AppTypography.small()),
            const SizedBox(height: 8),
            SettingItem(
              icon: Icon(Icons.volume_up),
              label: "Efek Suara",
              value: _efekSuara,
              onChanged: (value) {
                setState(() {
                  _efekSuara = value;
                  _updateEfekSuara(value);
                });
              },
            ),
            const SizedBox(height: 8),
            SettingItem(
              icon: Icon(Icons.music_note_sharp),
              label: "Musik Latar",
              value: _musikLatar,
              onChanged: (value) {
                setState(() {
                  _musikLatar = value;
                  _updateMusikLatar(value);
                });
                MusicService.updateMusikLatar(value);
              },
            ),
          ],
        ),
      ),
    );
  }
}
