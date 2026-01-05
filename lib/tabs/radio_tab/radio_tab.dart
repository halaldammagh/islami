import 'package:flutter/material.dart';
import 'package:islami/tabs/radio_tab/details/radio_details.dart';
import 'package:islami/tabs/radio_tab/details/reciters_radio.dart';
import 'package:islami/utils/app_colors.dart';
import 'package:islami/utils/app_styles.dart';

class RadioTab extends StatefulWidget {
  @override
  State<RadioTab> createState() => _RadioTabState();
}

class _RadioTabState extends State<RadioTab> {
  bool isSelected = true;

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
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            height: height * 0.0429,
            margin: EdgeInsets.symmetric(horizontal: width * 0.04),
            decoration: BoxDecoration(
              color: Color(0xFF202020).withOpacity(0.5),
              borderRadius: BorderRadiusGeometry.circular(12),
            ),
            child: Row(
              children: [
                Expanded(
                  child: isSelected == true
                      ? Container(
                    height: double.infinity,
                    decoration: BoxDecoration(
                      color: AppColors.primaryColor,
                      borderRadius: BorderRadiusGeometry.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Text(
                        'Radio',
                        style: AppStyles.balood16Black,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  )
                      : InkWell(
                    onTap: () {
                      setState(() {
                        isSelected = true;
                      });
                    },
                    child: Text(
                      'Radio',
                      style: AppStyles.balood16White,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Expanded(
                  child: isSelected == true
                      ? InkWell(
                    onTap: () {
                      setState(() {
                        isSelected = false;
                      });
                    },
                    child: Text(
                      'Reciters',
                      style: AppStyles.balood16White,
                      textAlign: TextAlign.center,
                    ),
                  )
                      : Container(
                    height: double.infinity,
                    decoration: BoxDecoration(
                      color: AppColors.primaryColor,
                      borderRadius: BorderRadiusGeometry.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Text(
                        'Reciters',
                        style: AppStyles.balood16Black,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          isSelected == true ? RadioDetails() : RecitersRadio()
        ],
      ),
    );
  }
}
