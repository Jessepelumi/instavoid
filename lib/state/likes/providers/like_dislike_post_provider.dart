import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:instavoid/state/constants/firebase_collection_name.dart';
import 'package:instavoid/state/constants/firebase_field_name.dart';
import 'package:instavoid/state/likes/models/like.dart';
import 'package:instavoid/state/likes/models/like_dislike_request.dart';

final likeDislikePostProvider = FutureProvider.family
    .autoDispose<bool, LikeDislikeRequests>(
        (ref, LikeDislikeRequests requests) async {
  final query = FirebaseFirestore.instance
      .collection(FirebaseCollectionName.likes)
      .where(FirebaseFieldName.postId, isEqualTo: requests.postId)
      .where(FirebaseFieldName.userId, isEqualTo: requests.likedBy)
      .get();

  //first check if the user has already liked the post
  final hasLiked = await query.then((snapshot) => snapshot.docs.isNotEmpty);

  if (hasLiked) {
    //delete the like on the post
    try {
      await query.then((snapshot) async {
        for (final doc in snapshot.docs) {
          await doc.reference.delete();
        }
      });
      return true;
    } catch (_) {
      return false;
    }
  } else {
    //post a like object
    final like = Like(
      postId: requests.postId,
      likedBy: requests.likedBy,
      date: DateTime.now(),
    );

    try {
      await FirebaseFirestore.instance
          .collection(FirebaseCollectionName.likes)
          .add(like);
      return true;
    } catch (_) {
      return false;
    }
  }
});
