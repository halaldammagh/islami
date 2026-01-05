import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:islami/utils/app_styles.dart';

class HadethContent extends StatelessWidget {
  final String content;

  const HadethContent({super.key, required this.content});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * 0.02),
      child: Text(
        "$content",
        style: AppStyles.bold20Primary,
        textDirection: TextDirection.rtl,
        textAlign: TextAlign.center,
      ),
    );
  }
}
