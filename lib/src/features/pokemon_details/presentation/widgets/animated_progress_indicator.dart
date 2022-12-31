import 'package:flutter/material.dart';

class AnimatedLinearProgressIndicator extends StatelessWidget {
  final double percentage;
  final String label;
  final MaterialColor mainColor;
  final double maxValue;

  const AnimatedLinearProgressIndicator(
      {required this.percentage,
      required this.label,
      required this.maxValue,
      super.key,
      required this.mainColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        bottom: 5,
      ),
      margin: const EdgeInsets.only(left: 5, right: 5, top: 10),
      child: TweenAnimationBuilder(
        tween: Tween<double>(begin: 0, end: percentage),
        duration: const Duration(seconds: 2),
        builder: (context, double value, child) => Row(
          children: [
            Expanded(
              flex: 2,
              child: Text(
                label,
                style: TextStyle(color: mainColor[800]),
              ),
            ),
            Expanded(flex: 1, child: Text((value).toInt().toString())),
            Expanded(
              flex: 4,
              child: LinearProgressIndicator(
                value: value / maxValue,
                color: mainColor,
                backgroundColor: mainColor[100],
                //  backgroundColor: darkColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
