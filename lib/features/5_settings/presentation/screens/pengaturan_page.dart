import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timetocode/app/data/services/music_service.dart';
import 'package:timetocode/app/data/services/sound_effect_service.dart';
import 'package:timetocode/features/5_settings/presentation/widgets/setting_item.dart';
import 'package:timetocode/app/config/theme/colors.dart';
import 'package:timetocode/app/config/theme/typography.dart';

class PengaturanPage extends ConsumerWidget {
  const PengaturanPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool isMusicEnabled = ref.watch(musicServiceProvider);
    final bool isEffectEnabled = ref.watch(soundEffectServiceProvider);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Pengaturan', style: AppTypography.heading6()),
        toolbarHeight: 56.h,
        backgroundColor: AppColors.surfaceDark,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1),
          child: Container(height: 1, color: AppColors.black1),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Pengaturan Aplikasi', style: AppTypography.small()),
            SizedBox(height: 8.h),
            SettingItem(
              icon: const Icon(Icons.music_note_sharp),
              label: "Musik Latar",
              value: isMusicEnabled,
              onChanged: (value) {
                ref
                    .read(soundEffectServiceProvider.notifier)
                    .playButtonClick2();
                ref
                    .read(musicServiceProvider.notifier)
                    .updateMusicSetting(value);
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
                    .playButtonClick2();
                ref
                    .read(soundEffectServiceProvider.notifier)
                    .updateSoundEffectSetting(value);
              },
            ),
          ],
        ),
      ),
    );
  }
}
