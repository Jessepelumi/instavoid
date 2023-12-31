import 'package:instavoid/views/components/animations/lottie_animations_views.dart';
import 'package:instavoid/views/components/animations/models/lottie_animations.dart';

class EmptyContentsAnimationView extends LottieAnimationsView {
  const EmptyContentsAnimationView({super.key})
      : super(
          animation: LottieAnimation.empty,
        );
}
