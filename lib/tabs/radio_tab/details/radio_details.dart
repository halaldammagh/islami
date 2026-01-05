import 'package:flutter/cupertino.dart';

import '../../../utils/app_assets.dart';
import '../widget/radio_card.dart';

class RadioDetails extends StatelessWidget {
  const RadioDetails({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        SizedBox(height: height * 0.019),
        RadioCard(
          title: 'Radio Ibrahim Al-Akdar',
          icon1: AppAssets.off,
          icon2: AppAssets.volumeHigh,
          backGroundImage: AppAssets.radiaMo,
        ),
        RadioCard(
          title: 'Radio Al-Qaria Yassen',
          icon1: AppAssets.play,
          icon2: AppAssets.volumeCross,
          backGroundImage: AppAssets.radiaVol,
        ),
        RadioCard(
          title: 'Radio Ahmed Al-trabulsi',
          icon1: AppAssets.off,
          icon2: AppAssets.volumeHigh,
          backGroundImage: AppAssets.radiaMo,
        ),
        RadioCard(
          title: 'Radio Addokali Mohammad Alalim',
          icon1: AppAssets.off,
          icon2: AppAssets.volumeHigh,
          backGroundImage: AppAssets.radiaMo,
        ),
      ],
    );
    ;
  }
}
