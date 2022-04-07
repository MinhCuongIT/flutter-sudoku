import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'start_menu.dart';

class StartAppBar extends StatelessWidget {
  const StartAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      title: Text(
        AppLocalizations.of(context)!.appName,
        style: Theme.of(context).textTheme.headline1,
      ),
      actions: const [
        StartMenu(),
      ],
    );
  }
}
