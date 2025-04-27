import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:timetocode/components/card.dart';
import 'package:timetocode/games/game_engine.dart';
import 'package:timetocode/themes/colors.dart';

class DaftarLevelPage extends StatefulWidget {
  final FlameGame game;
  const DaftarLevelPage({Key? key, required this.game}) : super(key: key);

  @override
  State<DaftarLevelPage> createState() => _DaftarLevelPageState();
}

class _DaftarLevelPageState extends State<DaftarLevelPage> {
  int totalLevel = 6;
  int completedLevel = 1;
  final ScrollController _scrollController = ScrollController();

  // Data level
  final List<Map<String, dynamic>> levelData = [
    {
      'title': 'Level 1 - Pengenalan Pemrograman',
      'status': CardStatus.completed,
      'visible': true, // Default visible untuk item pertama
    },
    {
      'title': 'Level 2 - Variabel dan Tipe Data',
      'status': CardStatus.unlocked,
      'visible': false,
    },
    {
      'title': 'Level 3 - Percabangan',
      'status': CardStatus.locked,
      'visible': false,
    },
  ];

  // Keys untuk setiap card agar bisa tracking posisi viewport
  late List<GlobalKey> _cardKeys;

  @override
  void initState() {
    super.initState();
    _cardKeys = List<GlobalKey>.generate(levelData.length, (_) => GlobalKey());

    // Setup listener untuk scroll events
    _scrollController.addListener(_checkVisibility);

    // Jalankan sekali di awal untuk memastikan item awal terlihat
    WidgetsBinding.instance.addPostFrameCallback((_) => _checkVisibility());
  }

  @override
  void dispose() {
    _scrollController.removeListener(_checkVisibility);
    _scrollController.dispose();
    super.dispose();
  }

  void _checkVisibility() {
    // Pastikan widget sudah di-build sebelum mengakses RenderBox
    if (!mounted) return;

    final RenderBox? renderBox = context.findRenderObject() as RenderBox?;
    if (renderBox == null) return;

    final viewportHeight = renderBox.size.height;
    final scrollOffset = _scrollController.offset;

    // Tandai item sebagai visible berdasarkan posisi scroll
    for (int i = 0; i < _cardKeys.length; i++) {
      final BuildContext? cardContext = _cardKeys[i].currentContext;
      if (cardContext == null) continue;

      final RenderBox? cardBox = cardContext.findRenderObject() as RenderBox?;
      if (cardBox == null) continue;

      final cardPosition = cardBox.localToGlobal(
        Offset.zero,
        ancestor: renderBox,
      );

      // Posisi relatif terhadap viewport
      final cardTop = cardPosition.dy - scrollOffset;
      final cardBottom = cardTop + cardBox.size.height;

      // Card visible jika sebagian dalam viewport
      final isVisible = (cardTop < viewportHeight && cardBottom > 0);

      // Update state jika status visibility berubah
      if (isVisible != levelData[i]['visible']) {
        setState(() {
          levelData[i]['visible'] = isVisible;
        });
      }
    }
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
          child: NotificationListener<ScrollNotification>(
            onNotification: (notification) {
              // Trigger visibility check saat scroll
              if (notification is ScrollUpdateNotification) {
                _checkVisibility();
              }
              return true;
            },
            child: ListView.builder(
              controller: _scrollController,
              itemCount: levelData.length,
              itemBuilder: (context, index) {
                // Import matrix4_transform paket untuk menghindari konflik dengan Matrix4
                return AnimatedContainer(
                  key: _cardKeys[index],
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeOutCubic,
                  // Menggunakan offset langsung pada margin untuk menghindari conflict Matrix4
                  margin: EdgeInsets.only(
                    bottom: 16,
                    left: levelData[index]['visible'] ? 0 : 100, // Slide effect
                  ),
                  child: AnimatedOpacity(
                    opacity: levelData[index]['visible'] ? 1.0 : 0.0,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeInOut,
                    child: LevelCard(
                      image: Image.asset('assets/images/TEMP.jpg'),
                      title: levelData[index]['title'],
                      status: levelData[index]['status'],
                      onStartPressed: () {
                        if (index == 0) {
                          (widget.game as GameEngine).changeScene('lab');
                          (widget.game as GameEngine).loadCharacter(
                            'kating',
                            'kakak',
                          );
                          widget.game.overlays.remove('GameUI');
                          widget.game.overlays.add('Story');
                        } else {
                          debugPrint(
                            "Start button pressed for level ${index + 1}",
                          );
                        }
                      },
                      onInfoPressed: () {
                        debugPrint(
                          "Info button pressed for level ${index + 1}",
                        );
                      },
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
