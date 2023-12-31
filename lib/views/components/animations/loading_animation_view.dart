import 'package:instavoid/views/components/animations/lottie_animations_views.dart';
import 'package:instavoid/views/components/animations/models/lottie_animations.dart';

class LoadingAnimationView extends LottieAnimationsView {
  const LoadingAnimationView({super.key})
      : super(
          animation: LottieAnimation.loading,
        );
}
