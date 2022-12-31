import 'package:flutter/material.dart';

class AnimatedCounter extends StatelessWidget {
  const AnimatedCounter(
      {required this.value, required this.primaryColor, super.key});

  final int value;
  final MaterialColor primaryColor;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      tween: IntTween(begin: 0, end: value),
      duration: const Duration(seconds: 2),
      builder: (context, value, child) => Text("$value",
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.w600, color: primaryColor),
          textAlign: TextAlign.center),
    );
  }
}
