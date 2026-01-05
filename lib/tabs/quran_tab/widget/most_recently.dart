import 'package:flutter/material.dart';

import '../../../model/quran_resources.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_styles.dart';

class MostRecently extends StatelessWidget {
  const MostRecently({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Column(
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
                          QuranResources.englishQuranSurahList[index],
                          style: AppStyles.bold24Black,
                        ),
                        Text(
                          QuranResources.arabicQuranSuraList[index],
                          style: AppStyles.bold24Black,
                        ),
                        Text(
                          '${QuranResources.versesNumberList[index]} Verses',
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
            itemCount: QuranResources.versesNumberList.length,
          ),
        ),
      ],
    );
  }
}
