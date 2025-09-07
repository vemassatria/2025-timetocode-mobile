import 'package:flutter/widgets.dart';
import 'package:timetocode/features/3_logic_gate_mode/data/models/line_connection.dart';

class LinePainter extends CustomPainter {
  final List<LineConnection> connections;

  LinePainter({required this.connections});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..strokeWidth =
          3.0 // ketebalan
      ..strokeCap = StrokeCap.round; //ujung garis

    for (final connection in connections) {
      paint.color = connection.color;
      canvas.drawLine(connection.start, connection.end, paint);
    }
  }

  @override
  bool shouldRepaint(covariant LinePainter oldDelegate) {
    // Gambar ulang hanya jika daftar koneksinya berubah
    return oldDelegate.connections != connections;
  }
}
