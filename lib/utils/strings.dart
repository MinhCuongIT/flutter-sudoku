import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../data/constants.dart';

///Get text from constants value (delete # symbol)
String getText(BuildContext context, String value) {
  String _result;
  switch (value) {
    case Constants.number:
      _result = AppLocalizations.of(context)!.numbers;
      break;
    case Constants.color:
      _result = AppLocalizations.of(context)!.colors;
      break;
    case Constants.image:
      _result = AppLocalizations.of(context)!.images;
      break;
    case Constants.easy:
      _result = AppLocalizations.of(context)!.easy;
      break;
    case Constants.medium:
      _result = AppLocalizations.of(context)!.medium;
      break;
    case Constants.hard:
      _result = AppLocalizations.of(context)!.hard;
      break;
    case Constants.ultra:
      _result = AppLocalizations.of(context)!.ultra;
      break;
    default:
      _result = '';
  }

  return _result;
}
