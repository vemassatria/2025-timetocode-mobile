import 'package:flutter/material.dart';
import 'package:timetocode/themes/colors.dart';

class DialogueBoxWidget extends StatefulWidget {
  final VoidCallback? onNext;
  final List<String> dialoguesText;
  const DialogueBoxWidget({Key? key, required this.dialoguesText, this.onNext})
    : super(key: key);

  @override
  State<DialogueBoxWidget> createState() => _DialogueBoxWidgetState();
}

class _DialogueBoxWidgetState extends State<DialogueBoxWidget> {
  int _currentIndex = 0;

  void _advance() {
    if (_currentIndex < widget.dialoguesText.length - 1) {
      setState(() => _currentIndex++);
    } else {
      // Kalau sudah habis, panggil onNext jika ada
      widget.onNext?.call();
    }
  }

  @override
  Widget build(BuildContext context) {
    // ambil teks current
    final text = widget.dialoguesText[_currentIndex];
    final maxHeight = MediaQuery.of(context).size.height * 0.3;

    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        width: double.infinity,
        constraints: BoxConstraints(maxHeight: maxHeight),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.backgroundTransparent,
          border: Border(
            top: BorderSide(color: Theme.of(context).dividerColor, width: 2),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Tampilkan satu baris dialog; wrap agar scroll kalau panjang
            Expanded(
              child: SingleChildScrollView(
                child: Text(
                  text,
                  style: Theme.of(context).textTheme.bodyMedium,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            const SizedBox(height: 8),
            Align(
              alignment: Alignment.centerRight,
              child: IconButton(
                icon: const Icon(Icons.double_arrow, color: AppColors.white),
                onPressed: _advance,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
