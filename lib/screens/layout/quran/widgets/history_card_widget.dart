import 'package:flutter/material.dart';
import 'package:islami_c13_7pm/screens/layout/quran/quran_screen.dart';

import '../../../../core/constant/app_assets.dart';
import '../../../../core/theme/app_colors.dart';
import '../models/sura_data.dart';
import '../sura_details_screen.dart';

class HistoryCardWidget extends StatelessWidget {
  SuraData suraData;
  HistoryCardWidget({super.key, required this.suraData});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, SuraDetailsScreen.routeName,
            arguments: suraData);
      },
      child: Container(
        margin: const EdgeInsets.all(4),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
            color: theme.bottomNavigationBarTheme.backgroundColor,
            borderRadius: BorderRadius.circular(20)),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  suraData.nameEn,
                  style: const TextStyle(fontSize: 20),
                ),
                Text(
                  suraData.nameAr,
                  style: const TextStyle(fontSize: 20),
                ),
                Text("${suraData.ayaNumber} Verses"),
              ],
            ),
            const SizedBox(
              width: 16,
            ),
            Image.asset(
              AppAssets.historyImage,
              width: 120,
            )
          ],
        ),
      ),
    );
  }
}
