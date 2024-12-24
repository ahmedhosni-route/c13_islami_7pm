import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_c13_7pm/core/constant/app_assets.dart';
import 'package:islami_c13_7pm/core/theme/app_colors.dart';

import 'models/sura_data.dart';

class SuraDetailsScreen extends StatefulWidget {
  static const String routeName = "suraDetails";
  const SuraDetailsScreen({super.key});

  @override
  State<SuraDetailsScreen> createState() => _SuraDetailsScreenState();
}

class _SuraDetailsScreenState extends State<SuraDetailsScreen> {
  String sura = "";
  List<String> suraList = [];
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var arg = ModalRoute.of(context)!.settings.arguments as SuraData;
    if (sura.isEmpty) {
      readFile(arg.index);
    }
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text(arg.nameEn),
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
                      child: Text(arg.nameAr,
                          style: const TextStyle(
                              color: AppColors.whiteCoffee,
                              fontSize: 35,
                              fontWeight: FontWeight.bold)),
                    ),
                  ),
                  Image.asset(AppAssets.suraDetailsRight),
                ],
              ),
              Expanded(
                child: ListView(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text.rich(
                        TextSpan(
                            children: suraList.map(
                          (e) {
                            int index = suraList.indexOf(e);
                            return TextSpan(
                              text: e.trim(),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  showModalBottomSheet(
                                    context: context,
                                    builder: (context) {
                                      return Container(
                                        width: double.infinity,
                                        height: 250,
                                        child: Center(
                                            child: Text(
                                          e,
                                          style: TextStyle(fontSize: 30),
                                        )),
                                      );
                                    },
                                  );
                                },
                              children: [
                                TextSpan(
                                    text: " [${index + 1}] ",
                                    style: const TextStyle(color: Colors.green))
                              ],
                              style: TextStyle(
                                fontSize: 24,
                                color: e.contains("اللَّهِ")
                                    ? Colors.blue
                                    : AppColors.whiteCoffee,
                              ),
                            );
                          },
                        ).toList()),
                        textAlign: TextAlign.center,
                        textDirection: TextDirection.rtl,
                      ),
                    ),
                  ],
                ),
              )

              // Text(
              //   sura,
              //   textAlign: TextAlign.center,
              //   textDirection: TextDirection.rtl,
              //   style: const TextStyle(
              //     fontSize: 24,
              //     color: AppColors.whiteCoffee,
              //   ),
              // ),
              // Expanded(
              //   child: ListView.builder(
              //     itemCount: suraList.length,
              //     itemBuilder: (context, index) {
              //       return Container(
              //         padding: const EdgeInsets.all(12),
              //         margin: const EdgeInsets.all(6),
              //         decoration: BoxDecoration(
              //             borderRadius: BorderRadius.circular(16),
              //             border: Border.all(color: AppColors.whiteCoffee)),
              //         child: Text(
              //           "${suraList[index].trim()} [${index + 1}]",
              //           textAlign: TextAlign.center,
              //           textDirection: TextDirection.rtl,
              //           style: const TextStyle(
              //             fontSize: 24,
              //             color: AppColors.whiteCoffee,
              //           ),
              //         ),
              //       );
              //     },
              //   ),
              // )
            ],
          ),
        ],
      ),
    );
  }

  void readFile(int index) async {
    sura = await rootBundle.loadString("assets/suras/${index + 1}.txt");
    suraList = sura.trim().split("\n");
    sura = "";
    for (int i = 0; i < suraList.length; i++) {
      sura += " ${suraList[i].trim()} [${i + 1}] ";
    }
    setState(() {});
  }
}
