import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:instavoid/state/constants/firebase_collection_name.dart';
import 'package:instavoid/state/constants/firebase_field_name.dart';
import 'package:instavoid/state/posts/typedefs/post_id.dart';

final postLikesCountProvider =
    StreamProvider.family.autoDispose<int, PostId>((ref, PostId postId) {
  final controller = StreamController<int>.broadcast();

  controller.onListen = () {
    controller.sink.add(0);
  };
  final subscription = FirebaseFirestore.instance
      .collection(FirebaseCollectionName.likes)
      .where(FirebaseFieldName.postId, isEqualTo: postId)
      .snapshots()
      .listen((snapshot) {
    controller.sink.add(snapshot.docs.length);
  });

  ref.onDispose(() {
    subscription.cancel();
    controller.close();
  });

  return controller.stream;
});
