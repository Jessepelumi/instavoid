import 'package:flutter/material.dart';
import 'package:instavoid/state/posts/models/post.dart';
import 'package:instavoid/views/components/post/post_thumbnail_view.dart';
import 'package:instavoid/views/post_details/post_details_view.dart';

class PostSliverGridView extends StatelessWidget {
  final Iterable<Post> posts;

  const PostSliverGridView({
    super.key,
    required this.posts,
  });

  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      delegate: SliverChildBuilderDelegate(childCount: posts.length,
          (context, index) {
        final post = posts.elementAt(index);
        return PostThumbnailView(
          post: post,
          onTapped: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => PostDetailsView(
                  post: post,
                ),
              ),
            );
          },
        );
      }),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
      ),
    );
  }
}
