import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/model/quran_resources.dart';
import 'package:islami/tabs/quran_tab/details/widget/sura_content1.dart';
import 'package:islami/utils/app_colors.dart';
import 'package:islami/utils/app_styles.dart';

class SuraDetails1 extends StatefulWidget {
  final int index;

  const SuraDetails1({Key? key, required this.index}) : super(key: key);

  @override
  State<SuraDetails1> createState() => _SuraDetails1State();
}

class _SuraDetails1State extends State<SuraDetails1> {
  List<String> verses = [];
  int selectedVerses = -1;

  void initState() {
    super.initState();
    loadSuraFile(widget.index);
  }

  @override
  Widget build(BuildContext context) {
    int index = widget.index;
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    // int index = ModalRoute.of(context)?.settings.arguments as int;
    if (verses.isEmpty) {
      loadSuraFile(index);
    }
    ;
    // TODO: implement build
    return Stack(
      children: [
        Image.asset(
          'assets/images/sura_background.png',
          height: double.infinity,
          fit: BoxFit.cover,
        ),
        Center(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: height * 0.03),
            child: Column(
              children: [
                Text(
                  QuranResources.arabicQuranSuraList[index],
                  style: AppStyles.bold24Primary,
                ),
                SizedBox(height: height * 0.04),
                Expanded(
                  child: verses.isEmpty
                      ? Center(
                          child: CircularProgressIndicator(
                            color: AppColors.primaryColor,
                          ),
                        )
                      : ListView.separated(
                          padding: EdgeInsets.only(top: height * 0.02),
                          itemBuilder: (context, index) {
                            return SuraContent(
                              content: verses[index],
                              index: index,
                              selected: selectedVerses,
                              onTap: () {
                                setState(() {
                                  selectedVerses = index;
                                });
                              },
                            );
                          },
                          separatorBuilder: (context, index) {
                            return SizedBox(height: height * 0.02);
                          },
                          itemCount: verses.length,
                        ),
                ),
                SizedBox(height: height * 0.1),
              ],
            ),
          ),
        ),
      ],
    );
  }

  /// هي الفكنكشن عشان يقرأ السور من فايل
  void loadSuraFile(int index) async {
    ///synchronization   متزامن في كود برالير بينفذ الكود بنفس اللحظة
    String fileContent = await rootBundle.loadString(
      'assets/files/quran/${index + 1}.txt',
    );

    /// ال  await عشان يجبرو انو يستنى لحتى تحمل الداتا
    List<String> Lines = fileContent.split('\n');
    for (int i = 0; i < Lines.length; i++) {
      print(Lines[i]);
    }
    verses = Lines;
    await Future.delayed(Duration(seconds: 1));
    setState(() {});
  }
}
