import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:timetocode/components/card.dart';
import 'package:timetocode/components/popups/info_popup.dart';
import 'package:timetocode/providers/game_provider.dart';
import 'package:timetocode/SFX/music_service.dart';
import 'package:timetocode/themes/colors.dart';
import 'package:timetocode/themes/typography.dart';
import 'package:timetocode/utils/overlay_utils.dart';

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
  bool _isLoaded = false;

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

    _isLoaded = true;

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final game = ref.read(gameEngineProvider);
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
                    'assets/background/${game.levels[index].background}.webp',
                  ),
                  title: game.levels[index].title,
                  status:
                      completedLevel > index
                          ? CardStatus.completed
                          : (completedLevel == index
                              ? CardStatus.unlocked
                              : CardStatus.locked),
                  onStartPressed: () async {
                    await MusicService.playLevelMusic(index);
                    game.startLevel(index);
                  },
                  onInfoPressed: () {
                    showPopupOverlay(
                      context,
                      InfoPopup(
                        title: game.levels[index].title,
                        description: game.levels[index].description,
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
