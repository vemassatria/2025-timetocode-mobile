import 'package:flutter/material.dart';
import 'package:timetocode/components/box/narration_box.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:timetocode/games/backend/providers/story_provider.dart';

class IntroBoxWidget extends ConsumerWidget {
  const IntroBoxWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final async = ref.watch(storyControllerProvider);
    if (async.isLoading) return const SizedBox();
    final state = async.value!;
    final notifier = ref.read(storyControllerProvider.notifier);

    return Center(
      child: NarrationBox(
        key: ValueKey(state.preDialog!.id),
        narrationText: state.preDialog!.text,
        onTap: () {
          notifier.nextPreDialog();
        },
      ),
    );
  }
}
