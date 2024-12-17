import 'package:flutter/material.dart';
import 'package:islami_c13_7pm/core/theme/app_colors.dart';
import 'package:islami_c13_7pm/screens/layout/layout_screen.dart';

import '../../core/constant/app_assets.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName = "splash";
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(
      Duration(seconds: 3),
      () {
        Navigator.pushReplacementNamed(context, LayoutScreen.routeName);
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Column(
        children: [
          const Spacer(),
          Center(
            child: Image.asset(AppAssets.logo),
          ),
          const Spacer(),
          Center(
            child: Image.asset(AppAssets.routeLogo),
          ),
        ],
      ),
    );
  }
}
