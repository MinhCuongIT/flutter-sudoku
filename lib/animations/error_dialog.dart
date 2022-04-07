import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/game_provider.dart';

Future<AwesomeDialog> errorDialog(BuildContext context, WidgetRef ref) async {
  final _matchNotifier = ref.read(gameProvider.notifier);

  return AwesomeDialog(
    context: context,
    aligment: Alignment.center,
    animType: AnimType.TOPSLIDE,
    borderSide: const BorderSide(color: Colors.redAccent, width: 3),
    buttonsBorderRadius: const BorderRadius.all(Radius.circular(2)),
    dialogType: DialogType.ERROR,
    headerAnimationLoop: false,
    padding: const EdgeInsets.all(10),
    title: AppLocalizations.of(context)!.error,
    showCloseIcon: false,
    dismissOnBackKeyPress: false,
    dismissOnTouchOutside: false,
    btnCancelText: AppLocalizations.of(context)!.retry.toUpperCase(),
    btnCancelOnPress: () => _matchNotifier.undo(ref),
  )..show();
}
