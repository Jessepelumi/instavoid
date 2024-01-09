import 'package:flutter/foundation.dart' show immutable;
import 'package:instavoid/views/components/constants/strings.dart';
import 'package:instavoid/views/components/dialogs/alert_dialog_model.dart';

@immutable
class DeleteDialog extends AlertDialogModel {
  const DeleteDialog({
    required String titleOfObjectToDelete,
  }) : super(
          title: "${Strings.delete} $titleOfObjectToDelete?",
          message:
              "${Strings.areYouSureYouWantToDeleteThis} $titleOfObjectToDelete?",
          buttons: const {
            Strings.cancel: false,
            Strings.delete: true,
          },
        );
}
