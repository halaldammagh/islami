import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:islami/tabs/hadeth_tab/widget/hadeth_item.dart';

class HadethTab extends StatelessWidget {
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
      body: CarouselSlider(
        options: CarouselOptions(
            height: height * 0.66,
            enlargeCenterPage: true,
            enableInfiniteScroll: true
        ),
        items: List.generate(50, (index) => index + 1).map((index) {
          return HadethItem(index: index);
        }).toList(),
      ),
    );
  }
}
