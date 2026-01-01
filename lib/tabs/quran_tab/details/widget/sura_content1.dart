import 'package:flutter/material.dart';
import 'package:islami/utils/app_colors.dart';
import 'package:islami/utils/app_styles.dart';

class SuraContent extends StatelessWidget {
  final String content;
  final int index;
  final int selected;
  final VoidCallback onTap;

  const SuraContent({
    super.key,
    required this.content,
    required this.index,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    bool isSelected = selected == index;

    return InkWell(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: width * 0.046),
        padding: EdgeInsets.symmetric(vertical: height * 0.02),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primaryColor : AppColors.black,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: AppColors.primaryColor, width: 2),
        ),
        child: Text(
          "$content [${index + 1}]",
          style: isSelected ? AppStyles.bold20Black : AppStyles.bold20Primary,
          textDirection: TextDirection.rtl,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
