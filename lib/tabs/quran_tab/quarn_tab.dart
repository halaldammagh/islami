import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:islami/model/quran_resources.dart';
import 'package:islami/tabs/quran_tab/shared_prefs_utils.dart';
import 'package:islami/tabs/quran_tab/widget/most_recently.dart';
import 'package:islami/tabs/quran_tab/widget/sura_item_widget.dart';
import 'package:islami/utils/app_assets.dart';
import 'package:islami/utils/app_colors.dart';
import 'package:islami/utils/app_routs.dart';
import 'package:islami/utils/app_styles.dart';

///width : 430  height : 932
class QuranTab extends StatefulWidget {


  QuranTab({super.key});

  @override
  State<QuranTab> createState() => _QuranTabState();
}

class _QuranTabState extends State<QuranTab> {
  List<int> filterList = List.generate(114, (index) => index);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery
        .of(context)
        .size
        .height;
    var width = MediaQuery
        .of(context)
        .size
        .width;

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: width * 0.04),

        ///20/430
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: height * 0.01,
          children: [
            TextField(
              style: TextStyle(color: AppColors.white),
              cursorColor: AppColors.primaryColor,
              onChanged: (newText) {
                searchByNewsText(newText);
                setState(() {

                });
              },

              /// لون الماوس
              decoration: InputDecoration(
                prefixIcon: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: SvgPicture.asset(
                    AppAssets.quran,
                    colorFilter: ColorFilter.mode(
                      AppColors.primaryColor,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
                enabledBorder: buildOutLineInputBorder(),
                focusedBorder: buildOutLineInputBorder(),
                hintText: 'Sura Name',
                hintStyle: AppStyles.bold16White,
              ),
            ),
            MostRecently(),
            Text('Sura List', style: AppStyles.bold16White),
            Expanded(
              child: filterList.isEmpty ?
              Center(child: Text(
                'No Sura Item Found', style: AppStyles.bold20White,))

                  : ListView.separated(
                padding: EdgeInsets.zero,

                ///لازم تلغي الـ padding الافتراضي بتاع ListView.
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      saveLastSuraIndex(filterList[index]);

                      Navigator.of(context).pushNamed(
                        AppRouts.suraDetailsScreen,
                        arguments: filterList[index],
                      );
                    },
                    child: SuraItemWidget(index: filterList[index]),
                  );
                },
                separatorBuilder: (context, index) {
                  return Divider(
                    color: AppColors.white,
                    thickness: 2,
                    indent: width * 0.06,
                    endIndent: width * 0.06,
                  );
                },
                itemCount: filterList.length,
              ),
            ),
          ],
        ),
      ),
    );
  }

  OutlineInputBorder buildOutLineInputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(color: AppColors.primaryColor, width: 2),
    );
  }

  void searchByNewsText(String newText) {
    List<int> filterSearchList = [];
    for (int i = 0; i < QuranResources.englishQuranSurahList.length; i++) {
      if (QuranResources.englishQuranSurahList[i].toLowerCase().contains(
          newText.toLowerCase())) {
        filterSearchList.add(i);
      }
    }
    for (int i = 0; i < QuranResources.arabicQuranSuraList.length; i++) {
      if (QuranResources.arabicQuranSuraList[i].toLowerCase().contains(
          newText.toLowerCase())) {
        filterSearchList.add(i);
      }
    }
    filterList = filterSearchList;
  }

}
