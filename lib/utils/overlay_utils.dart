import 'package:flutter/material.dart';

void showPopupOverlay(BuildContext context, Widget popupContent) {
  final overlay = Overlay.of(context);

  final overlayEntry = OverlayEntry(
    builder: (context) {
      return Positioned(top: 200, child: popupContent);
    },
  );

  overlay.insert(overlayEntry);
}
