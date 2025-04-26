import 'package:flutter/material.dart';
import 'package:timetocode/components/button.dart';
import 'package:timetocode/components/popups/base_popup.dart';
import 'package:timetocode/components/setting_item.dart';
import 'package:timetocode/themes/typography.dart';

class SettingPopup extends StatefulWidget {
  final VoidCallback onPressed;

  const SettingPopup({super.key, required this.onPressed});

  @override
  State<SettingPopup> createState() => _SettingPopupState();
}

class _SettingPopupState extends State<SettingPopup> {
  bool _efekSuara = false;
  bool _musikLatar = false;

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
            });
          },
        ),
      ],
    );
  }

  Widget _buildButton() {
    return CustomButton(
      label: "Kembali",
      onPressed: widget.onPressed,
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
