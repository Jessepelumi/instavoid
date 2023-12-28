import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:instavoid/state/auth/models/auth_state.dart';
import 'package:instavoid/state/auth/notifiers/auth_state_notifier.dart';

//AuthStateNotifier - Notifier, AuthState - Notifier object
final authStateProvider = StateNotifierProvider<AuthStateNotifier, AuthState>(
  (_) => AuthStateNotifier(),
);
