import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:islami/tabs/hadeth_tab/hadeth_tab.dart';
import 'package:islami/tabs/quran_tab/quarn_tab.dart';
import 'package:islami/tabs/radio_tab/radio_tab.dart';
import 'package:islami/tabs/sebha_tab/sebha_tab.dart';
import 'package:islami/tabs/time_tab/time_tab.dart';
import 'package:islami/utils/app_assets.dart';
import 'package:islami/utils/app_colors.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'home';

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  List<String> backgroundImages = [
    AppAssets.quranBg,
    AppAssets.hadethpg,
    AppAssets.sebhapg,
    AppAssets.radiopg,
    AppAssets.timepg,
  ];
  List<Widget> tabsList = [
    QuranTab(),
    HadethTab(),
    SebhaTab(),
    RadioTab(),
    TimeTab(),
  ];

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Stack(
      children: [
        Image.asset(
          backgroundImages[selectedIndex],
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.cover,
        ),

        // Column(
        // crossAxisAlignment: CrossAxisAlignment.stretch,
        //   children: [
        //     Image.asset('assets/images/islamiLogo.png'),
        //   ],
        // ),
        Scaffold(
          backgroundColor: Colors.transparent,

          bottomNavigationBar: Theme(
            data: Theme.of(
              context,
            ).copyWith(canvasColor: AppColors.primaryColor),
            child: BottomNavigationBar(
              currentIndex: selectedIndex,
              onTap: (index) {
                selectedIndex = index;
                setState(() {});
              },
              items: [
                buildBottomNavBarItem(
                  index: 0,
                  image: AppAssets.quran,
                  label: 'Quran',
                ),
                buildBottomNavBarItem(
                  index: 1,
                  image: AppAssets.hadeth,
                  label: 'Hadeth',
                ),
                buildBottomNavBarItem(
                  index: 2,
                  image: AppAssets.sebha,
                  label: 'Sebha',
                ),
                buildBottomNavBarItem(
                  index: 3,
                  image: AppAssets.radio,
                  label: 'Radio',
                ),
                buildBottomNavBarItem(
                  index: 4,
                  image: AppAssets.time,
                  label: 'Time',
                ),
              ],
            ),
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset('assets/images/islamiLogo.png'),
              Expanded(child: tabsList[selectedIndex]),
            ],
          ),
        ),
      ],
    );
  }

  BottomNavigationBarItem buildBottomNavBarItem({
    required int index,
    required String image,
    required String label,
  }) {
    return BottomNavigationBarItem(
      icon: selectedIndex == index
          ? Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              decoration: BoxDecoration(
                color: AppColors.blackpg,
                borderRadius: BorderRadius.circular(66),
              ),
              child: SvgPicture.asset(
                image,
                colorFilter: ColorFilter.mode(
                  selectedIndex == index ? AppColors.white : AppColors.black,
                  BlendMode.srcIn,
                ),
              ),
            )
          : SvgPicture.asset(
              image,
              colorFilter: ColorFilter.mode(
                selectedIndex == index ? AppColors.white : AppColors.black,
                BlendMode.srcIn,
              ),
            ),
      label: label,
    );
  }
}
