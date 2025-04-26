import 'package:flutter/material.dart';
import 'package:timetocode/components/button.dart';
import 'package:timetocode/themes/colors.dart';
import 'package:timetocode/themes/typography.dart';

enum CardStatus { unlocked, locked, completed }

class LevelCard extends StatelessWidget {
  final Image image;
  final String title;
  final CardStatus status;
  final VoidCallback onStartPressed;
  final VoidCallback onInfoPressed;

  const LevelCard({
    super.key,
    required this.image,
    required this.title,
    required this.status,
    required this.onStartPressed,
    required this.onInfoPressed,
  });

  bool get isLocked => status == CardStatus.locked;
  bool get isCompleted => status == CardStatus.completed;

  Widget _buildImage() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: ColorFiltered(
        colorFilter:
            isLocked
                ? const ColorFilter.matrix([
                  0.2126,
                  0.7152,
                  0.0722,
                  0,
                  0,
                  0.2126,
                  0.7152,
                  0.0722,
                  0,
                  0,
                  0.2126,
                  0.7152,
                  0.0722,
                  0,
                  0,
                  0,
                  0,
                  0,
                  1,
                  0,
                ])
                : const ColorFilter.mode(
                  Colors.transparent,
                  BlendMode.multiply,
                ),
        child: SizedBox(
          height: 170,
          width: double.infinity,
          child: FittedBox(
            fit: BoxFit.cover,
            clipBehavior: Clip.hardEdge,
            child: image,
          ),
        ),
      ),
    );
  }

  Widget _buildTitle() {
    return Text(
      title,
      textAlign: TextAlign.center,
      style:
          isLocked
              ? AppTypography.heading5(color: AppColors.secondaryText)
              : AppTypography.heading5(),
    );
  }

  Widget _buildActionButtons() {
    final label =
        isLocked
            ? "Terkunci"
            : isCompleted
            ? "Mulai Lagi"
            : "Mulai";

    return Row(
      children: [
        Expanded(
          child: Button(
            label: label,
            onPressed: onStartPressed,
            type: ButtonType.filled,
            color: ButtonColor.blue,
            isDisabled: isLocked,
          ),
        ),
        const SizedBox(width: 8),
        Button(
          icon: const Icon(Icons.info_outline),
          onPressed: onInfoPressed,
          type: ButtonType.icon,
          color: ButtonColor.purple,
          label: '',
          isDisabled: isLocked,
        ),
      ],
    );
  }

  Widget _buildCompletedBadge() {
    return Positioned(
      top: 28,
      right: 24,
      child: Chip(
        label: Text(
          "Selesai",
          style: AppTypography.normalBold(color: AppColors.black1),
        ),
        avatar: Icon(Icons.check_box_rounded, color: AppColors.black1),
        backgroundColor: AppColors.lightGreen,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: BorderSide(color: AppColors.greenStats, width: 2),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      ),
    );
  }

  Widget _buildLockedOverlay() {
    return Positioned.fill(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Icon(Icons.lock_outline_rounded, size: 130, color: Colors.white),
          Icon(Icons.lock_rounded, size: 120, color: AppColors.black1),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 8),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: isLocked ? AppColors.black3 : AppColors.surfaceDark,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: AppColors.white, width: 2),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _buildImage(),
              const SizedBox(height: 16),
              _buildTitle(),
              const SizedBox(height: 16),
              _buildActionButtons(),
            ],
          ),
        ),
        if (isCompleted) _buildCompletedBadge(),
        if (isLocked) _buildLockedOverlay(),
      ],
    );
  }
}
