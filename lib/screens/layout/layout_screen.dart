import 'package:flutter/material.dart';
import 'package:islami_c13_7pm/core/constant/app_assets.dart';
import 'package:islami_c13_7pm/core/theme/app_colors.dart';
import 'package:islami_c13_7pm/screens/layout/hadeth/hadeth_screen.dart';
import 'package:islami_c13_7pm/screens/layout/quran/quran_screen.dart';
import 'package:islami_c13_7pm/screens/layout/widgets/custom_btn_nav.dart';

class LayoutScreen extends StatefulWidget {
  static const String routeName = "layout";
  const LayoutScreen({super.key});

  @override
  State<LayoutScreen> createState() => _LayoutScreenState();
}

class _LayoutScreenState extends State<LayoutScreen> {
  int selectedIndex = 0;

  List<Widget> screens = [
    QuranScreen(),
    HadethScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: selectedIndex,
          onTap: (value) {
            selectedIndex = value;
            setState(() {});
          },
          fixedColor: AppColors.white,
          items: [
            BottomNavigationBarItem(
                icon: CustomBtnNav(
                  image: AppAssets.quranIcon,
                  isSelected: selectedIndex == 0,
                ),
                label: "Quran"),
            BottomNavigationBarItem(
                icon: CustomBtnNav(
                  image: AppAssets.hadethIcon,
                  isSelected: selectedIndex == 1,
                ),
                label: "Hadeth"),
            BottomNavigationBarItem(
                icon: CustomBtnNav(
                  image: AppAssets.sebhaIcon,
                  isSelected: selectedIndex == 2,
                ),
                label: "Sebha"),
            BottomNavigationBarItem(
                icon: CustomBtnNav(
                  image: AppAssets.radioIcon,
                  isSelected: selectedIndex == 3,
                ),
                label: "Radio"),
            BottomNavigationBarItem(
                icon: CustomBtnNav(
                  image: AppAssets.adhanIcon,
                  isSelected: selectedIndex == 4,
                ),
                label: "Adhan"),
          ]),
      body: screens[selectedIndex],
    );
  }
}
