import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'package:timetocode/components/card.dart';
import 'package:timetocode/components/popups/info_popup.dart';
import 'package:timetocode/providers/game_provider.dart';
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

    _isLoaded = true;

    setState(() {});
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final game = ref.read(gameEngineProvider);
    if (!_isLoaded) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        title: Text('Konsep Pemrograman', style: AppTypography.heading5()),
        toolbarHeight: 64.h,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 16.w),
            child: CircularStepProgressIndicator(
              circularDirection: CircularDirection.counterclockwise,
              totalSteps: totalLevel,
              currentStep: completedLevel,
              stepSize: 4,
              selectedColor: AppColors.xpGreen,
              unselectedColor: AppColors.gray1,
              height: 40.h,
              width: 40.w,
              child: Center(
                child: Text(
                  '$completedLevel/$totalLevel',
                  style: AppTypography.smallBold(),
                ),
              ),
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
              // Optimalkan - hanya render level yang sudah dibuka atau berikutnya akan dibuka
              if (index > completedLevel + 1) {
                return Padding(
                  padding: EdgeInsets.only(
                    bottom: index == totalLevel - 1 ? 16.h : 8.h,
                  ),
                  child: LevelCard.locked(
                    title: game.levels[index].title,
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
              }

              return Padding(
                padding: EdgeInsets.only(
                  top: index == 0 ? 16.h : 0,
                  bottom: index == totalLevel - 1 ? 16.h : 8.h,
                ),
                child: LevelCard(
                  image: Image.asset(
                    'assets/background/${game.levels[index].background}.webp',
                    fit: BoxFit.cover,
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
