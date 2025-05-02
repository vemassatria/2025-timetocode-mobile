import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:timetocode/components/card.dart';
import 'package:timetocode/games/game_engine.dart';
import 'package:timetocode/SFX/music_service.dart';
import 'package:timetocode/themes/colors.dart';

class DaftarLevelPage extends StatefulWidget {
  final FlameGame game;
  const DaftarLevelPage({super.key, required this.game});

  @override
  State<DaftarLevelPage> createState() => _DaftarLevelPageState();
}

class _DaftarLevelPageState extends State<DaftarLevelPage> {
  late SharedPreferences _prefs;
  final ScrollController _scrollController = ScrollController();
  late int completedLevel;
  late int totalLevel;
  late List<GlobalKey> _cardKeys;

  @override
  void initState() {
    super.initState();
    _loadLevelData();
  }

  Future<void> _loadLevelData() async {
    _prefs = await SharedPreferences.getInstance();

    if (_prefs.getInt('completedLevel') == null) {
      await _prefs.setInt('completedLevel', 0);
    }

    completedLevel = _prefs.getInt('completedLevel')!;
    totalLevel = (widget.game as GameEngine).levels.length;
    _cardKeys = List<GlobalKey>.generate(totalLevel, (_) => GlobalKey());

    await MusicService.playMainMenuMusic(); // Memutar musik halaman menu level

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final double progress = completedLevel / totalLevel;

    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        title: const Text(
          'Konsep Pemrograman',
          style: TextStyle(
            color: AppColors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  width: 50,
                  height: 50,
                  child: CircularProgressIndicator(
                    value: progress,
                    color: AppColors.deepAzure,
                    backgroundColor: AppColors.gray1,
                    strokeWidth: 5,
                  ),
                ),
                Text(
                  '$completedLevel/$totalLevel',
                  style: const TextStyle(color: AppColors.white),
                ),
              ],
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: ListView.builder(
            controller: _scrollController,
            itemCount: totalLevel,
            itemBuilder: (context, index) {
              return AnimatedContainer(
                key: _cardKeys[index],
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeOutCubic,
                margin: const EdgeInsets.only(bottom: 16),
                child: AnimatedOpacity(
                  opacity: completedLevel >= index ? 1.0 : 1.0,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeInOut,
                  child: LevelCard(
                    image: Image.asset(
                      'assets/background/${(widget.game as GameEngine).levels[index].background}.webp',
                    ),
                    title: (widget.game as GameEngine).levels[index].title,
                    status: completedLevel > index
                        ? CardStatus.completed
                        : (completedLevel == index
                            ? CardStatus.unlocked
                            : CardStatus.locked),
                    onStartPressed: () async {
                      await MusicService.playLevelMusic(index);
                      (widget.game as GameEngine).startLevel(index);
                    },
                    onInfoPressed: () {
                      debugPrint("Info button pressed for level ${index + 1}");
                    },
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
