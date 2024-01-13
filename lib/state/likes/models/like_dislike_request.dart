import 'package:flutter/foundation.dart' show immutable;
import 'package:instavoid/state/posts/typedefs/post_id.dart';
import 'package:instavoid/state/posts/typedefs/user_id.dart';

@immutable
class LikeDislikeRequests {
  final PostId postId;
  final UserId likedBy;

  const LikeDislikeRequests({
    required this.postId,
    required this.likedBy,
  });
}
