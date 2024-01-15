import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:instavoid/enums/date_sorting.dart';
import 'package:instavoid/state/comments/models/post_comments_request.dart';
import 'package:instavoid/state/posts/models/post.dart';
import 'package:instavoid/state/posts/providers/can_delete_post_provider.dart';
import 'package:instavoid/state/posts/providers/delete_post_provider.dart';
import 'package:instavoid/state/posts/providers/specific_posts_with_comments_provider.dart';
import 'package:instavoid/views/components/animations/error_animation_view.dart';
import 'package:instavoid/views/components/animations/loading_animation_view.dart';
import 'package:instavoid/views/components/animations/small_error_animation_view.dart';
import 'package:instavoid/views/components/comment/compact_comment_column.dart';
import 'package:instavoid/views/components/dialogs/alert_dialog_model.dart';
import 'package:instavoid/views/components/dialogs/delete_dialog.dart';
import 'package:instavoid/views/components/like_button.dart';
import 'package:instavoid/views/components/likes_count_view.dart';
import 'package:instavoid/views/components/post/post_date_view.dart';
import 'package:instavoid/views/components/post/post_display_name_and_message_view.dart';
import 'package:instavoid/views/components/post/post_image_or_video_view.dart';
import 'package:instavoid/views/constants/strings.dart';
import 'package:instavoid/views/login/divider_with_margins.dart';
import 'package:instavoid/views/post_comments/post_comments_view.dart';
import 'package:share_plus/share_plus.dart';

class PostDetailsView extends ConsumerStatefulWidget {
  final Post post;

  const PostDetailsView({
    super.key,
    required this.post,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _PostDetailsViewState();
}

class _PostDetailsViewState extends ConsumerState<PostDetailsView> {
  @override
  Widget build(BuildContext context) {
    final request = RequestForPostAndComments(
      postId: widget.post.postId,
      limit: 3,
      sortByCreatedAt: true,
      dateSorting: DateSorting.oldestOnTop,
    );

    //get the actual post with its comments
    final postWithComments = ref.watch(
      specificPostsWithCommentsProvider(request),
    );

    //can user delete this post
    final canDeletePost = ref.watch(
      canDeletePostProvider(widget.post),
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text(Strings.postDetails),
        actions: [
          //share button is always present
          postWithComments.when(
            data: (postWithComments) {
              return IconButton(
                onPressed: () {
                  final url = postWithComments.post.fileUrl;
                  Share.share(
                    url,
                    subject: Strings.checkOutThisPost,
                  );
                },
                icon: const Icon(Icons.share),
              );
            },
            error: (error, stackTrace) {
              return const SmallErrorAnimationView();
            },
            loading: () {
              return const Center(
                child: CircularProgressIndicator(),
              );
            },
          ),
          //delete button that shows when user can delete
          if (canDeletePost.value ?? false)
            IconButton(
              onPressed: () async {
                final shouldDeletePost = await const DeleteDialog(
                        titleOfObjectToDelete: Strings.posts)
                    .present(context)
                    .then(
                      (shouldDelete) => shouldDelete ?? false,
                    );
                if (shouldDeletePost) {
                  await ref
                      .read(deletePostProvider.notifier)
                      .deletePost(post: widget.post);
                  if (mounted) {
                    Navigator.of(context).pop();
                  }
                }
              },
              icon: const Icon(Icons.delete),
            ),
        ],
      ),
      body: postWithComments.when(
        data: (postWithComments) {
          final postId = postWithComments.post.postId;

          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                PostImageOrVideoView(post: postWithComments.post),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    if (postWithComments.post.allowLikes)
                      LikeButton(postId: postId),
                    if (postWithComments.post.allowComments)
                      IconButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => PostCommentsView(
                                postId: postId,
                              ),
                            ),
                          );
                        },
                        icon: const Icon(
                          Icons.mode_comment_outlined,
                        ),
                      ),
                  ],
                ),
                PostDisplayNameAndMessageView(
                  post: postWithComments.post,
                ),
                PostDateView(
                  dateTime: postWithComments.post.createdAt,
                ),
                //horizontal divider
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Divider(
                    color: Colors.white70,
                  ),
                ),
                //show 3 most recent comments
                CompactCommentColumn(
                  comments: postWithComments.comments,
                ),
                //show likes count
                if (postWithComments.post.allowLikes)
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        LikesCountView(postId: postId),
                      ],
                    ),
                  ),
                //add spacing to bottom
                const SizedBox(
                  height: 100,
                ),
              ],
            ),
          );
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
