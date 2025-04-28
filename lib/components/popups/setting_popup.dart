import 'package:flutter/material.dart';
import 'package:timetocode/components/button.dart';
import 'package:timetocode/components/popups/base_popup.dart';
import 'package:timetocode/components/setting_item.dart';
import 'package:timetocode/themes/typography.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:timetocode/SFX/music_service.dart';

class SettingPopup extends StatefulWidget {
  final VoidCallback onGoBack;

  const SettingPopup({super.key, required this.onGoBack});

  @override
  State<SettingPopup> createState() => _SettingPopupState();
}

class _SettingPopupState extends State<SettingPopup> {
  bool _efekSuara = true;
  bool _musikLatar = true;

  @override
  void initState(){
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

  _updateMusikLatar(bool value) async{
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

  void _updateEfekSuara(bool value) async{
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('efekSuara', value);
    setState(() {
      _efekSuara = value;
    });
  }

  Widget _buildTitle() {
    return Text(
      "Pengaturan",
      style: AppTypography.heading4(),
      textAlign: TextAlign.center,
    );
  }

  Widget _buildSettingsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Pengaturan Aplikasi', style: AppTypography.small()),
        const SizedBox(height: 8),
        SettingItem(
          icon: const Icon(Icons.volume_up),
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
          icon: const Icon(Icons.music_note_sharp),
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
    );
  }

  Widget _buildButton() {
    return CustomButton(
      label: "Kembali",
      onPressed: widget.onGoBack,
      widthMode: ButtonWidthMode.fill,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BasePopup(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _buildTitle(),
          const SizedBox(height: 8),
          const Divider(thickness: 3),
          const SizedBox(height: 32),
          _buildSettingsSection(),
          const SizedBox(height: 32),
          _buildButton(),
        ],
      ),
    );
  }
}
