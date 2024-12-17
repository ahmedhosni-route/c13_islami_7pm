import 'package:flutter/material.dart';
import 'package:islami_c13_7pm/core/constant/app_assets.dart';
import 'package:islami_c13_7pm/core/theme/app_colors.dart';
import 'package:islami_c13_7pm/screens/layout/quran/widgets/aya_widget.dart';
import 'package:islami_c13_7pm/screens/layout/quran/widgets/history_card_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'models/sura_data.dart';

class QuranScreen extends StatefulWidget {
  QuranScreen({super.key});

  @override
  State<QuranScreen> createState() => _QuranScreenState();
}

class _QuranScreenState extends State<QuranScreen> {
  List<String> suraNameAr = [
    "الفاتحه",
    "البقرة",
    "آل عمران",
    "النساء",
    "المائدة",
    "الأنعام",
    "الأعراف",
    "الأنفال",
    "التوبة",
    "يونس",
    "هود",
    "يوسف",
    "الرعد",
    "إبراهيم",
    "الحجر",
    "النحل",
    "الإسراء",
    "الكهف",
    "مريم",
    "طه",
    "الأنبياء",
    "الحج",
    "المؤمنون",
    "النّور",
    "الفرقان",
    "الشعراء",
    "النّمل",
    "القصص",
    "العنكبوت",
    "الرّوم",
    "لقمان",
    "السجدة",
    "الأحزاب",
    "سبأ",
    "فاطر",
    "يس",
    "الصافات",
    "ص",
    "الزمر",
    "غافر",
    "فصّلت",
    "الشورى",
    "الزخرف",
    "الدّخان",
    "الجاثية",
    "الأحقاف",
    "محمد",
    "الفتح",
    "الحجرات",
    "ق",
    "الذاريات",
    "الطور",
    "النجم",
    "القمر",
    "الرحمن",
    "الواقعة",
    "الحديد",
    "المجادلة",
    "الحشر",
    "الممتحنة",
    "الصف",
    "الجمعة",
    "المنافقون",
    "التغابن",
    "الطلاق",
    "التحريم",
    "الملك",
    "القلم",
    "الحاقة",
    "المعارج",
    "نوح",
    "الجن",
    "المزّمّل",
    "المدّثر",
    "القيامة",
    "الإنسان",
    "المرسلات",
    "النبأ",
    "النازعات",
    "عبس",
    "التكوير",
    "الإنفطار",
    "المطفّفين",
    "الإنشقاق",
    "البروج",
    "الطارق",
    "الأعلى",
    "الغاشية",
    "الفجر",
    "البلد",
    "الشمس",
    "الليل",
    "الضحى",
    "الشرح",
    "التين",
    "العلق",
    "القدر",
    "البينة",
    "الزلزلة",
    "العاديات",
    "القارعة",
    "التكاثر",
    "العصر",
    "الهمزة",
    "الفيل",
    "قريش",
    "الماعون",
    "الكوثر",
    "الكافرون",
    "النصر",
    "المسد",
    "الإخلاص",
    "الفلق",
    "الناس"
  ];

