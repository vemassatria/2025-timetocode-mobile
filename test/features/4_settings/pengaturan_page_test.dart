import 'package:mocktail/mocktail.dart';

import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:flutter_test/flutter_test.dart';

import 'package:timetocode/app/data/services/music_service.dart';

import 'package:timetocode/app/data/services/sound_effect_service.dart';

import 'package:timetocode/features/4_settings/presentation/screens/pengaturan_page.dart';

import 'package:timetocode/features/4_settings/presentation/widgets/setting_item.dart';



class MockMusicService extends Mock implements MusicService {}

class MockSoundEffectService extends Mock implements SoundEffectService {}



void main() {

  late MockMusicService mockMusicNotifier;

  late MockSoundEffectService mockSoundEffectNotifier;



  Widget createTestablePage({

    required bool initialMusicState,

    required bool initialEffectState,

  }) {

    mockMusicNotifier = MockMusicService();

    mockSoundEffectNotifier = MockSoundEffectService();



    when(() => mockMusicNotifier.build()).thenReturn(initialMusicState);

    when(() => mockSoundEffectNotifier.build()).thenReturn(initialEffectState);



    when(() => mockSoundEffectNotifier.playButtonClick2()).thenAnswer((_) {});

    

    when(() => mockMusicNotifier.updateMusicSetting(any())).thenAnswer((_) async {});

    when(() => mockSoundEffectNotifier.updateSoundEffectSetting(any())).thenAnswer((_) async {});



    return ProviderScope(

      overrides: [

        musicServiceProvider.overrideWith(() => mockMusicNotifier),

        soundEffectServiceProvider.overrideWith(() => mockSoundEffectNotifier),

      ],

      child: ScreenUtilInit(

        designSize: const Size(360, 690),

        builder: (context, child) => const MaterialApp(

          home: PengaturanPage(),

        ),

      ),

    );

  }



  setUp(() {

    registerFallbackValue(true);

    registerFallbackValue(false);

  });



  testWidgets('PengaturanPage displays initial state from providers',

      (tester) async {

    await tester.pumpWidget(createTestablePage(

      initialMusicState: true,

      initialEffectState: false,

    ));



    final musicItem = tester.widget<SettingItem>(

      find.ancestor(

        of: find.text('Musik Latar'),

        matching: find.byType(SettingItem),

      ),

    );

    

    final effectItem = tester.widget<SettingItem>(

      find.ancestor(

        of: find.text('Efek Suara'),

        matching: find.byType(SettingItem),

      ),

    );



    expect(musicItem.value, isTrue);

    expect(effectItem.value, isFalse);

  });



  testWidgets('Tapping music setting calls correct methods', (tester) async {

    await tester.pumpWidget(createTestablePage(

      initialMusicState: true,

      initialEffectState: true,

    ));



    await tester.tap(find.widgetWithText(SettingItem, 'Musik Latar'));

    await tester.pumpAndSettle();



    verify(() => mockSoundEffectNotifier.playButtonClick2()).called(1);

    verify(() => mockMusicNotifier.updateMusicSetting(false)).called(1);

  });



  testWidgets('Tapping sound effect setting calls correct methods', (tester) async {

    await tester.pumpWidget(createTestablePage(

      initialMusicState: true,

      initialEffectState: true,

    ));



    await tester.tap(find.widgetWithText(SettingItem, 'Efek Suara'));

    await tester.pumpAndSettle();



    verify(() => mockSoundEffectNotifier.playButtonClick2()).called(1);

    verify(() => mockSoundEffectNotifier.updateSoundEffectSetting(false)).called(1);

    

    verifyNever(() => mockMusicNotifier.updateMusicSetting(any()));

  });

}

