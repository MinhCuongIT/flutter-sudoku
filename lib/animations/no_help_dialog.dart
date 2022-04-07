import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

Future<AwesomeDialog> noHelpDialog(BuildContext context) async {
  return AwesomeDialog(
    context: context,
    aligment: Alignment.center,
    animType: AnimType.TOPSLIDE,
    borderSide: const BorderSide(color: Colors.deepOrangeAccent, width: 3),
    buttonsBorderRadius: const BorderRadius.all(Radius.circular(2)),
    dialogType: DialogType.QUESTION,
    headerAnimationLoop: false,
    padding: const EdgeInsets.all(10),
    body: Wrap(
      direction: Axis.vertical,
      children: [
        Text(
          AppLocalizations.of(context)!.noHelp1,
          style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
        ),
        Text(
          AppLocalizations.of(context)!.noHelp2,
          style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
        ),
      ],
    ),
    showCloseIcon: false,
    dismissOnBackKeyPress: false,
    dismissOnTouchOutside: false,
    btnCancel: ElevatedButton(
      onPressed: () => Navigator.of(context).pop(),
      style: ElevatedButton.styleFrom(
        elevation: 0,
        primary: Colors.deepOrangeAccent,
        side: const BorderSide(width: 1, color: Colors.deepOrangeAccent),
      ),
      child: Text(
        AppLocalizations.of(context)!.back.toUpperCase(),
        style: const TextStyle(color: Colors.white),
      ),
    ),
  )..show();
}
