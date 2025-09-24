import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:timetocode/app/data/providers/popup_visibility_provider.dart';

OverlayEntry? _currentOverlay;
Widget? _previousContent;

void showPopupOverlay(
  BuildContext context,
  Widget popupContent,
  WidgetRef ref,
) {
  final overlay = Overlay.of(context);

  if (_currentOverlay != null) {
    _previousContent = _currentOverlay!.builder(context);
    _currentOverlay!.remove();
  }

  _currentOverlay = OverlayEntry(
    builder: (context) => Material(
      color: const Color(0x80000000),
      child: Center(child: popupContent),
    ),
  );

  overlay.insert(_currentOverlay!);
  ref.read(popupVisibilityProvider.notifier).state = true;
}

void closePopupOverlay(WidgetRef ref) {
  _currentOverlay?.remove();
  _currentOverlay = null;
  _previousContent = null;
  ref.read(popupVisibilityProvider.notifier).state = false;
}

void goBackToPreviousOverlay(BuildContext context, WidgetRef ref) {
  if (_previousContent != null) {
    final previousWidget = _previousContent;
    _currentOverlay?.remove();
    _currentOverlay = OverlayEntry(builder: (context) => previousWidget!);
    Overlay.of(context).insert(_currentOverlay!);
    _previousContent = null;
  } else {
    closePopupOverlay(ref);
  }
}
