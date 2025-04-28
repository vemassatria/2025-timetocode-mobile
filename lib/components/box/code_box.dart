import 'package:flutter/material.dart';
import 'package:timetocode/widgets/code_text.dart';
import 'package:timetocode/themes/colors.dart';
import 'package:timetocode/utils/screen_utils.dart';

class CodeBox extends StatelessWidget {
  final String code;

  const CodeBox({super.key, required this.code});

  @override
  Widget build(BuildContext context) {
    final ScrollController scrollController = ScrollController();

    return Container(
      width: 328 / 360 * ScreenUtils.screenWidth(context),
      padding: const EdgeInsets.fromLTRB(32, 32, 32, 16),
      decoration: BoxDecoration(
        color: AppColors.surfaceDark,
        border: Border.all(color: AppColors.white, width: 2),
        borderRadius: BorderRadius.circular(8),
      ),
      child: NotificationListener<ScrollNotification>(
        onNotification: (scrollNotification) => true,
        child: Scrollbar(
          controller: scrollController,
          thumbVisibility: true,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: SingleChildScrollView(
              controller: scrollController,
              scrollDirection: Axis.horizontal,
              physics: const ClampingScrollPhysics(),
              child: CodeText(code),
            ),
          ),
        ),
      ),
    );
  }
}
