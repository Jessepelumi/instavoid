import 'package:instavoid/views/components/animations/lottie_animations_views.dart';
import 'package:instavoid/views/components/animations/models/lottie_animations.dart';

class ErrorAnimationView extends LottieAnimationsView {
  const ErrorAnimationView({super.key})
      : super(
          animation: LottieAnimation.error,
        );
}
