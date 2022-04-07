import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../data/constants.dart';
import '../../providers/game_provider.dart';
import '../../providers/settings_provider.dart';
import '../../utils/providers.dart';
import '../full_width_btn.dart';
import '../snackbar.dart';

class LoadGameBtn extends ConsumerWidget {
  final double height;

  const LoadGameBtn({Key? key, required this.height}) : super(key: key);

  void _handlePress(BuildContext context, WidgetRef ref) async {
    final _prefs = await SharedPreferences.getInstance();
    final _optionsNotifier = ref.read(settingsProvider.notifier);
    final _matchNotifier = ref.read(gameProvider.notifier);

    //Reset providers
    resetAll(ref);
    //If no game saved show snackbar else load game
    _prefs.getInt(Constants.id) != null
        ? _matchNotifier.load(context, _prefs, _optionsNotifier)
        : showSnackbar(
            context, AppLocalizations.of(context)!.noMatchSaved.toUpperCase());
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FullWidthBtn(
      text: AppLocalizations.of(context)!.continue_.toUpperCase(),
      color: Colors.black,
      backgroundColor: Colors.white,
      height: height,
      handlePress: () => _handlePress(context, ref),
    );
  }
}
