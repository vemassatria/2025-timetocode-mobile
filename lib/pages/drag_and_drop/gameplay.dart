import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timetocode/components/box/drag_and_drop/block.dart';
import 'package:timetocode/components/box/drag_and_drop/drop_zone_target.dart';
import 'package:timetocode/games/backend/models/drag%20_and_drop/drop_zone_model.dart';
import 'package:timetocode/games/backend/providers/challenge/challenge_provider.dart';
import 'package:timetocode/themes/typography.dart';
import 'package:timetocode/widgets/code_text.dart';

class DragAndDropQuestionWidget extends ConsumerWidget {
  const DragAndDropQuestionWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dndState = ref.watch(challengeControllerProvider).value!;
    final dndNotifier = ref.read(challengeControllerProvider.notifier);

    final dndModel = dndState.currentDragAndDrop!;
    final availableOptions = dndModel.draggableOptions;

    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          children: [
            // 1. Instruksi Soal
            Text(
              dndModel.instruction,
              style: AppTypography.normal(),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 16.h),

            // 2. Kode Kerangka & Drop Zones
            Container(
              padding: EdgeInsets.all(16.w),
              decoration: BoxDecoration(
                color: const Color(0xFF1E1E1E),
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (dndModel.scaffoldCode != null)
                    CodeText(dndModel.scaffoldCode!),
                  ...dndState.dropZones!.entries.map((entry) {
                    String zoneId = entry.key;
                    DropZoneModel zone = entry.value;
                    Widget? droppedItem;

                    if (zone.contentId != null) {
                      // Ambil data item dari controller
                      final option = dndNotifier.getOptionById(zone.contentId!);
                      droppedItem = DraggableBlockWidget(option: option);
                    }

                    return Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 4.h,
                        horizontal: 16.w,
                      ),
                      child: DropZoneTargetWidget(
                        zoneId: zoneId,
                        onAccept:
                            dndNotifier
                                .dropItem, // Panggil method dari controller
                        child: droppedItem,
                      ),
                    );
                  }).toList(),
                ],
              ),
            ),
            SizedBox(height: 24.h),

            // 3. Opsi/Blok yang Tersedia
            Text("Pilihan Blok:", style: AppTypography.mediumBold()),
            SizedBox(height: 8.h),
            Wrap(
              spacing: 8.w,
              runSpacing: 8.h,
              children:
                  availableOptions
                      .map((opt) => DraggableBlockWidget(option: opt))
                      .toList(),
            ),
            SizedBox(height: 24.h),
            _buildOutputConsole(dndState.dropZones!),
          ],
        ),
      ),
    );
  }

  Widget _buildOutputConsole(Map<String, DropZoneModel> dropZones) {
    final sequence =
        dropZones.values.map((e) => e.contentId).whereType<String>().toList();
    String output = "Output akan muncul di sini...";

    // Logika ini bisa dibuat lebih dinamis jika perlu
    if (sequence.length == 2) {
      if (sequence.first == "dnd-002" && sequence.last == "dnd-001") {
        output = "> Adrian";
      } else {
        output = "> ReferenceError: nama is not defined";
      }
    }

    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(4.r),
      ),
      child: Text(
        output,
        style: TextStyle(color: Colors.white, fontFamily: 'monospace'),
      ),
    );
  }
}
