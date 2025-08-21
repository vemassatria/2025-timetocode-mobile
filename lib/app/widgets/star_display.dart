import 'package:flutter/material.dart';
import '../config/theme/colors.dart';

class StarDisplay extends StatelessWidget {
  final int starCount; // Jumlah bintang yang sudah diperoleh
  final double size; // Ukuran bintang
  final bool isCentered;

  const StarDisplay({
    super.key,
    required this.starCount,
    this.size = 24.0,
    this.isCentered = false,
  }) : assert(starCount >= 0 && starCount <= 3);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment:
          isCentered ? MainAxisAlignment.center : MainAxisAlignment.start,
      children: [
        _buildStar(0, size), // Kiri
        SizedBox(width: size * 0.2),
        _buildStar(1, size * 2), // Tengah
        SizedBox(width: size * 0.2),
        _buildStar(2, size), // Kanan
      ],
    );
  }

  Widget _buildStar(int index, double starSize) {
    final bool isActive = index < starCount;

    return Stack(
      children: [
        // Border putih
        Icon(Icons.star, size: starSize + 4, color: AppColors.primaryText),
        Positioned(
          left: 2, // Offset untuk centering
          top: 2,
          child: Icon(
            Icons.star,
            size: starSize,
            color: isActive ? AppColors.rewardYellow : AppColors.black1,
          ),
        ),
      ],
    );
  }
}
