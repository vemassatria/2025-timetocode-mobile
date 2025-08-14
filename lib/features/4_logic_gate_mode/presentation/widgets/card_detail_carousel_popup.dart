import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timetocode/app/utils/overlay_utils.dart';
import 'package:timetocode/features/4_logic_gate_mode/data/models/logic_gate_type.dart';
import 'package:timetocode/features/4_logic_gate_mode/presentation/widgets/detail_card_popup.dart';

class CardDetailCarouselPopup extends ConsumerStatefulWidget {
  final List<LogicGateType> types;
  final int initialIndex;

  const CardDetailCarouselPopup({
    super.key,
    required this.types,
    this.initialIndex = 0,
  });

  @override
  ConsumerState<CardDetailCarouselPopup> createState() =>
      _CardDetailCarouselPopupState();
}

class _CardDetailCarouselPopupState
    extends ConsumerState<CardDetailCarouselPopup> {
  late final PageController _pageController;
  late int _currentIndex;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialIndex;
    _pageController = PageController(initialPage: _currentIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 610.h,
      width: 300.w,
      child: PageView.builder(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        itemCount: widget.types.length,
        itemBuilder: (context, index) {
          return DetailCardPopup(
            type: widget.types[index],
            closePopup: () => closePopupOverlay(ref),
            pageController: _pageController,
            currentIndex: _currentIndex,
            totalCards: widget.types.length,
          );
        },
      ),
    );
  }
}
