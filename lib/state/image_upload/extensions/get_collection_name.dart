import 'package:instavoid/state/image_upload/models/file_type.dart';

extension GetCollectionName on FileType {
  String get collectionName {
    switch (this) {
      case FileType.image:
        return "images";
      case FileType.video:
        return "videos";
    }
  }
}
