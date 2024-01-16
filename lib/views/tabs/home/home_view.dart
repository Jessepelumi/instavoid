import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:instavoid/state/posts/providers/all_posts_provider.dart';
import 'package:instavoid/views/components/animations/empty_contents_with_text_animation_view.dart';
import 'package:instavoid/views/components/animations/error_animation_view.dart';
import 'package:instavoid/views/components/animations/loading_animation_view.dart';
import 'package:instavoid/views/components/post/posts_grid_view.dart';
import 'package:instavoid/views/constants/strings.dart';

class HomeView extends ConsumerWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final posts = ref.watch(allPostsProvider);

    return RefreshIndicator(
      onRefresh: () {
        // ignore: unused_result
        ref.refresh(allPostsProvider);
        return Future.delayed(
          const Duration(seconds: 1),
        );
      },
      child: posts.when(
        data: (posts) {
          if (posts.isEmpty) {
            return const EmptyContentsWithTextAnimationView(
              text: Strings.noPostsAvailable,
            );
          } else {
            return PostGridView(posts: posts);
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
