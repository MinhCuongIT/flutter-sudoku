import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:package_info_plus/package_info_plus.dart';

void aboutDialog(BuildContext context) async {
  PackageInfo packageInfo = await PackageInfo.fromPlatform();

  return showAboutDialog(
    context: context,
    applicationName: AppLocalizations.of(context)!.appName,
    applicationVersion: packageInfo.version,
  );
}
