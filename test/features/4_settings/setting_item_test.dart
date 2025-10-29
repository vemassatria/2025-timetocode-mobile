import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:flutter_test/flutter_test.dart';

import 'package:timetocode/features/4_settings/presentation/widgets/setting_item.dart';



void main() {

  Widget createTestableWidget(Widget child) {

    return ScreenUtilInit(

      designSize: const Size(360, 690), 

      builder: (context, child) => MaterialApp(

        home: Scaffold(body: child),

      ),

    );

  }



  testWidgets('SettingItem renders label and icon correctly', (tester) async {

    const testIcon = Icon(Icons.check);

    const testLabel = 'Test Label';



    await tester.pumpWidget(createTestableWidget(

      SettingItem(

        icon: testIcon,

        label: testLabel,

        value: false,

        onChanged: (_) {},

      ),

    ));



    expect(find.text(testLabel), findsOneWidget);

    expect(find.byIcon(Icons.check), findsOneWidget);

  });



  testWidgets('SettingItem calls onChanged with correct value when tapped (from false to true)',

      (tester) async {

    bool? changedValue;



    await tester.pumpWidget(createTestableWidget(

      SettingItem(

        icon: const Icon(Icons.music_note),

        label: "Music",

        value: false, 

        onChanged: (newValue) {

          changedValue = newValue;

        },

      ),

    ));



    await tester.tap(find.byType(GestureDetector));

    await tester.pumpAndSettle(); 



    expect(changedValue, isTrue);

  });



  testWidgets('SettingItem calls onChanged with correct value when tapped (from true to false)',

      (tester) async {

    bool? changedValue;



    await tester.pumpWidget(createTestableWidget(

      SettingItem(

        icon: const Icon(Icons.music_note),

        label: "Music",

        value: true, 

        onChanged: (newValue) {

          changedValue = newValue;

        },

      ),

    ));



    await tester.tap(find.byType(GestureDetector));

    await tester.pumpAndSettle();



    expect(changedValue, isFalse);

  });

}



