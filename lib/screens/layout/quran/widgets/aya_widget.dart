import 'package:flutter/material.dart';
import 'package:islami_c13_7pm/screens/layout/quran/sura_details_screen.dart';

import '../../../../core/constant/app_assets.dart';
import '../../../../core/theme/app_colors.dart';
import '../models/sura_data.dart';
import '../quran_screen.dart';

class AyaWidget extends StatelessWidget {
  SuraData suraData;
  void Function(int index) onTap;
  AyaWidget({
    super.key,
    required this.onTap,
    required this.suraData,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap(suraData.index);
        Navigator.pushNamed(context, SuraDetailsScreen.routeName,
            arguments: suraData);
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Image.asset(AppAssets.suraNumberIcon),
                Text(
                  "${suraData.index + 1}",
                  style: const TextStyle(
                      fontSize: 18,
                      color: AppColors.white,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  suraData.nameEn,
                  style: const TextStyle(
                    fontSize: 20,
                    color: AppColors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "${suraData.ayaNumber} Verses",
                  style: const TextStyle(
                    fontSize: 16,
                    color: AppColors.white,
                  ),
                ),
              ],
            ),
            const Spacer(),
            Text(
              suraData.nameAr,
              style: const TextStyle(
                fontSize: 20,
                color: AppColors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
