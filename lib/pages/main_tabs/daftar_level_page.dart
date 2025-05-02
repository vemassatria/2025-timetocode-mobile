import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:timetocode/components/card.dart';
import 'package:timetocode/components/popups/info_popup.dart';
import 'package:timetocode/games/game_engine.dart';
import 'package:timetocode/SFX/music_service.dart';
import 'package:timetocode/themes/colors.dart';
import 'package:timetocode/themes/typography.dart';
import 'package:timetocode/utils/overlay_utils.dart';

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
  bool _isLoaded = false;

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

    _isLoaded = true;
    await MusicService.playMainMenuMusic(); // Memutar musik halaman menu level

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    if (!_isLoaded) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    final double progress = completedLevel / totalLevel;

    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        title: Text('Konsep Pemrograman', style: AppTypography.heading5()),
        toolbarHeight: 64.h,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 16.w),
            child: Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  width: 40.w,
                  height: 40.h,
                  child: CircularProgressIndicator(
                    value: progress,
                    color: AppColors.deepAzure,
                    backgroundColor: AppColors.gray1,
                    strokeWidth: 4,
                  ),
                ),
                Text(
                  '$completedLevel/$totalLevel',
                  style: AppTypography.smallBold(),
                ),
              ],
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 0),
          child: ListView.builder(
            controller: _scrollController,
            itemCount: totalLevel,
            itemBuilder: (context, index) {
              return Padding(
                key: _cardKeys[index],
                padding: EdgeInsets.only(
                  top: index == 0 ? 16.h : 0,
                  bottom: index == totalLevel - 1 ? 16.h : 8.h,
                ),
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
                    await MusicService.playLevelMusic(index);
                    (widget.game as GameEngine).startLevel(index);
                  },
                  onInfoPressed: () {
                    showPopupOverlay(
                      context,
                      InfoPopup(
                        title: (widget.game as GameEngine).levels[index].title,
                        description:
                            (widget.game as GameEngine)
                                .levels[index]
                                .description,
                        onClose: closePopupOverlay,
                      ),
                    );
                  },
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
