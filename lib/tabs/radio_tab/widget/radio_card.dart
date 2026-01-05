import 'package:flutter/material.dart';

import '../../../utils/app_colors.dart';
import '../../../utils/app_styles.dart';

class RadioCard extends StatelessWidget {
  String title;
  String icon1;
  String icon2;
  String backGroundImage;

  RadioCard({
    required this.title,
    required this.icon1,
    required this.icon2,
    required this.backGroundImage,
  });

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    // TODO: implement buildr
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: width * 0.046,
        vertical: height * 0.010,
      ),
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Stack(
        children: [
          Image.asset(backGroundImage, fit: BoxFit.contain),
          Center(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: height * 0.02),
                  child: Text(title, style: AppStyles.bold20BlackText),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: width * 0.09,
                    top: height * 0.016,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    spacing: width * 0.046,
                    children: [
                      InkWell(child: Image.asset(icon1)),
                      InkWell(child: Image.asset(icon2)),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
