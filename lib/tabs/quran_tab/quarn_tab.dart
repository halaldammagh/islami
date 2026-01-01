import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:islami/model/quran_resources.dart';
import 'package:islami/tabs/quran_tab/widget/sura_item_widget.dart';
import 'package:islami/utils/app_assets.dart';
import 'package:islami/utils/app_colors.dart';
import 'package:islami/utils/app_routs.dart';
import 'package:islami/utils/app_styles.dart';

///width : 430  height : 932
class QuarnTab extends StatelessWidget {
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

    return Scaffold(backgroundColor: Colors.transparent,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: width * 0.04),

        ///20/430
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: height * 0.01,
          children: [
            TextField(
              style: TextStyle(
                  color: AppColors.white
              ),
              cursorColor: AppColors.primaryColor,

              /// لون الماوس
              decoration: InputDecoration(
                  prefixIcon: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: SvgPicture.asset(AppAssets.quran,
                      colorFilter: ColorFilter.mode(
                          AppColors.primaryColor, BlendMode.srcIn),),
                  ),
                  enabledBorder: buildOutLineInputBorder(),
                  focusedBorder: buildOutLineInputBorder(),
                  hintText: 'Sura Name',
                  hintStyle: AppStyles.bold16White
              ),
            ),
            Text('Most Recently',
                style: AppStyles.bold16White
            ),
            SizedBox(height: height * 0.18,
              child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Container(
                      padding: EdgeInsets.symmetric(horizontal: width * 0.02),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: AppColors.primaryColor,
                      ),

                      child: Row(
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(QuranResources.englishQuranSurahList[index],
                                  style: AppStyles.bold24Black),
                              Text(QuranResources.arabicQuranSuraList[index],
                                style: AppStyles.bold24Black,),
                              Text('${QuranResources
                                  .versesNumberList[index]} Verses',
                                style: AppStyles.bold14Black,),
                            ],
                          ),
                          Image.asset('assets/images/minimage/reading.png',
                            color: Colors.black,)

                        ],
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return SizedBox(width: width * 0.04,);
                  },
                  itemCount: QuranResources.versesNumberList.length),
            ),
            Text('Sura List', style: AppStyles.bold16White,),
            Expanded(child: ListView.separated(
                itemBuilder: (context, index) {
                  return InkWell(
                      onTap: () {
                        Navigator.of(context).pushNamed(
                            AppRouts.suraDetailsScreen,
                            arguments: index);
                      },
                      child: SuraItemWidget(index: index,));
                },
                separatorBuilder: (context, index) {
                  return Divider(
                    color: AppColors.white,
                    thickness: 2,
                    indent: width * 0.06,
                    endIndent: width * 0.06,

                  );
                },
                itemCount: QuranResources.versesNumberList.length))


          ],
        ),
      ),

    );
  }

  OutlineInputBorder buildOutLineInputBorder() {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(
          color: AppColors.primaryColor,
          width: 2,
        )

    );
  }
}


