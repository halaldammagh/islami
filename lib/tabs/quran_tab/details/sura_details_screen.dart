import 'package:flutter/material.dart';
import 'package:islami/model/quran_resources.dart';
import 'package:islami/tabs/quran_tab/details/sura_details1.dart';
import 'package:islami/tabs/quran_tab/details/sura_details2.dart';
import 'package:islami/utils/app_colors.dart';
import 'package:islami/utils/app_styles.dart';

class SuraDetailsScreen extends StatefulWidget {
  @override
  State<SuraDetailsScreen> createState() => _SuraDetailsScreenState();
}

class _SuraDetailsScreenState extends State<SuraDetailsScreen> {
  bool show = true;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    int index = ModalRoute.of(context)?.settings.arguments as int;
    // TODO: implement build
    return Scaffold(
      backgroundColor: AppColors.black,
      appBar: AppBar(
        title: Text(
          QuranResources.englishQuranSurahList[index],
          style: AppStyles.bold20Primary,
        ),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                show = true;
              });
            },
            icon: show == true
                ? Container(
                    decoration: BoxDecoration(
                      color: AppColors.primaryColor,
                      borderRadius: BorderRadiusGeometry.circular(50),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(Icons.menu_book, color: AppColors.black),
                    ),
                  )
                : Icon(Icons.menu_book),
          ),
          IconButton(
            onPressed: () {
              setState(() {
                show = false;
              });
            },
            icon: show == false
                ? Container(
                    decoration: BoxDecoration(
                      color: AppColors.primaryColor,
                      borderRadius: BorderRadiusGeometry.circular(50),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(Icons.library_books, color: AppColors.black),
                    ),
                  )
                : Icon(Icons.library_books),
          ),
          SizedBox(width: width * 0.03),
        ],

        // backgroundColor: AppColors.black,   /// بنوديه الثيم عشان بتكرر كتير
        // centerTitle: true,
      ),
      body: show ? SuraDetails1(index: index) : SuraDetails2(index: index),
    );
  }
}
