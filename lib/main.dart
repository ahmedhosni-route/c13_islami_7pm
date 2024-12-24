import 'package:flutter/material.dart';
import 'package:islami_c13_7pm/screens/layout/hadeth/hadeth_details_screen.dart';
import 'package:islami_c13_7pm/screens/layout/layout_screen.dart';
import 'package:islami_c13_7pm/screens/layout/quran/sura_details_screen.dart';
import 'package:islami_c13_7pm/screens/splash/splash_screen.dart';

import 'core/theme/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: ThemeMode.light,
      debugShowCheckedModeBanner: false,
      initialRoute: SplashScreen.routeName,
      routes: {
        SplashScreen.routeName: (context) => const SplashScreen(),
        LayoutScreen.routeName: (context) => const LayoutScreen(),
        SuraDetailsScreen.routeName: (context) => const SuraDetailsScreen(),
        HadethDetailsScreen.routeName: (context) => const HadethDetailsScreen()
      },
    );
  }
}
