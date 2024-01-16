import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:instavoid/views/components/search_grid_view.dart';
import 'package:instavoid/views/constants/strings.dart';
import 'package:instavoid/views/extensions/dismiss_keyboard.dart';

class SearchView extends HookConsumerWidget {
  const SearchView({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textController = useTextEditingController();

    final searchTerm = useState("");

    useEffect(() {
      textController.addListener(() {
        searchTerm.value = textController.text;
      });
      return () {};
    }, [textController]);

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            controller: textController,
            textInputAction: TextInputAction.search,
            decoration: InputDecoration(
              hintText: Strings.enterYourSearchTermHere,
              suffixIcon: IconButton(
                onPressed: () {
                  textController.clear();
                  dismissKeyboard();
                },
                icon: const Icon(Icons.clear),
              ),
            ),
          ),
        ),
        Expanded(
          child: SearchGridView(searchTerm: searchTerm.value),
        ),
      ],
    );
  }
}
