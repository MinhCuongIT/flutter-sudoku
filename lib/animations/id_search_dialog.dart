import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';

import '../widgets/start_screen/search_id_form/search_id_form.dart';

Future<AwesomeDialog> idSearchDialog(BuildContext context) async {
  return AwesomeDialog(
    context: context,
    aligment: Alignment.center,
    animType: AnimType.TOPSLIDE,
    borderSide: const BorderSide(color: Colors.blueGrey, width: 3),
    buttonsBorderRadius: const BorderRadius.all(Radius.circular(2)),
    dialogType: DialogType.NO_HEADER,
    padding: const EdgeInsets.all(10),
    body: const SearchIdForm(),
    showCloseIcon: true,
    dismissOnBackKeyPress: true,
    dismissOnTouchOutside: true,
  )..show();
}
