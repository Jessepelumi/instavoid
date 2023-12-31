import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:instavoid/state/posts/providers/user_posts_provider.dart';
//import 'package:instavoid/views/components/animations/data_not_found_animation_view.dart';
import 'package:instavoid/views/components/animations/empty_contents_with_text_animation_view.dart';
import 'package:instavoid/views/components/animations/error_animation_view.dart';
import 'package:instavoid/views/components/animations/loading_animation_view.dart';
import 'package:instavoid/views/components/post/posts_grid_view.dart';
import 'package:instavoid/views/constants/strings.dart';

class UserPostsView extends ConsumerWidget {
  const UserPostsView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final posts = ref.watch(userPostsProvider);
    return RefreshIndicator(
      onRefresh: () {
        // ignore: unused_result
        ref.refresh(userPostsProvider);
        return Future.delayed(const Duration(seconds: 1));
      },
      child: posts.when(
        data: (posts) {
          if (posts.isEmpty) {
            return const EmptyContentsWithTextAnimationView(
              text: Strings.youHaveNoPosts,
            );
            //return const DataNotFoundAnimationView();
          } else {
            return PostGridView(
              posts: posts,
            );
          }
        },
        error: (error, stackTrace) {
          return const ErrorAnimationView();
        },
        loading: () {
          return const LoadingAnimationView();
        },
      ),
    );
  }
}
