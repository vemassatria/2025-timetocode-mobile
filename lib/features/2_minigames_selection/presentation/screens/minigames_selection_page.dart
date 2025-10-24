import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timetocode/app/config/theme/colors.dart';
import 'package:timetocode/app/config/theme/typography.dart';
import 'package:timetocode/features/2_minigames_selection/data/providers/minigames_provider.dart';
import '../widgets/minigames_selection_card.dart';

class MinigamesSelectionPage extends ConsumerWidget {
  const MinigamesSelectionPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.read(minigamesProvider);
    final minigames = controller.minigames;

    final width = (MediaQuery.of(context).size.width - 16.w * 2 - 16.w) / 2;
    final height = 228.h;
    final childAspectRatio = width / height;

    return Scaffold(
      backgroundColor: AppColors.darkBackground,
      appBar: AppBar(
        centerTitle: true,
        title: Text('Pilihan Permainan', style: AppTypography.heading6()),
        toolbarHeight: 56.h,
        backgroundColor: AppColors.surfaceDark,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1),
          child: Container(height: 1, color: AppColors.black1),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 0),
        child: Column(
          children: [
            SizedBox(height: 24.h),
            Expanded(
              child: GridView.builder(
                itemCount: minigames.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16.w,
                  mainAxisSpacing: 24.h,
                  childAspectRatio: childAspectRatio,
                ),
                itemBuilder: (context, index) {
                  final item = minigames[index];
                  return MinigamesSelectionCard(
                    title: item.title,
                    image: item.image,
                    onTap: () => controller.onSelect(context, item.route),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
