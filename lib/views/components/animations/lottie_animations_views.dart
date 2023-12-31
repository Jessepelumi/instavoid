import 'package:flutter/material.dart';
import 'package:instavoid/views/components/animations/models/lottie_animations.dart';
import 'package:lottie/lottie.dart';

class LottieAnimationsView extends StatelessWidget {
  final LottieAnimation animation;
  final bool repeat;
  final bool reverse;

  const LottieAnimationsView({
    super.key,
    required this.animation,
    this.repeat = true,
    this.reverse = false,
  });

  @override
  Widget build(BuildContext context) => Lottie.asset(
        animation.fullPath,
        repeat: repeat,
        reverse: reverse,
      );
}

extension GetFullPath on LottieAnimation {
  String get fullPath => "assets/animations/$name.json";
}
