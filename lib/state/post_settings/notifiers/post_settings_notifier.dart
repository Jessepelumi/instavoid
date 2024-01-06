import 'dart:collection';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:instavoid/state/post_settings/models/post_setting.dart';

class PostSettingsNotifier extends StateNotifier<Map<PostSetting, bool>> {
  PostSettingsNotifier()
      : super(
          UnmodifiableMapView({
            for (final settings in PostSetting.values) settings: true,
          }),
        );

  void setSetting(PostSetting setting, bool value) {
    final existingValue = state[setting];
    if (existingValue == null || existingValue == value) {
      return;
    }
    state = Map.unmodifiable(
      Map.from(state)..[setting] = value,
    );
  }
}
