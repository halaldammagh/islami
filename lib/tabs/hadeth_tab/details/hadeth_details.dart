import 'package:flutter/material.dart';
import 'package:islami/model/hadeth_details_args.dart';
import 'package:islami/tabs/hadeth_tab/details/widget/hadeth_content.dart';
import 'package:islami/utils/app_colors.dart';
import 'package:islami/utils/app_styles.dart';

class HadethDetails extends StatelessWidget {
  HadethDetails({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    HadethDetailsArgs args =
        ModalRoute.of(context)?.settings.arguments as HadethDetailsArgs;

    return Scaffold(
      backgroundColor: AppColors.black,
      appBar: AppBar(
        title: Text('Hadith ${args.index}', style: AppStyles.bold20Primary),
      ),
      body: Stack(
        children: [
          Image.asset(
            'assets/images/sura_background.png',
            height: double.infinity,
            fit: BoxFit.cover,
          ),
          Center(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: height * 0.03),
              child: Column(
                children: [
                  Text(args.hadeth.title, style: AppStyles.bold24Primary),
                  SizedBox(height: height * 0.04),
                  Expanded(
                    child: SingleChildScrollView(
                      child: HadethContent(content: args.hadeth.content),
                    ),
                  ),
                  SizedBox(height: height * 0.1),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
