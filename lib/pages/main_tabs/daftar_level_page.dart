import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:timetocode/components/card.dart';
import 'package:timetocode/games/game_engine.dart';
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

  // Keys untuk setiap card agar bisa tracking posisi viewport
  late List<GlobalKey> _cardKeys;

  @override
  void initState() {
    super.initState();
    _loadLevelData();
  }

  Future<void> _loadLevelData() async {
    _prefs = await SharedPreferences.getInstance();

    // Set default if null
    if (_prefs.getInt('completedLevel') == null) {
      await _prefs.setInt('completedLevel', 0);
    }

    completedLevel = _prefs.getInt('completedLevel')!;
    totalLevel = (widget.game as GameEngine).levels.length;
    _cardKeys = List<GlobalKey>.generate(totalLevel, (_) => GlobalKey());

    // Pastikan build ulang setelah data siap
    setState(() {});
  }

  // @override
  // void dispose() {
  //   _scrollController.removeListener(_checkVisibility);
  //   _scrollController.dispose();
  //   super.dispose();
  // }

  // void _checkVisibility() {
  //   // Pastikan widget sudah di-build sebelum mengakses RenderBox
  //   if (!mounted) return;

  //   final RenderBox? renderBox = context.findRenderObject() as RenderBox?;
  //   if (renderBox == null) return;

  //   final viewportHeight = renderBox.size.height;
  //   final scrollOffset = _scrollController.offset;

  //   // Tandai item sebagai visible berdasarkan posisi scroll
  //   for (int i = 0; i < _cardKeys.length; i++) {
  //     final BuildContext? cardContext = _cardKeys[i].currentContext;
  //     if (cardContext == null) continue;

  //     final RenderBox? cardBox = cardContext.findRenderObject() as RenderBox?;
  //     if (cardBox == null) continue;

  //     final cardPosition = cardBox.localToGlobal(
  //       Offset.zero,
  //       ancestor: renderBox,
  //     );

  //     // Posisi relatif terhadap viewport
  //     final cardTop = cardPosition.dy - scrollOffset;
  //     final cardBottom = cardTop + cardBox.size.height;

  //     // Card visible jika sebagian dalam viewport
  //     final isVisible = (cardTop < viewportHeight && cardBottom > 0);

  //     // Update state jika status visibility berubah
  //     if (isVisible != levelData[i]['visible']) {
  //       setState(() {
  //         levelData[i]['visible'] = isVisible;
  //       });
  //     }
  //   }
  // }

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
                      'assets/background/${(widget.game as GameEngine).levels[index].background}.webp',
                    ),
                    title: (widget.game as GameEngine).levels[index].title,
                    status:
                        completedLevel > index
                            ? CardStatus.completed
                            : (completedLevel == index
                                ? CardStatus.unlocked
                                : CardStatus.locked),

                    onStartPressed: () {
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
