import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/model/quran_resources.dart';
import 'package:islami/tabs/quran_tab/details/widget/sura_content2.dart';
import 'package:islami/utils/app_colors.dart';
import 'package:islami/utils/app_styles.dart';

class SuraDetails2 extends StatefulWidget {
  final int index;

  const SuraDetails2({required this.index});

  @override
  State<SuraDetails2> createState() => _SuraDetails2State();
}

class _SuraDetails2State extends State<SuraDetails2> {
  String suraContent = '';

  void initState() {
    super.initState();
    loadSuraFile(widget.index);
  }

  @override
  Widget build(BuildContext context) {
    int index = widget.index;
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    // int indexx = ModalRoute.of(context)?.settings.arguments as int;
    if (suraContent.isEmpty) {
      loadSuraFile(index);
    }

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
                  child: suraContent.isEmpty
                      ? Center(
                          child: CircularProgressIndicator(
                            color: AppColors.primaryColor,
                          ),
                        )
                      : SingleChildScrollView(
                          child: SuraContent2(content: suraContent),
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
      Lines[i] += '[${i + 1}] ';
    }
    suraContent = Lines.join();
    await Future.delayed(Duration(seconds: 0));
    setState(() {});
  }
}
