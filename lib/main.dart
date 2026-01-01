import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/intro_screen.dart';
import 'package:islami/tabs/quran_tab/details/sura_details_screen.dart';
import 'package:islami/utils/app_routs.dart';
import 'package:islami/utils/app_theme.dart';

import 'home/home_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);

    return MaterialApp(
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.dark,
      debugShowCheckedModeBanner: false,
      initialRoute: AppRouts.introScreenRout,
      routes: {
        AppRouts.introScreenRout: (context) => IntroScreen(),
        AppRouts.homeScreenRoute: (context) => HomeScreen(),
        AppRouts.suraDetailsScreen: (context) => SuraDetailsScreen(),
      },
    );
  }
}
