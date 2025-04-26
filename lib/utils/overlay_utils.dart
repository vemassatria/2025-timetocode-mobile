import 'package:flutter/material.dart';

void showPopupOverlay(BuildContext context, Widget popupContent) {
  final overlay = Overlay.of(context);

  final overlayEntry = OverlayEntry(
    builder: (context) {
      return Material(
        color: Color(0x80000000),
        child: Center(child: popupContent),
      );
    },
  );

  overlay.insert(overlayEntry);
}