  List<String> suraNameEn = [
    "Al-Fatiha",
    "Al-Baqarah",
    "Aal-E-Imran",
    "An-Nisa'",
    "Al-Ma'idah",
    "Al-An'am",
    "Al-A'raf",
    "Al-Anfal",
    "At-Tawbah",
    "Yunus",
    "Hud",
    "Yusuf",
    "Ar-Ra'd",
    "Ibrahim",
    "Al-Hijr",
    "An-Nahl",
    "Al-Isra",
    "Al-Kahf",
    "Maryam",
    "Ta-Ha",
    "Al-Anbiya",
    "Al-Hajj",
    "Al-Mu'minun",
    "An-Nur",
    "Al-Furqan",
    "Ash-Shu'ara",
    "An-Naml",
    "Al-Qasas",
    "Al-Ankabut",
    "Ar-Rum",
    "Luqman",
    "As-Sajda",
    "Al-Ahzab",
    "Saba",
    "Fatir",
    "Ya-Sin",
    "As-Saffat",
    "Sad",
    "Az-Zumar",
    "Ghafir",
    "Fussilat",
    "Ash-Shura",
    "Az-Zukhruf",
    "Ad-Dukhan",
    "Al-Jathiya",
    "Al-Ahqaf",
    "Muhammad",
    "Al-Fath",
    "Al-Hujurat",
    "Qaf",
    "Adh-Dhariyat",
    "At-Tur",
    "An-Najm",
    "Al-Qamar",
    "Ar-Rahman",
    "Al-Waqi'a",
    "Al-Hadid",
    "Al-Mujadila",
    "Al-Hashr",
    "Al-Mumtahina",
    "As-Saff",
    "Al-Jumu'a",
    "Al-Munafiqun",
    "At-Taghabun",
    "At-Talaq",
    "At-Tahrim",
    "Al-Mulk",
    "Al-Qalam",
    "Al-Haqqah",
    "Al-Ma'arij",
    "Nuh",
    "Al-Jinn",
    "Al-Muzzammil",
    "Al-Muddathir",
    "Al-Qiyamah",
    "Al-Insan",
    "Al-Mursalat",
    "An-Naba'",
    "An-Nazi'at",
    "Abasa",
    "At-Takwir",
    "Al-Infitar",
    "Al-Mutaffifin",
    "Al-Inshiqaq",
    "Al-Buruj",
    "At-Tariq",
    "Al-A'la",
    "Al-Ghashiyah",
    "Al-Fajr",
    "Al-Balad",
    "Ash-Shams",
    "Al-Lail",
    "Ad-Duha",
    "Ash-Sharh",
    "At-Tin",
    "Al-Alaq",
    "Al-Qadr",
    "Al-Bayyina",
    "Az-Zalzalah",
    "Al-Adiyat",
    "Al-Qari'a",
    "At-Takathur",
    "Al-Asr",
    "Al-Humazah",
    "Al-Fil",
    "Quraysh",
    "Al-Ma'un",
    "Al-Kawthar",
    "Al-Kafirun",
    "An-Nasr",
    "Al-Masad",
    "Al-Ikhlas",
    "Al-Falaq",
    "An-Nas"
  ];

  List<String> ayaNumber = [
    '7',
    '286',
    '200',
    '176',
    '120',
    '165',
    '206',
    '75',
    '129',
    '109',
    '123',
    '111',
    '43',
    '52',
    '99',
    '128',
    '111',
    '110',
    '98',
    '135',
    '112',
    '78',
    '118',
    '64',
    '77',
    '227',
    '93',
    '88',
    '69',
    '60',
    '34',
    '30',
    '73',
    '54',
    '45',
    '83',
    '182',
    '88',
    '75',
    '85',
    '54',
    '53',
    '89',
    '59',
    '37',
    '35',
    '38',
    '29',
    '18',
    '45',
    '60',
    '49',
    '62',
    '55',
    '78',
    '96',
    '29',
    '22',
    '24',
    '13',
    '14',
    '11',
    '11',
    '18',
    '12',
    '12',
    '30',
    '52',
    '52',
    '44',
    '28',
    '28',
    '20',
    '56',
    '40',
    '31',
    '50',
    '40',
    '46',
    '42',
    '29',
    '19',
    '36',
    '25',
    '22',
    '17',
    '19',
    '26',
    '30',
    '20',
    '15',
    '21',
    '11',
    '8',
    '5',
    '19',
    '5',
    '8',
    '8',
    '11',
    '11',
    '8',
    '3',
    '9',
    '5',
    '4',
    '6',
    '3',
    '6',
    '3',
    '5',
    '4',
    '5',
    '6'
  ];

  List<String> suraSearchEn = [];

  List<String> suraSearchAr = [];

  List<String> ayaNumberSearch = [];

  List<int> surahSearchIds = [];

