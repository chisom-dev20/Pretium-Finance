import 'package:flutter/material.dart';
import 'package:pretium_finance/resources/app_colors.dart';

class SlideIndicator extends StatelessWidget {
  const SlideIndicator(
      {super.key, required this.selectedIndex, required this.slideList});

  final int selectedIndex;
  final List slideList;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: slideList.asMap().entries.map((entry) {
          return Container(
            width: selectedIndex == entry.key ? 25 : 8,
            height: 8,
            decoration: BoxDecoration(
                color: selectedIndex == entry.key
                    ? AppColors.primaryColor
                    : AppColors.primary100,
                borderRadius: BorderRadius.circular(8)),
          );
        }).toList(),
      ),
    );
  }
}
