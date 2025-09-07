import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timetocode/app/data/services/sound_effect_service.dart';
import 'package:timetocode/features/0_core/widgets/code_box.dart';
import 'package:timetocode/features/0_core/widgets/question_box.dart';
import 'package:timetocode/features/1_story_mode/minigames/drag_and_drop_code/presentation/widgets/draggable_block.dart';
import 'package:timetocode/app/widgets/buttons/custom_button.dart';
import 'package:timetocode/app/widgets/popups/answer_popup.dart';
import 'package:timetocode/features/1_story_mode/minigames/drag_and_drop_code/data/controllers/dnd_gameplay_controller.dart';
import 'package:timetocode/app/config/theme/colors.dart';
import 'package:timetocode/app/config/theme/typography.dart';
import 'package:timetocode/app/utils/overlay_utils.dart';

class DragAndDropQuestionPage extends ConsumerWidget {
  const DragAndDropQuestionPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dndNotifier = ref.read(dndControllerProvider.notifier);
    final dndModel = ref.watch(
      dndControllerProvider.select((state) => state.currentDragAndDrop),
    );
    final availableOptions = ref.watch(
      dndControllerProvider.select((state) => state.availableOptions),
    );
    final dropZones = ref.watch(
      dndControllerProvider.select((state) => state.dropZones),
    );
    final allZonesFilled = dropZones!.every(
      (zone) => zone.contentDraggable != null,
    );

    return Material(
      color: Colors.transparent.withValues(alpha: 0.75),
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.fromLTRB(16.w, 100.h, 16.w, 16.h),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  QuestionBox(questionText: dndModel!.instruction),
                  SizedBox(height: 16.h),
                  Container(
                    padding: EdgeInsets.all(16.w),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (dndModel.scaffoldCode != null)
                          CodeBox(
                            code: dndModel.scaffoldCode!,
                            isDragAndDrop: true,
                          ),
                      ],
                    ),
                  ),
                  SizedBox(height: 24.h),
                  Text("Pilihan Blok:", style: AppTypography.mediumBold()),
                  SizedBox(height: 8.h),
                  DragTarget<String>(
                    builder: (context, candidateData, rejectedData) {
                      return Container(
                        width: 1.sw,
                        constraints: BoxConstraints(minHeight: 100.h),
                        padding: EdgeInsets.all(8.w),
                        decoration: BoxDecoration(
                          color: candidateData.isNotEmpty
                              ? AppColors.surfaceDark
                              : AppColors.skyByte,
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        child: Wrap(
                          spacing: 8.w,
                          runSpacing: 8.h,
                          children: availableOptions!
                              .map((opt) => DraggableBlockWidget(option: opt))
                              .toList(),
                        ),
                      );
                    },
                    onWillAcceptWithDetails: (details) {
                      return !availableOptions!.any(
                        (element) => element.id == details.data,
                      );
                    },
                    onAcceptWithDetails: (details) {
                      dndNotifier.dropItem('options_area', details.data);
                    },
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 80.h,
            width: 1.sw,
            child: Padding(
              padding: EdgeInsets.all(16.w),
              child: CustomButton(
                label: "Periksa Jawaban",
                onPressed: () {
                  final sfx = ref.read(soundEffectServiceProvider.notifier);
                  sfx.playSubmit();
                  final isCorrect = dndNotifier.validateAnswer();
                  showPopupOverlay(
                    context,
                    AnswerPopup(
                      isCorrect: isCorrect,
                      onPressed: () {
                        sfx.playPopupAnswer();
                        dndNotifier.finalizeDragAndDrop();
                        closePopupOverlay(ref);
                      },
                    ),
                    ref,
                  );
                },
                color: ButtonColor.purple,
                isDisabled: !allZonesFilled,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
