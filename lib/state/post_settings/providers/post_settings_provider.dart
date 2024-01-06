import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:instavoid/state/post_settings/models/post_setting.dart';
import 'package:instavoid/state/post_settings/notifiers/post_settings_notifier.dart';

final postSettingsProvider =
    StateNotifierProvider<PostSettingsNotifier, Map<PostSetting, bool>>(
  (ref) => PostSettingsNotifier(),
);
