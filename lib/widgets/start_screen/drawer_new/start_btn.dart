import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:slide_drawer/slide_drawer.dart';

import '../../../models/settings_model.dart';
import '../../../providers/game_provider.dart';
import '../../../providers/settings_provider.dart';
import '../../../screens/game_screen.dart';
import '../../full_width_btn.dart';

class StartBtn extends ConsumerWidget {
  final double height;

  const StartBtn({Key? key, required this.height}) : super(key: key);

  void _handleStart(
      BuildContext context, WidgetRef ref, SettingsModel options) {
    final _matchNotifier = ref.read(gameProvider.notifier);

    //Set new match
    _matchNotifier.setNewMatch(options);
    //Close drawer
    SlideDrawer.of(context)?.close();
    //Navigate to match screen
    Navigator.of(context).pushNamed(GameScreen.route);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _settingsNotifier = ref.read(settingsProvider.notifier);
    final _settingsProvider = ref.watch(settingsProvider);

    return Visibility(
      visible: _settingsNotifier.isValid(),
      child: FullWidthBtn(
        text: AppLocalizations.of(context)!.start.toUpperCase(),
        color: Colors.white,
        backgroundColor: Theme.of(context).colorScheme.primary,
        height: height,
        handlePress: () => _handleStart(context, ref, _settingsProvider),
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
      ),
    );
  }
}
