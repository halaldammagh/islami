import 'package:flutter/material.dart';
import 'package:islami/tabs/quran_tab/shared_prefs_utils.dart';

import '../../../model/quran_resources.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_styles.dart';

class MostRecently extends StatefulWidget {
  MostRecently({super.key});

  @override
  State<MostRecently> createState() => _MostRecentlyState();
}

class _MostRecentlyState extends State<MostRecently> {
  List<int> mostRecentList = [];

  @override
  void initState() {
    super.initState();
    getMostRecentList();
  }

  void getMostRecentList() async {
    mostRecentList = await getLastSuraIndex();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Visibility(
      visible: mostRecentList.isNotEmpty,
      child: Column(
        spacing: height * 0.01,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Most Recently', style: AppStyles.bold16White),
          SizedBox(
            height: height * 0.18,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Container(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.02),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: AppColors.primaryColor,
                  ),

                  child: Row(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            QuranResources
                                .englishQuranSurahList[mostRecentList[index]],
                            style: AppStyles.bold24Black,
                          ),
                          Text(
                            QuranResources
                                .arabicQuranSuraList[mostRecentList[index]],
                            style: AppStyles.bold24Black,
                          ),
                          Text(
                            '${QuranResources.versesNumberList[mostRecentList[index]]} Verses',
                            style: AppStyles.bold14Black,
                          ),
                        ],
                      ),
                      Image.asset(
                        'assets/images/minimage/reading.png',
                        color: Colors.black,
                      ),
                    ],
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return SizedBox(width: width * 0.04);
              },
              itemCount: mostRecentList.length,
            ),
          ),
        ],
      ),
    );
  }
}
