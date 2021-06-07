import 'package:flutter/material.dart';

import 'constants.dart';

class PageIndicators extends StatelessWidget {
  final AnimationController animController;
  final double animateBar1;
  final double animateBar2;

  PageIndicators({
    required this.animController,
    required this.animateBar1,
    required this.animateBar2,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          children: [
            buildContainer(
              kPageIndicatorWidth,
              Colors.grey.shade400,
            ),
            SizedBox(
              width: 2.0,
            ),
            buildContainer(
              kPageIndicatorWidth,
              Colors.grey.shade400,
            ),
          ],
        ),
        AnimatedBuilder(
          animation: animController,
          builder: (context, builder) {
            return Row(
              children: [
                buildContainer(
                  animateBar1 == 0
                      ? kPageIndicatorWidth
                      : kPageIndicatorWidth *
                          animController.value *
                          animateBar1,
                  Colors.black,
                ),
                SizedBox(
                  width: 2.0,
                ),
                buildContainer(
                  kPageIndicatorWidth * animController.value * animateBar2,
                  Colors.black,
                ),
              ],
            );
          },
        ),
      ],
    );
  }

  Container buildContainer(double width, Color color) {
    return Container(
      height: kPageIndicatorHeight,
      width: width,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(3.0),
      ),
    );
  }
}
