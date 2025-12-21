import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

class IntroScreen extends StatelessWidget {
  static const String routeName = 'Intro';

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      globalBackgroundColor: const Color(0xFF1E1E1E),

      pages: [
        // الصفحة الأولى (الصورة كاملة)
        PageViewModel(
          title: '',
          body: '',
          image: Image.asset(
            'assets/images/intro1.png',
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
            'assets/images/intro2.png',
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
            'assets/images/intro3.png',
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
            'assets/images/intro4.png',
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
            'assets/images/intro5.png',
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

        // الصفحات اللي بعدها (كمثال)
      ],

      showSkipButton: false,
      showDoneButton: false,
      showNextButton: true,
      showBackButton: true,

      back: const Text('Back', style: TextStyle(color: Color(0xFFE2BE7F))),

      next: const Text('Next', style: TextStyle(color: Color(0xFFE2BE7F))),
      dotsDecorator: const DotsDecorator(
        activeColor: Color(0xFFE2BE7F),
        color: Colors.grey,
      ),
    );
  }
}
