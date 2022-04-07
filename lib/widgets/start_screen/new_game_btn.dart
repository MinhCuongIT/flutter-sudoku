import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:slide_drawer/slide_drawer.dart';

import '../../utils/providers.dart';
import '../full_width_btn.dart';

class NewGameBtn extends ConsumerWidget {
  final double height;

  const NewGameBtn({Key? key, required this.height}) : super(key: key);

  void _handlePress(BuildContext context, WidgetRef ref) {
    //Reset providers
    resetAll(ref);
    //Open drawer
    SlideDrawer.of(context)?.toggle();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FullWidthBtn(
      text: AppLocalizations.of(context)!.newGame.toUpperCase(),
      color: Colors.white,
      backgroundColor: Theme.of(context).colorScheme.primary,
      height: height,
      handlePress: () => _handlePress(context, ref),
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
    );
  }
}
