//converts 0x????? or #????? to Color

import 'package:flutter/material.dart';
import 'package:instavoid/extensions/string/remove_all.dart';

extension AsHtmlColorToColor on String {
  Color htmlColorToColor() => Color(
        int.parse(
          removeAll(["0x", "#"]),
        ),
      );
}
