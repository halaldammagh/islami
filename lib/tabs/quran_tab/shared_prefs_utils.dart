import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefsKey {
  static const String mostRecently = 'most_recent';
}

//todo: save last sura index => write data
void saveLastSuraIndex(int newSuraIndex) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  //todo: to get list sura index from shared preferences
  List<String> mostRecentList =
      prefs.getStringList(SharedPrefsKey.mostRecently) ?? [];
  //todo: Duplicate
  //todo: to check index => exist => remove => add
  if (mostRecentList.contains('$newSuraIndex')) {
    mostRecentList.remove('$newSuraIndex');
    mostRecentList.insert(0, '$newSuraIndex');
  } else {
    //todo: to check index => doesn't exist => add
    mostRecentList.insert(0, '$newSuraIndex');
  }
  // todo: limit
  if (mostRecentList.length > 5) {
    mostRecentList.removeLast();
  }
  await prefs.setStringList(SharedPrefsKey.mostRecently, mostRecentList);
}

