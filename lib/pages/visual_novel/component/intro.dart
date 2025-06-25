import 'package:flutter/material.dart';
import 'package:timetocode/components/box/narration_box.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:timetocode/games/backend/models/visual_novel/predialog_model.dart';
import 'package:timetocode/games/backend/providers/visual_novel/story_provider.dart';

class IntroBoxWidget extends ConsumerWidget {
  final PreDialogModel preDialog;
  const IntroBoxWidget({super.key, required this.preDialog});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(storyControllerProvider.notifier);

    return Center(
      child: NarrationBox(
        key: ValueKey(preDialog.id),
        narrationText: preDialog.text,
        onTap: () {
          notifier.nextPreDialog();
        },
      ),
    );
  }
}
