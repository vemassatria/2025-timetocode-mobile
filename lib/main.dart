import 'package:flutter/material.dart';
import 'package:timetocode/pages/daftar_level_page.dart';
import 'package:flame_audio/flame_audio.dart';

void main(){
  WidgetsFlutterBinding.ensureInitialized(); // ini wajib untuk memanggil async di main()
  FlameAudio.bgm.initialize();     
  FlameAudio.bgm.play('music/bg_music.mp3');
  runApp(const MyApp());
}

void playMusic(bool value){
    if(value){
      FlameAudio.bgm.play('music/bg_music.mp3');
    }else{
      FlameAudio.bgm.stop();
    }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TimetoCode',
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.blue,
        fontFamily: 'Roboto',
      ),
      home: const DaftarLevelPage(),
    );
  }
}
