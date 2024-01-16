import 'package:flutter/material.dart';
import 'package:instavoid/state/posts/models/post.dart';
import 'package:instavoid/views/components/animations/loading_animation_view.dart';

class PostImageView extends StatelessWidget {
  final Post post;

  const PostImageView({
    super.key,
    required this.post,
  });

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: post.aspectRatio,
      child: Image.network(
        post.fileUrl,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;
          return const LoadingAnimationView();
        },
      ),
    );
  }
}
