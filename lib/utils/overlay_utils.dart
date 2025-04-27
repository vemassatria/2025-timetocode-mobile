import 'package:flutter/material.dart';

OverlayEntry? _currentOverlay;
Widget? _previousContent;

void showPopupOverlay(BuildContext context, Widget popupContent) {
  final overlay = Overlay.of(context);

  if (_currentOverlay != null) {
    _previousContent = _currentOverlay!.builder(context);
    _currentOverlay!.remove();
  }

  _currentOverlay = OverlayEntry(
    builder:
        (context) => Material(
          color: Color(0x80000000),
          child: Center(child: popupContent),
        ),
  );

  overlay.insert(_currentOverlay!);
}

void closePopupOverlay() {
  _currentOverlay?.remove();
  _currentOverlay = null;
  _previousContent = null;
}

void goBackToPreviousOverlay(BuildContext context) {
  if (_previousContent != null) {
    final previousWidget = _previousContent;
    _currentOverlay?.remove();
    _currentOverlay = OverlayEntry(builder: (context) => previousWidget!);
    Overlay.of(context).insert(_currentOverlay!);
    _previousContent = null;
  } else {
    closePopupOverlay();
  }
}
