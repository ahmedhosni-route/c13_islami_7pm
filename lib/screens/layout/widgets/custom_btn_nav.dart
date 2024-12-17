import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';

class CustomBtnNav extends StatelessWidget {
  final String image;
  bool isSelected;
  CustomBtnNav({super.key, required this.image, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 16),
      decoration: BoxDecoration(
          color: isSelected
              ? AppColors.black.withOpacity(0.6)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(26)),
      child: ImageIcon(
        AssetImage(image),
      ),
    );
  }
}
