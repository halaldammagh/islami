import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:islami/utils/app_assets.dart';
import 'package:islami/utils/app_styles.dart';

class TimeTab extends StatelessWidget {
  final List<Map<String, String>> prayers = [
    {'name': 'Fajr', 'time': '05:04', 'period': 'AM'},
    {'name': 'Dhuhr', 'time': '01:01', 'period': 'PM'},
    {'name': 'Asr', 'time': '04:38', 'period': 'PM'},
    {'name': 'Maghrib', 'time': '07:57', 'period': 'PM'},
    {'name': 'Isha', 'time': '09:15', 'period': 'PM'},
  ];

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
          Stack(
            clipBehavior: Clip.none,
            children: [
              Center(child: Image.asset(AppAssets.itemTimeBg)),
              Padding(
                padding: EdgeInsets.symmetric(vertical: height * 0.015),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        '16 Jul \n 2024',
                        style: AppStyles.bold16WhiteText,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Text(
                            'Pray Time',
                            style: AppStyles.balod16TextOpacity,
                          ),
                          Text('Tuesday', style: AppStyles.bold16BlackText),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Text(
                        '09 Muh \n 1446',
                        style: AppStyles.bold16WhiteText,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: width * 0.069,
                  vertical: height * 0.096,
                ),
                child: CarouselSlider(
                  options: CarouselOptions(
                    height: height * 0.137,
                    viewportFraction: 0.241,
                    enlargeCenterPage: true,
                    enableInfiniteScroll: true,
                    enlargeFactor: 0.18,
                    //  تكبير خفيف للوسط
                    disableCenter: true,

                    ///ساعد إن المسافات تصير طبيعية
                  ),
                  items: prayers
                      .asMap()
                      .entries
                      .map((entry) {
                    int i = entry.key;
                    var prayer = entry.value;
                    return Builder(
                      builder: (BuildContext context) {
                        return Container(
                          width: MediaQuery
                              .of(context)
                              .size
                              .width,
                          margin: EdgeInsets.symmetric(
                              horizontal: width * 0.0021),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [Color(0xFF2F2A24), Color(0xFF6F614E)],
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: height * 0.016),
                            child: Column(
                              children: [
                                Text(prayer['name']!,
                                  style: AppStyles.bold16WhiteText,),
                                Text(prayer['time']!,
                                  style: AppStyles.bold32WhiteText,),
                                Text(prayer['period']!,
                                  style: AppStyles.bold16WhiteText,),

                              ],
                            ),
                          ),

                        );
                      },
                    );
                  }).toList(),
                ),
              ),
              Positioned(
                left: width * 0.36,
                right: width * 0.12,
                bottom: height * 0.05,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text('Next Pray', style: AppStyles.balod16TextOpacity),
                        Text(' - 02:32', style: AppStyles.bold16BlackText),
                      ],
                    ),
                    Image.asset(AppAssets.volumeSlash, width: 28, height: 28),
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(
                bottom: height * 0.016, left: width * 0.081),
            child: Text('Azkar', style: AppStyles.bold16Primary,),
          ),
          Padding(
            padding: EdgeInsets.only(left: width * 0.069, right: width * 0.069),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(AppAssets.eveningAzkar),
                Image.asset(AppAssets.morningAzkar),
              ],
            ),
          )
        ],
      ),
    );
  }
}
