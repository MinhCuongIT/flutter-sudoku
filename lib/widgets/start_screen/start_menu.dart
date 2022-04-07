import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../widgets/about_dialog.dart';

class StartMenu extends StatelessWidget {
  const StartMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _primaryColor = Theme.of(context).colorScheme.primary;

    return PopupMenuButton(
      //Icon
      icon: Icon(
        Icons.more_vert,
        color: _primaryColor,
      ),
      itemBuilder: (_) => [
        //Item
        PopupMenuItem(
          child: ListTile(
            leading: Icon(
              Icons.info_outline,
              color: _primaryColor,
            ),
            title: Text(
              AppLocalizations.of(context)!.about,
              style: Theme.of(context).textTheme.button,
            ),
          ),
          onTap: () => Future.delayed(
            Duration.zero,
            () async => aboutDialog(context),
          ),
        ),
      ],
    );
  }
}
