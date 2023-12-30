import 'package:flutter/foundation.dart' show immutable;
import 'package:flutter/material.dart' show Colors;
import 'package:instavoid/extensions/string/as_html_color_to_color.dart';

@immutable
class AppColors {
  static final loginButtonColor = "cfc9c2".htmlColorToColor();
  static const loginButtonTextColor = Colors.black;
  static final googleColor = "4285f4".htmlColorToColor();
  static final facebookColor = "3b5998".htmlColorToColor();

  //private constructor so that no one can initialize the class
  const AppColors._();
}