  List<int> ids = [];

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        getData();
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var size = MediaQuery.of(context).size;
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(
            AppAssets.quranBg,
          ),
        ),
      ),
      child: Container(
        padding: const EdgeInsets.all(12),
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [AppColors.black.withOpacity(0.7), AppColors.black],
                end: Alignment.bottomCenter,
                begin: Alignment.topCenter)),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(child: Image.asset(AppAssets.quranLogo)),
              TextField(
                style: theme.textTheme.bodyLarge,
                onChanged: (value) {
                  search(value);
                },
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide:
                            const BorderSide(color: AppColors.whiteCoffee)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide:
                            const BorderSide(color: AppColors.whiteCoffee)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide:
                            const BorderSide(color: AppColors.whiteCoffee)),
                    hintText: "Sura Name",
                    hintStyle: const TextStyle(
                      color: AppColors.white,
                      fontSize: 16,
                    ),
                    fillColor: AppColors.black.withOpacity(0.5),
                    filled: true,
                    prefixIcon: const ImageIcon(
                      AssetImage(AppAssets.quranIcon),
                      color: AppColors.whiteCoffee,
                    )),
              ),
              SizedBox(
                height: 2.h(context),
                width: 2.w(context),
              ),
              if (ids.isNotEmpty)
                SizedBox(
                  height: 120,
                  child: ListView.builder(
                    itemCount: ids.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return HistoryCardWidget(
                          suraData: SuraData(
                              index: ids[index],
                              nameAr: suraNameAr[ids[index]],
                              nameEn: suraNameEn[ids[index]],
                              ayaNumber: ayaNumber[ids[index]]));
                    },
                  ),
                ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Suras List",
                style: TextStyle(
                  fontSize: 20,
                  color: AppColors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Expanded(
                child: ListView.separated(
                  itemCount:
                      surahSearchIds.isEmpty ? 114 : surahSearchIds.length,
                  itemBuilder: (context, index) {
                    return surahSearchIds.isEmpty
                        ? AyaWidget(
                            onTap: saveData,
                            suraData: SuraData(
                                index: index,
                                nameAr: suraNameAr[index],
                                nameEn: suraNameEn[index],
                                ayaNumber: ayaNumber[index]),
                          )
                        : AyaWidget(
                            onTap: saveData,
                            suraData: SuraData(
                                index: surahSearchIds[index],
                                nameAr: suraSearchAr[index],
                                nameEn: suraSearchEn[index],
                                ayaNumber: ayaNumberSearch[index]));
                  },
                  separatorBuilder: (context, index) {
                    return const Divider();
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void search(String q) {
    surahSearchIds.clear();
    suraSearchEn.clear();
    ayaNumberSearch.clear();
    suraSearchAr.clear();

    suraNameEn.where(
      (element) {
        if (element.toLowerCase().contains(q.toLowerCase())) {
          int index = suraNameEn.indexOf(element);
          surahSearchIds.add(index);
          suraSearchAr.add(suraNameAr[index]);
          suraSearchEn.add(suraNameEn[index]);
          ayaNumberSearch.add(ayaNumber[index]);
          setState(() {});
        }
        return true;
      },
    ).toList();

    suraNameAr.where(
      (element) {
        if (element.toLowerCase().contains(q.toLowerCase())) {
          int index = suraNameEn.indexOf(element);
          surahSearchIds.add(index);
          suraSearchAr.add(suraNameAr[index]);
          suraSearchEn.add(suraNameEn[index]);
          ayaNumberSearch.add(ayaNumber[index]);
          setState(() {});
        }
        return false;
      },
    ).toList();

    setState(() {});
  }

  void saveData(int index) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    if (ids.contains(index)) {
      ids.remove(index);
    }
    ids.insert(0, index);
    List<String> idsString = [];
    for (int i in ids) {
      idsString.add(i.toString());
    }
    await prefs.setStringList("history", idsString);

    setState(() {});
  }

  void getData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> idsString = prefs.getStringList("history") ?? [];
    for (String i in idsString) {
      ids.add(int.parse(i));
    }
    setState(() {});
  }
}

extension Sizer on num {
  double h(BuildContext context) {
    num number = this / 100;
    return MediaQuery.of(context).size.height * number;
  }

  double w(BuildContext context) {
    num number = this / 100;
    return MediaQuery.of(context).size.width * number;
  }
}
