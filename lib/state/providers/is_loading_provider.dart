import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:instavoid/state/auth/providers/auth_state_provider.dart';
import 'package:instavoid/state/image_upload/providers/image_upload_provider.dart';

final isLoadingProvider = Provider<bool>((ref) {
  final authState = ref.watch(authStateProvider);
  final isUploadingImage = ref.watch(imageUploadProvider);

  return authState.isLoading || isUploadingImage;
});
