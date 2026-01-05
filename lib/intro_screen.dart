import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:islami/utils/app_assets.dart';
import 'package:islami/utils/app_routs.dart';

class IntroScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      globalBackgroundColor: const Color(0xFF1E1E1E),
      pages: [
        PageViewModel(
          title: '',
          body: '',
          image: Image.asset(
            AppAssets.intro1,
            fit: BoxFit.contain,
            width: double.infinity,
          ),
          decoration: const PageDecoration(
            pageColor: Color(0xff202020),
            imageFlex: 5,
            bodyFlex: 0,
            titlePadding: EdgeInsets.zero,
            bodyPadding: EdgeInsets.zero,
            contentMargin: EdgeInsets.zero,
          ),
        ),
        PageViewModel(
          title: '',
          body: '',
          image: Image.asset(
            AppAssets.intro2,
            fit: BoxFit.contain,
            width: double.infinity,
          ),
          decoration: const PageDecoration(
            pageColor: Color(0xff202020),
            imageFlex: 5,
            bodyFlex: 0,
            titlePadding: EdgeInsets.zero,
            bodyPadding: EdgeInsets.zero,
            contentMargin: EdgeInsets.zero,
          ),
        ),
        PageViewModel(
          title: '',
          body: '',
          image: Image.asset(
            AppAssets.intro3,
            fit: BoxFit.contain,
            width: double.infinity,
          ),
          decoration: const PageDecoration(
            pageColor: Color(0xff202020),
            imageFlex: 5,
            bodyFlex: 0,
            titlePadding: EdgeInsets.zero,
            bodyPadding: EdgeInsets.zero,
            contentMargin: EdgeInsets.zero,
          ),
        ),
        PageViewModel(
          title: '',
          body: '',
          image: Image.asset(
            AppAssets.intro4,
            fit: BoxFit.contain,
            width: double.infinity,
          ),
          decoration: const PageDecoration(
            pageColor: Color(0xff202020),
            imageFlex: 5,
            bodyFlex: 0,
            titlePadding: EdgeInsets.zero,
            bodyPadding: EdgeInsets.zero,
            contentMargin: EdgeInsets.zero,
          ),
        ),
        PageViewModel(
          title: '',
          body: '',
          image: Image.asset(
            AppAssets.intro5,
            fit: BoxFit.contain,
            width: double.infinity,
          ),
          decoration: const PageDecoration(
            pageColor: Color(0xff202020),
            imageFlex: 5,
            bodyFlex: 0,
            titlePadding: EdgeInsets.zero,
            bodyPadding: EdgeInsets.zero,
            contentMargin: EdgeInsets.zero,
          ),
        ),
      ],

      showSkipButton: false,
      showDoneButton: true,
      showNextButton: true,
      showBackButton: true,

      back: const Text('Back', style: TextStyle(color: Color(0xFFE2BE7F))),
      next: const Text('Next', style: TextStyle(color: Color(0xFFE2BE7F))),
      done: const Text('Next', style: TextStyle(color: Color(0xFFE2BE7F))),
      onDone: () {
        Navigator.pushReplacementNamed(context, AppRouts.homeScreenRoute);
      },

      dotsDecorator: const DotsDecorator(
        activeColor: Color(0xFFE2BE7F),
        color: Colors.grey,
      ),
    );
  }
}
