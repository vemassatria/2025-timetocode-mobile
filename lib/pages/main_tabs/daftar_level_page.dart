import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:timetocode/components/card.dart';
import 'package:timetocode/providers/game_provider.dart';
import 'package:timetocode/themes/colors.dart';

class DaftarLevelPage extends ConsumerStatefulWidget {
  const DaftarLevelPage({super.key});

  @override
  ConsumerState<DaftarLevelPage> createState() => _DaftarLevelPageState();
}

class _DaftarLevelPageState extends ConsumerState<DaftarLevelPage> {
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
    final game = ref.read(gameEngineProvider);

    if (_prefs.getInt('completedLevel') == null) {
      await _prefs.setInt('completedLevel', 0);
    }

    completedLevel = _prefs.getInt('completedLevel')!;
    totalLevel = game.levels.length;
    _cardKeys = List<GlobalKey>.generate(totalLevel, (_) => GlobalKey());

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final game = ref.read(gameEngineProvider);
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
                    padding: const EdgeInsets.all(4),
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
              // Import matrix4_transform paket untuk menghindari konflik dengan Matrix4
              return AnimatedContainer(
                key: _cardKeys[index],
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeOutCubic,
                // Menggunakan offset langsung pada margin untuk menghindari conflict Matrix4
                margin: EdgeInsets.only(
                  bottom: 16,
                  // left: completedLevel >= index ? 0 : 100, // Slide effect
                ),
                child: AnimatedOpacity(
                  opacity: completedLevel >= index ? 1.0 : 1.0,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeInOut,
                  child: LevelCard(
                    image: Image.asset(
                      'assets/background/${game.levels[index].background}.webp',
                    ),
                    title: game.levels[index].title,
                    status:
                        completedLevel > index
                            ? CardStatus.completed
                            : (completedLevel == index
                                ? CardStatus.unlocked
                                : CardStatus.locked),

                    onStartPressed: () {
                      game.startLevel(index);
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
