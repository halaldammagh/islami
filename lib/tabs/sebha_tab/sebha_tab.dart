import 'package:flutter/material.dart';
import 'package:islami/utils/app_assets.dart';
import 'package:islami/utils/app_colors.dart';
import 'package:islami/utils/app_styles.dart';

class SebhaTab extends StatefulWidget {
  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab>
    with SingleTickerProviderStateMixin {
  List<String> sebha = ['سبحان الله', 'الحمد لله', 'الله اكبر'];
  int counter = 0;
  late AnimationController _controller;
  double rotation = 0;
  int index = 0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 250),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: Column(
          children: [
            SizedBox(height: height * 0.042),

            Text('سَبِّحِ اسْمَ رَبِّكَ الأعلى ', style: AppStyles.bold36White),
            SizedBox(height: height * 0.032),
            Stack(
              alignment: Alignment.topCenter,
              children: [
                AnimatedBuilder(
                  animation: _controller,
                  builder: (_, child) {
                    return Transform.rotate(
                      alignment: const Alignment(0.0, 0.18),
                      angle: rotation,
                      child: child,
                    );
                  },
                  child: Image.asset(AppAssets.sebhaCap, fit: BoxFit.contain),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: height * 0.215,
                    horizontal: width * 0.23,
                  ),
                  child: InkWell(
                    splashColor: AppColors.transParentColor,
                    highlightColor: AppColors.transParentColor,
                    onTap: () {
                      if (index == 2) {
                        index = 0;
                      } else {
                        index++;
                      }
                      counter++;
                      if (counter > 33) {
                        counter = 0;
                      }

                      rotation += 0.25;
                      _controller.forward(from: 0);
                      setState(() {});
                    },
                    child: Column(
                      children: [
                        Container(
                          child: Text(
                            sebha[index],
                            style: AppStyles.bold36White,
                          ),
                        ),
                        SizedBox(height: height * 0.021),

                        Text('$counter', style: AppStyles.bold36White),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
