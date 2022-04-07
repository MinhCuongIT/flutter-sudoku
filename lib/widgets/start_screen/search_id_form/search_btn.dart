import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../providers/game_provider.dart';
import '../../../providers/settings_provider.dart';
import '../../../providers/search_provider.dart';
import '../../../screens/game_screen.dart';
import '../../full_width_btn.dart';

class SearchBtn extends ConsumerWidget {
  final GlobalKey<FormState> formKey;

  const SearchBtn({Key? key, required this.formKey}) : super(key: key);

  void _handleSearch(BuildContext context, WidgetRef ref) {
    final _matchNotifier = ref.read(gameProvider.notifier);
    final _optionsNotifier = ref.read(settingsProvider.notifier);
    final _searchNotifier = ref.read(searchProvider.notifier);

    //If validation pass search game else show error message
    if (formKey.currentState!.validate()) {
      _matchNotifier.searchById(_optionsNotifier, _searchNotifier.idSearch);
      Navigator.of(context).popAndPushNamed(GameScreen.route);
    } else {
      null;
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FullWidthBtn(
      text: AppLocalizations.of(context)!.search.toUpperCase(),
      color: Colors.white,
      backgroundColor: Theme.of(context).colorScheme.primary,
      icon: const Icon(
        Icons.search,
        color: Colors.white,
      ),
      height: 50,
      handlePress: () => _handleSearch(context, ref),
    );
  }
}
