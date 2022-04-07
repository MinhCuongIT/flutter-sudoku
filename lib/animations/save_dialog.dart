import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../data/constants.dart';
import '../models/game_model.dart';
import '../providers/game_provider.dart';
import '../widgets/snackbar.dart';

void _onSave(BuildContext context, GameModel gameModel) async {
  final _prefs = await SharedPreferences.getInstance();

  _prefs.setInt(Constants.id, gameModel.id);
  _prefs.setInt(Constants.type, gameModel.type);
  _prefs.setString(Constants.difficulty, gameModel.difficulty);
  _prefs.setStringList(
      Constants.match, gameModel.match.map((e) => e.toString()).toList());
  _prefs.setStringList(
      Constants.mask, gameModel.mask.map((e) => e.toString()).toList());
  _prefs.setStringList(
      Constants.temp, gameModel.temp.map((e) => e.toString()).toList());
  showSnackbar(context, AppLocalizations.of(context)!.matchSaved.toUpperCase());
}

Future<AwesomeDialog> saveDialog(BuildContext context, WidgetRef ref) async {
  final _matchProvider = ref.read(gameProvider);

  return AwesomeDialog(
    context: context,
    aligment: Alignment.center,
    animType: AnimType.TOPSLIDE,
    borderSide: const BorderSide(color: Colors.greenAccent, width: 3),
    buttonsBorderRadius: const BorderRadius.all(Radius.circular(2)),
    customHeader: ScaleFade(
      child: FittedBox(
        fit: BoxFit.cover,
        alignment: Alignment.center,
        child: Padding(
          padding: const EdgeInsets.all(200),
          child: Icon(
            Icons.save_alt,
            size: MediaQuery.of(context).size.height,
            color: Colors.greenAccent,
          ),
        ),
      ),
    ),
    headerAnimationLoop: false,
    padding: const EdgeInsets.all(10),
    title: AppLocalizations.of(context)!.saveQuestion,
    showCloseIcon: false,
    dismissOnBackKeyPress: false,
    dismissOnTouchOutside: false,
    btnCancel: ElevatedButton(
      onPressed: () => Navigator.of(context).pop(),
      style: ElevatedButton.styleFrom(
        elevation: 0,
        primary: Colors.white,
        side: const BorderSide(width: 1, color: Colors.greenAccent),
      ),
      child: Text(
        AppLocalizations.of(context)!.no.toUpperCase(),
        style: const TextStyle(color: Colors.greenAccent),
      ),
    ),
    btnOk: ElevatedButton(
      onPressed: () {
        Navigator.of(context).pop();
        _onSave(context, _matchProvider);
      },
      style: ElevatedButton.styleFrom(
        elevation: 0,
        primary: Colors.greenAccent,
        side: const BorderSide(width: 1, color: Colors.greenAccent),
      ),
      child: Text(
        AppLocalizations.of(context)!.yes.toUpperCase(),
        style: const TextStyle(color: Colors.white),
      ),
    ),
  )..show();
}
