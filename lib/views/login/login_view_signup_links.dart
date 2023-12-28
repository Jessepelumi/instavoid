import 'package:flutter/material.dart';
import 'package:instavoid/views/components/rich_text/rich_text_widget.dart';

class LoginViewSignupLink extends StatelessWidget {
  const LoginViewSignupLink({super.key});

  @override
  Widget build(BuildContext context) {
    return RichTextWidget(
      styleForAll:
          Theme.of(context).textTheme.bodyMedium?.copyWith(height: 1.5),
      texts: [],
    );
  }
}
