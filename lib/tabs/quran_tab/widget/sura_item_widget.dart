import 'package:flutter/cupertino.dart';
import 'package:islami/model/quran_resources.dart';
import 'package:islami/utils/app_assets.dart';
import 'package:islami/utils/app_styles.dart';

class SuraItemWidget extends StatelessWidget {
  final int index;

  SuraItemWidget({required this.index});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Row(
      spacing: width * 0.06,
      children: [
        Stack(
          alignment: AlignmentGeometry.center,
          children: [
            Image.asset(AppAssets.vector),
            Text('${index + 1}', style: AppStyles.bold20White),
          ],
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                QuranResources.englishQuranSurahList[index],
                style: AppStyles.bold20White,
              ),
              Text(
                '${QuranResources.versesNumberList[index]} Verses ',
                style: AppStyles.bold14White,
              ),
            ],
          ),
        ),
        Text(
          QuranResources.arabicQuranSuraList[index],
          style: AppStyles.bold20White,
        ),
      ],
    );
  }
}
