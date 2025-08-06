import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timetocode/app/data/services/music_service.dart';
import 'package:timetocode/app/data/services/sound_effect_service.dart';
import 'package:timetocode/app/widgets/buttons/custom_button.dart';
import 'package:timetocode/app/widgets/popups/base_popup.dart';
import 'package:timetocode/features/5_settings/presentation/widgets/setting_item.dart';
import 'package:timetocode/app/config/theme/typography.dart';

class SettingPopup extends ConsumerWidget {
  final VoidCallback onGoBack;

  const SettingPopup({super.key, required this.onGoBack});

  Widget _buildTitle() {
    return Text(
      "Pengaturan",
      style: AppTypography.heading4(),
      textAlign: TextAlign.center,
    );
  }

  Widget _buildSettingsSection(WidgetRef ref) {
    final bool isMusicEnabled = ref.watch(musicServiceProvider);
    final bool isEffectEnabled = ref.watch(soundEffectServiceProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Pengaturan Aplikasi', style: AppTypography.small()),
        SizedBox(height: 16.h),
        SettingItem(
          icon: const Icon(Icons.music_note_sharp),
          label: "Musik Latar",
          value: isMusicEnabled,
          onChanged: (value) {
            ref.read(musicServiceProvider.notifier).updateMusicSetting(value);
          },
        ),
        SizedBox(height: 8.h),
        SettingItem(
          icon: const Icon(Icons.volume_up),
          label: "Efek Suara",
          value: isEffectEnabled,
          onChanged: (value) {
            ref
                .read(soundEffectServiceProvider.notifier)
                .updateSoundEffectSetting(value);
          },
        ),
      ],
    );
  }

  Widget _buildButton() {
    return CustomButton(
      label: "Kembali",
      onPressed: onGoBack,
      widthMode: ButtonWidthMode.fill,
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return BasePopup(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _buildTitle(),
          SizedBox(height: 8.h),
          Divider(thickness: 3.w),
          SizedBox(height: 32.h),
          _buildSettingsSection(ref),
          SizedBox(height: 32.h),
          _buildButton(),
        ],
      ),
    );
  }
}
