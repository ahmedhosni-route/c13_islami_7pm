class SuraData {
  String nameAr;
  String nameEn;
  String ayaNumber;
  int index;
  bool isFav;

  SuraData({
    required this.index,
    required this.nameAr,
    required this.nameEn,
    required this.ayaNumber,
    this.isFav = false,
  });
}
