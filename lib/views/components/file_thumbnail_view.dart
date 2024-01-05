import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:instavoid/state/image_upload/models/thumbnail_request.dart';
import 'package:instavoid/state/image_upload/providers/thumbnail_provider.dart';
import 'package:instavoid/views/components/animations/loading_animation_view.dart';
import 'package:instavoid/views/components/animations/small_error_animation_view.dart';

class FileThumbnailView extends ConsumerWidget {
  final ThumbnailRequest thumbnailRequest;

  const FileThumbnailView({
    super.key,
    required this.thumbnailRequest,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final thumbnail = ref.watch(
      thumbnailProvider(thumbnailRequest),
    );

    return thumbnail.when(
      data: (ImageWithAspectRatio) {
        return AspectRatio(
          aspectRatio: ImageWithAspectRatio.aspectRatio,
          child: ImageWithAspectRatio.image,
        );
      },
      error: (error, stackTrace) {
        return const SmallErrorAnimationView();
      },
      loading: () {
        return const LoadingAnimationView();
      },
    );
  }
}
