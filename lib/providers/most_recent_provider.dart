import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../tabs/quran_tab/shared_prefs_utils.dart';

class MostRecentProvider extends ChangeNotifier {
  //todo: data
  List<int> mostRecentList = [];

  //todo: get last sura index => read data
  void getLastSuraIndex() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> mostRecentIndicesAsString =
        prefs.getStringList(SharedPrefsKey.mostRecently) ?? [];
    mostRecentList = mostRecentIndicesAsString
        .map((newSuraIndex) => int.parse(newSuraIndex))
        .toList();

    notifyListeners();//هتبعت نوت لكل خد انو الداتا الي عندو تغيرت ف اعمل بيلد من جديد
    //return mostRecentIndicesAsInt.reversed.toList(); بدل ما نعمل هيك بنستخدم insert بدل ال add
  }
}
