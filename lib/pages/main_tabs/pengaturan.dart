import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timetocode/components/setting_item.dart';
import 'package:timetocode/themes/colors.dart';
import 'package:timetocode/themes/typography.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:timetocode/games/backend/services/music_service.dart';

class PengaturanPage extends StatefulWidget {
  const PengaturanPage({super.key});

  @override
  State<PengaturanPage> createState() => _PengaturanPageState();
}

class _PengaturanPageState extends State<PengaturanPage> {
  // bool _efekSuara = true;
  bool _musikLatar = true;

  @override
  void initState() {
    super.initState();
    _loadMusiklatar();
    // _loadEfekSuara();
  }

  Future<void> _loadMusiklatar() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _musikLatar = prefs.getBool('musikLatar') ?? true;
    });
  }

  _updateMusikLatar(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('musikLatar', value);
    setState(() {
      _musikLatar = value;
    });
  }

  // Future<void> _loadEfekSuara() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   setState(() {
  //     _efekSuara = prefs.getBool('efekSuara') ?? true;
  //   });
  // }

  // void _updateEfekSuara(bool value) async {
  //   final prefs = await SharedPreferences.getInstance();
  //   prefs.setBool('efekSuara', value);
  //   setState(() {
  //     _efekSuara = value;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      //untuk popup tombol back
      canPop: false,
      onPopInvokedWithResult: (didPop, result) => {exitPopup(context)},
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Pengaturan', style: AppTypography.heading6()),
          toolbarHeight: 56.h,
          backgroundColor: AppColors.surfaceDark,
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(1),
            child: Container(height: 1, color: AppColors.black1),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Pengaturan Aplikasi', style: AppTypography.small()),
              // SizedBox(height: 8.h),
              // SettingItem(
              //   icon: Icon(Icons.volume_up),
              //   label: "Efek Suara",
              //   value: _efekSuara,
              //   onChanged: (value) {
              //     setState(() {
              //       _efekSuara = value;
              //       _updateEfekSuara(value);
              //     });
              //     //  MusicService.updateEfekSuara(value);
              //   },
              // ),
              SizedBox(height: 8.h),
              SettingItem(
                icon: Icon(Icons.music_note_sharp),
                label: "Musik Latar",
                value: _musikLatar,
                onChanged: (value) {
                  setState(() {
                    _musikLatar = value;
                    _updateMusikLatar(value);
                  });
                  MusicService.updateMusikLatar(value);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
