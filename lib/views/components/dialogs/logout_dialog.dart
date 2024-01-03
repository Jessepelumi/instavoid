import 'package:flutter/foundation.dart' show immutable;
import 'package:instavoid/views/components/constants/strings.dart';
import 'package:instavoid/views/components/dialogs/alert_dialog_model.dart';

@immutable
class LogoutDialog extends AlertDialogModel<bool> {
  const LogoutDialog()
      : super(
          title: Strings.logOut,
          message: Strings.areYouSureYouWantToLogOutTheApp,
          buttons: const {
            Strings.cancel: false,
            Strings.logOut: true,
          },
        );
}
