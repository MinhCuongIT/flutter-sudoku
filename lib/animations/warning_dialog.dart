import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

Future<bool> warningDialog(BuildContext context) async {
  late bool _result;

  AwesomeDialog dlg = AwesomeDialog(
    context: context,
    aligment: Alignment.center,
    animType: AnimType.TOPSLIDE,
    borderSide: const BorderSide(color: Colors.redAccent, width: 3),
    buttonsBorderRadius: const BorderRadius.all(Radius.circular(2)),
    customHeader: ScaleFade(
      child: FittedBox(
        fit: BoxFit.cover,
        alignment: Alignment.center,
        child: Icon(
          Icons.remove_circle,
          size: MediaQuery.of(context).size.height,
          color: Colors.redAccent,
        ),
      ),
    ),
    headerAnimationLoop: false,
    padding: const EdgeInsets.all(10),
    title: AppLocalizations.of(context)!.abandonMatch,
    showCloseIcon: false,
    dismissOnBackKeyPress: false,
    dismissOnTouchOutside: false,
    btnCancel: ElevatedButton(
      onPressed: () {
        Navigator.of(context).pop();
        _result = false;
      },
      style: ElevatedButton.styleFrom(
        elevation: 0,
        primary: Colors.white,
        side: const BorderSide(width: 1, color: Colors.redAccent),
      ),
      child: Text(
        AppLocalizations.of(context)!.no.toUpperCase(),
        style: const TextStyle(color: Colors.redAccent),
      ),
    ),
    btnOk: ElevatedButton(
      onPressed: () {
        _result = true;
        Navigator.of(context).pop();
        Navigator.pop(context);
      },
      style: ElevatedButton.styleFrom(
        elevation: 0,
        primary: Colors.redAccent,
        side: const BorderSide(width: 1, color: Colors.redAccent),
      ),
      child: Text(
        AppLocalizations.of(context)!.yes.toUpperCase(),
        style: const TextStyle(color: Colors.white),
      ),
    ),
  );

  await dlg.show();

  return _result;
}
