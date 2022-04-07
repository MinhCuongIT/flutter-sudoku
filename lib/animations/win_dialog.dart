import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

Future<AwesomeDialog> winDialog(
    BuildContext context, VoidCallback loadAd, VoidCallback showAd) async {
  return AwesomeDialog(
    context: context,
    aligment: Alignment.center,
    animType: AnimType.TOPSLIDE,
    borderSide: const BorderSide(color: Colors.greenAccent, width: 3),
    buttonsBorderRadius: const BorderRadius.all(Radius.circular(2)),
    dialogType: DialogType.SUCCES,
    headerAnimationLoop: false,
    padding: const EdgeInsets.all(10),
    title: AppLocalizations.of(context)!.win.toUpperCase(),
    showCloseIcon: false,
    dismissOnBackKeyPress: false,
    dismissOnTouchOutside: false,
    btnOkText: AppLocalizations.of(context)!.newGame.toUpperCase(),
    btnOkOnPress: () {
      // showAd();
      Navigator.of(context).pop();
    },
  )..show();
}
