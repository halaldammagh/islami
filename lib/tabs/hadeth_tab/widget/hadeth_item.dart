import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/model/hadeth.dart';
import 'package:islami/model/hadeth_details_args.dart';
import 'package:islami/utils/app_assets.dart';
import 'package:islami/utils/app_colors.dart';
import 'package:islami/utils/app_routs.dart';
import 'package:islami/utils/app_styles.dart';

class HadethItem extends StatefulWidget {
  final int index;

  HadethItem({super.key, required this.index});

  @override
  State<HadethItem> createState() => _HadethItemState();
}

class _HadethItemState extends State<HadethItem> {
  Hadeth? hadeth;

  void initState() {
    super.initState();
    loadHadethFile(widget.index);
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        Container(
          height: height * 0.66,
          decoration: BoxDecoration(
            borderRadius: BorderRadiusGeometry.circular(20),
          ),
          child: Image.asset(AppAssets.hadethCard),
        ),
        hadeth == null
            ? Center(child: CircularProgressIndicator(color: AppColors.black))
            : Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: height * 0.045,
                      horizontal: width * 0.069,
                    ),
                    child: Text(
                      hadeth?.title ?? '',
                      style: AppStyles.bold20Black,
                    ),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 35),
                        child: InkWell(
                          onTap: () {
                            Navigator.of(context).pushNamed(
                              AppRouts.HadethDetails,
                              arguments: HadethDetailsArgs(
                                hadeth: hadeth!,
                                index: widget.index,
                              ),
                            );
                          },
                          child: Text(
                            hadeth?.content ?? '',
                            style: AppStyles.bold16Black.copyWith(height: 1.8),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: height * 0.096),
                ],
              ),
      ],
    );
  }

  void loadHadethFile(int index) async {
    String fileContent = await rootBundle.loadString(
      'assets/files/Hadeeth/h$index.txt',
    );
    int fileContentIndex = fileContent.indexOf('\n');
    String title = fileContent.substring(0, fileContentIndex);
    String content = fileContent.substring(fileContentIndex + 1);
    hadeth = Hadeth(title: title, content: content);
    Future.delayed(Duration(seconds: 1));
    setState(() {});
  }
}
