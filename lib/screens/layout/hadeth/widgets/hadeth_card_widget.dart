import 'package:flutter/material.dart';
import 'package:islami_c13_7pm/screens/layout/hadeth/hadeth_details_screen.dart';
import 'package:islami_c13_7pm/screens/layout/hadeth/hadeth_screen.dart';

import '../../../../core/constant/app_assets.dart';
import '../../../../core/theme/app_colors.dart';

class HadethCardWidget extends StatelessWidget {
  HadethData hadethData;

  HadethCardWidget({super.key, required this.hadethData});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, HadethDetailsScreen.routeName,
            arguments: hadethData);
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
            color: AppColors.whiteCoffee,
            borderRadius: BorderRadius.circular(20)),
        child: Stack(
          children: [
            Column(
              children: [
                Expanded(child: Image.asset(AppAssets.hadethCardBg)),
                ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(AppAssets.suraDetails)),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                    textDirection: TextDirection.ltr,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(
                        AppAssets.suraDetailsLeft,
                        color: AppColors.black,
                      ),
                      Expanded(
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text(hadethData.title,
                              style: const TextStyle(
                                  color: AppColors.black,
                                  fontSize: 26,
                                  fontWeight: FontWeight.bold)),
                        ),
                      ),
                      Image.asset(
                        AppAssets.suraDetailsRight,
                        color: AppColors.black,
                      ),
                    ],
                  ),
                  Text(
                    hadethData.body,
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
