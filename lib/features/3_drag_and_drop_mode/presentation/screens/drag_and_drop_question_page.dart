import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timetocode/app/data/services/sound_effect_service.dart';
import 'package:timetocode/features/0_core/widgets/code_box.dart';
import 'package:timetocode/features/3_drag_and_drop_mode/presentation/widgets/draggable_block.dart';
import 'package:timetocode/app/widgets/buttons/custom_button.dart';
import 'package:timetocode/app/widgets/popups/answer_popup.dart';
import 'package:timetocode/app/widgets/popups/menu_popup.dart';
import 'package:timetocode/features/3_drag_and_drop_mode/data/controllers/dnd_gameplay_controller.dart';
import 'package:timetocode/app/data/providers/popup_visibility_provider.dart';
import 'package:timetocode/app/config/theme/colors.dart';
import 'package:timetocode/app/config/theme/typography.dart';
import 'package:timetocode/app/utils/overlay_utils.dart';

class DragAndDropQuestionPage extends ConsumerWidget {
  const DragAndDropQuestionPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLoading = ref.watch(
      dndControllerProvider.select((state) => state.isLoading),
    );
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
    final correctAnswers = ref.watch(
      dndControllerProvider.select((state) => state.correctAnswer),
    );
    final wrongAnswers = ref.watch(
      dndControllerProvider.select((state) => state.wrongAnswer),
    );

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) return;
        final isPopupVisible = ref.read(popupVisibilityProvider);
        if (isPopupVisible) {
          closePopupOverlay(ref);
        } else {
          showPopupOverlay(
            context,
            MenuPopup(
              onRestart: () {
                dndNotifier.resetDnD();
                closePopupOverlay(ref);
              },
              onExit: () {
                dndNotifier.exitDnD();
                closePopupOverlay(ref);
              },
              onClose: () {
                closePopupOverlay(ref);
              },
              onGoBack: () {
                closePopupOverlay(ref);
              },
            ),
            ref,
          );
        }
      },
      child: isLoading == true
          ? const Center(child: CircularProgressIndicator())
          : Scaffold(
              appBar: AppBar(
                backgroundColor: AppColors.surfaceDark,
                elevation: 0,
                leading: IconButton(
                  icon: const Icon(Icons.menu, color: AppColors.primaryText),
                  onPressed: () {
                    showPopupOverlay(
                      context,
                      MenuPopup(
                        onRestart: () {
                          dndNotifier.resetDnD();
                          closePopupOverlay(ref);
                        },
                        onExit: () {
                          dndNotifier.exitDnD();
                          closePopupOverlay(ref);
                        },
                        onClose: () {
                          closePopupOverlay(ref);
                        },
                        onGoBack: () {
                          closePopupOverlay(ref);
                        },
                      ),
                      ref,
                    );
                  },
                ),
                actions: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Icon(Icons.check_circle, color: AppColors.xpGreen),
                      SizedBox(
                        width: 35.w,
                        child: Text(
                          "${correctAnswers ?? 0}/3",
                          style: AppTypography.mediumBold(),
                          textAlign: TextAlign.end,
                        ),
                      ),
                      SizedBox(width: 16.w),
                      const Icon(Icons.cancel, color: AppColors.dangerRed),
                      SizedBox(
                        width: 35.w,
                        child: Text(
                          "${wrongAnswers ?? 0}/3",
                          style: AppTypography.mediumBold(),
                          textAlign: TextAlign.end,
                        ),
                      ),
                      SizedBox(width: 16.w),
                    ],
                  ),
                ],
              ),
              body: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.all(16.w),
                  child: Column(
                    children: [
                      Text(
                        dndModel!.instruction,
                        style: AppTypography.medium(),
                        textAlign: TextAlign.center,
                      ),
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
                            width: double.infinity,
                            constraints: BoxConstraints(minHeight: 100.h),
                            padding: EdgeInsets.all(8.w),
                            decoration: BoxDecoration(
                              color: candidateData.isNotEmpty
                                  ? AppColors.surfaceDark
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                            child: Wrap(
                              spacing: 8.w,
                              runSpacing: 8.h,
                              children: availableOptions!
                                  .map(
                                    (opt) => DraggableBlockWidget(option: opt),
                                  )
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
              bottomNavigationBar: Container(
                height: 80.h,
                decoration: BoxDecoration(
                  color: AppColors.surfaceDark,
                  border: Border(
                    top: BorderSide(color: AppColors.black1, width: 1.w),
                  ),
                ),
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
            ),
    );
  }
}
