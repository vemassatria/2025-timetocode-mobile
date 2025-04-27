import 'package:flutter/material.dart';
import 'package:timetocode/themes/colors.dart';

class IntroBoxWidget extends StatelessWidget {
  final VoidCallback? onNext;
  final String introText;
  const IntroBoxWidget({Key? key, required this.introText, this.onNext})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Maksimal tinggi box = 60% tinggi layar
    final maxHeight = MediaQuery.of(context).size.height * 0.35;

    return Center(
      child: Container(
        width: 380,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: AppColors.backgroundTransparent,
          border: Border.all(color: Theme.of(context).dividerColor, width: 2),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ConstrainedBox(
              constraints: BoxConstraints(maxHeight: maxHeight),
              child: SingleChildScrollView(
                child: Text(
                  introText,
                  style: Theme.of(context).textTheme.labelSmall,
                  textAlign: TextAlign.center,
                ),
              ),
            ),

            const SizedBox(height: 12),

            // Tombol di kanan bawah
            Align(
              alignment: Alignment.centerRight,
              child: IconButton(
                onPressed: onNext,
                icon: const Icon(
                  Icons.double_arrow,
                  color: AppColors.white,
                  size: 24,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
