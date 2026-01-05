import 'package:flutter/material.dart';
import 'package:islami/utils/app_assets.dart';
import 'package:islami/utils/app_colors.dart';
import 'package:islami/utils/app_styles.dart';

class SebhaTab extends StatefulWidget {
  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: Column(
          children: [
            SizedBox(height: height * 0.042),

            Text('سَبِّحِ اسْمَ رَبِّكَ الأعلى ', style: AppStyles.bold36White),
            SizedBox(height: height * 0.032),
            Stack(
              children: [
                Image.asset(AppAssets.sebhaCap),
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: height * 0.215,
                    horizontal: width * 0.23,
                  ),
                  child: InkWell(
                    splashColor: AppColors.transParentColor,
                    highlightColor: AppColors.transParentColor,
                    onTap: () {
                      counter++;
                      setState(() {});
                    },
                    child: Column(
                      children: [
                        Text('سبحان الله', style: AppStyles.bold36White),
                        SizedBox(height: height * 0.021),

                        Text('$counter', style: AppStyles.bold36White),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
