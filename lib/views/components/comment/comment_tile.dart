import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:instavoid/state/auth/providers/user_id_provider.dart';
import 'package:instavoid/state/comments/models/comments.dart';
import 'package:instavoid/state/comments/providers/delete_comment_providers.dart';
import 'package:instavoid/state/user_info/providers/user_info_model_provider.dart';
import 'package:instavoid/views/components/animations/small_error_animation_view.dart';
import 'package:instavoid/views/components/constants/strings.dart';
import 'package:instavoid/views/components/dialogs/alert_dialog_model.dart';
import 'package:instavoid/views/components/dialogs/delete_dialog.dart';

class CommentTile extends ConsumerWidget {
  final Comment comment;

  const CommentTile({
    super.key,
    required this.comment,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userInfo = ref.watch(
      userInfoModelProvider(comment.fromUserId),
    );

    return userInfo.when(
      data: (userInfo) {
        final currentUser = ref.read(userIdProvider);
        return ListTile(
          trailing: currentUser == comment.fromUserId
              ? IconButton(
                  onPressed: () async {
                    final shouldDelete = await displayDeleteDialog(context);
                    if (shouldDelete) {
                      await ref
                          .read(deleteCommentProvider.notifier)
                          .deleteComment(commentId: comment.id);
                    }
                  },
                  icon: const Icon(Icons.delete),
                )
              : null,
          title: Text(userInfo.displayName),
          subtitle: Text(comment.comment),
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
    );
  }

  Future<bool> displayDeleteDialog(BuildContext context) =>
      const DeleteDialog(titleOfObjectToDelete: Strings.comment)
          .present(context)
          .then((value) => value ?? false);
}
