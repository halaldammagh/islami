import 'package:flutter/cupertino.dart';

import '../../../utils/app_assets.dart';
import '../widget/radio_card.dart';

class RecitersRadio extends StatelessWidget {
  const RecitersRadio({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        SizedBox(height: height * 0.019),
        RadioCard(
          title: 'Ibrahim Al-Akdar',
          icon1: AppAssets.off,
          icon2: AppAssets.volumeHigh,
          backGroundImage: AppAssets.radiaMo,
        ),
        RadioCard(
          title: 'Akram Alalaqmi',
          icon1: AppAssets.play,
          icon2: AppAssets.volumeCross,
          backGroundImage: AppAssets.radiaVol,
        ),
        RadioCard(
          title: 'Majed Al-Enezi',
          icon1: AppAssets.off,
          icon2: AppAssets.volumeHigh,
          backGroundImage: AppAssets.radiaMo,
        ),
        RadioCard(
          title: 'Malik shaibat Alhamed',
          icon1: AppAssets.off,
          icon2: AppAssets.volumeHigh,
          backGroundImage: AppAssets.radiaMo,
        ),
      ],
    );
  }
}
