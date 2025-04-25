import 'package:flutter/material.dart';
import 'package:timetocode/pages/end_game_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Time to Code',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.black, // Sesuaikan background
      ),
      home: const EndGameScreen(),
    );
  }
}
