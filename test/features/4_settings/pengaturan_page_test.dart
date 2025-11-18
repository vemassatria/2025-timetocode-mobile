import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:timetocode/app/data/services/hive_service.dart';
import 'package:timetocode/app/data/services/music_service.dart';
import 'package:timetocode/app/data/services/sound_effect_service.dart';
import 'package:timetocode/features/4_settings/presentation/screens/pengaturan_page.dart';
import 'package:timetocode/features/4_settings/presentation/widgets/setting_item.dart';

class MockHiveService extends Mock implements HiveService {}

class TestMusicService extends MusicService {
  @override
  Future<void> playMainMenuMusic() async {} 
  @override
  Future<void> stopMusic() async {} 
}

class TestSoundEffectService extends SoundEffectService {
  @override
  void playButtonClick2() {} 
  @override
  Future<void> disposeTypingPlayer() async {} 
}

void main() {
  late MockHiveService mockHiveService;

  setUp(() {
    mockHiveService = MockHiveService();
    when(() => mockHiveService.saveMusicSetting(any())).thenAnswer((_) async {});
    when(() => mockHiveService.saveSoundEffectSetting(any())).thenAnswer((_) async {});
  });

  Widget createTestablePage({
    required bool initialMusicState,
    required bool initialEffectState,
  }) {
    when(() => mockHiveService.getMusicSetting()).thenReturn(initialMusicState);
    when(() => mockHiveService.getSoundEffectSetting()).thenReturn(initialEffectState);

    return ProviderScope(
      overrides: [
        hiveProvider.overrideWithValue(mockHiveService),
        musicServiceProvider.overrideWith(TestMusicService.new),
        soundEffectServiceProvider.overrideWith(TestSoundEffectService.new),
      ],
      child: ScreenUtilInit(
        designSize: const Size(360, 690),
        builder: (context, child) => const MaterialApp(
          home: PengaturanPage(),
        ),
      ),
    );
  }

  testWidgets('PengaturanPage renders switches with correct initial state', (tester) async {
    await tester.pumpWidget(createTestablePage(
      initialMusicState: true,
      initialEffectState: false,
    ));

    final musicSwitch = find.descendant(
      of: find.widgetWithText(SettingItem, 'Musik Latar'),
      matching: find.byType(AnimatedAlign),
    );
    expect(tester.widget<AnimatedAlign>(musicSwitch).alignment, Alignment.centerRight);

    final soundSwitch = find.descendant(
      of: find.widgetWithText(SettingItem, 'Efek Suara'),
      matching: find.byType(AnimatedAlign),
    );
    expect(tester.widget<AnimatedAlign>(soundSwitch).alignment, Alignment.centerLeft);
  });

  testWidgets('Tapping music setting updates state and calls storage', (tester) async {
    await tester.pumpWidget(createTestablePage(
      initialMusicState: true,
      initialEffectState: true,
    ));

    await tester.tap(find.widgetWithText(SettingItem, 'Musik Latar'));
    await tester.pumpAndSettle();

    verify(() => mockHiveService.saveMusicSetting(false)).called(1);
    
    final musicSwitch = find.descendant(
      of: find.widgetWithText(SettingItem, 'Musik Latar'),
      matching: find.byType(AnimatedAlign),
    );
    expect(tester.widget<AnimatedAlign>(musicSwitch).alignment, Alignment.centerLeft);
  });
}