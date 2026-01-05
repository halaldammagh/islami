import 'package:flutter/material.dart';
import 'package:islami/providers/most_recent_provider.dart';
import 'package:islami/tabs/quran_tab/shared_prefs_utils.dart';
import 'package:provider/provider.dart';

import '../../../model/quran_resources.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_styles.dart';

class MostRecently extends StatefulWidget {
  MostRecently({super.key});

  @override
  State<MostRecently> createState() => _MostRecentlyState();
}

class _MostRecentlyState extends State<MostRecently> {
  late MostRecentProvider mostRecentProvider;

  @override
  void initState() {
    super.initState();
    //todo: this is bloc of code can be excute ofter build
    WidgetsBinding.instance.addPostFrameCallback((_){
      mostRecentProvider.getLastSuraIndex();

    } ,);
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    mostRecentProvider = Provider.of<MostRecentProvider>(context);
    return Visibility(
      visible: mostRecentProvider.mostRecentList.isNotEmpty,
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
                                .englishQuranSurahList[mostRecentProvider
                                .mostRecentList[index]],
                            style: AppStyles.bold24Black,
                          ),
                          Text(
                            QuranResources
                                .arabicQuranSuraList[mostRecentProvider
                                .mostRecentList[index]],
                            style: AppStyles.bold24Black,
                          ),
                          Text(
                            '${QuranResources.versesNumberList[mostRecentProvider.mostRecentList[index]]} Verses',
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
              itemCount: mostRecentProvider.mostRecentList.length,
            ),
          ),
        ],
      ),
    );
  }
}
