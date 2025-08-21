import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timetocode/app/config/theme/colors.dart';
import 'package:timetocode/features/2_challenge_mode/presentation/widgets/score_board.dart';

class ChallengeAppBar extends ConsumerWidget implements PreferredSizeWidget {
  final VoidCallback onMenuPressed;

  const ChallengeAppBar({super.key, required this.onMenuPressed});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppBar(
      backgroundColor: AppColors.surfaceDark,
      leading: IconButton(
        icon: const Icon(Icons.menu, color: AppColors.primaryText),
        onPressed: onMenuPressed,
      ),
      actions: const [ScoreBoard()],
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(1.w),
        child: Container(color: AppColors.black1, height: 1.w),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
