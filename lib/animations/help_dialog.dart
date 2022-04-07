import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/help_provider.dart';

Future<AwesomeDialog> helpDialog(
    BuildContext context, WidgetRef ref, VoidCallback showAd) async {
  final _helpNotifier = ref.read(helpProvider.notifier);

  return AwesomeDialog(
    context: context,
    aligment: Alignment.center,
    animType: AnimType.TOPSLIDE,
    borderSide: const BorderSide(color: Colors.deepOrangeAccent, width: 3),
    buttonsBorderRadius: const BorderRadius.all(Radius.circular(2)),
    dialogType: DialogType.QUESTION,
    headerAnimationLoop: false,
    padding: const EdgeInsets.all(10),
    title: AppLocalizations.of(context)!.help,
    showCloseIcon: false,
    dismissOnBackKeyPress: false,
    dismissOnTouchOutside: false,
    btnCancel: ElevatedButton(
      onPressed: () => Navigator.of(context).pop(),
      style: ElevatedButton.styleFrom(
        elevation: 0,
        primary: Colors.white,
        side: const BorderSide(width: 1, color: Colors.deepOrangeAccent),
      ),
      child: Text(
        AppLocalizations.of(context)!.no.toUpperCase(),
        style: const TextStyle(color: Colors.deepOrangeAccent),
      ),
    ),
    btnOk: ElevatedButton(
      onPressed: () {
        // showAd();
        Navigator.of(context).pop();
        _helpNotifier.getHelp(ref);
      },
      style: ElevatedButton.styleFrom(
        elevation: 0,
        primary: Colors.deepOrangeAccent,
        side: const BorderSide(width: 1, color: Colors.deepOrangeAccent),
      ),
      child: Text(
        AppLocalizations.of(context)!.yes.toUpperCase(),
        style: const TextStyle(color: Colors.white),
      ),
    ),
  )..show();
}
