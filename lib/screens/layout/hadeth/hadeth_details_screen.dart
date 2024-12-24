import 'package:flutter/material.dart';
import 'package:islami_c13_7pm/core/constant/app_assets.dart';
import 'package:islami_c13_7pm/core/theme/app_colors.dart';

import 'hadeth_screen.dart';

class HadethDetailsScreen extends StatefulWidget {
  static const String routeName = "hadethDetails";

  const HadethDetailsScreen({super.key});

  @override
  State<HadethDetailsScreen> createState() => _HadethDetailsScreenState();
}

class _HadethDetailsScreenState extends State<HadethDetailsScreen> {
  String sura = "";
  List<String> suraList = [];

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var arg = ModalRoute.of(context)!.settings.arguments as HadethData;
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text(arg.title),
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Image.asset(AppAssets.suraDetails),
          Column(
            children: [
              Row(
                textDirection: TextDirection.ltr,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(AppAssets.suraDetailsLeft),
                  Expanded(
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(arg.title,
                          style: const TextStyle(
                              color: AppColors.whiteCoffee,
                              fontSize: 35,
                              fontWeight: FontWeight.bold)),
                    ),
                  ),
                  Image.asset(AppAssets.suraDetailsRight),
                ],
              ),
              Text(
                arg.body,
                textAlign: TextAlign.center,
                style: const TextStyle(color: AppColors.whiteCoffee),
              )
            ],
          ),
        ],
      ),
    );
  }
}
