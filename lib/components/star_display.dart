import 'package:flutter/material.dart';
import '../themes/colors.dart';

class StarDisplay extends StatelessWidget {
  final int starCount; // Jumlah bintang yang sudah diperoleh (0-3)
  final double size; // Ukuran bintang (default: 24)
  final bool isCentered; // Apakah bintang ditampilkan di tengah

  const StarDisplay({
    Key? key,
    required this.starCount,
    this.size = 24.0,
    this.isCentered = false,
  }) : assert(starCount >= 0 && starCount <= 3), super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: isCentered ? MainAxisAlignment.center : MainAxisAlignment.start,
      children: [
        _buildStar(0, size * 0.8), // Kiri (kecil)
        SizedBox(width: size * 0.2),
        _buildStar(1, size * 2), // Tengah (besar)
        SizedBox(width: size * 0.2),
        _buildStar(2, size * 0.8), // Kanan (kecil)
      ],
    );
  }

  Widget _buildStar(int index, double starSize) {
    final bool isActive = index < starCount;
    return Icon(
      Icons.star,
      size: starSize,
      color: isActive ? AppColors.rewardYellow : Colors.grey.withOpacity(0.3),
    );
  }
}