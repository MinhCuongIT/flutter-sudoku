import 'package:flutter/material.dart';

ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showSnackbar(
    BuildContext context, String text) {
  final _primaryColor = Theme.of(context).colorScheme.primary;

  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: _primaryColor,
      content: Text(
        text,
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.overline,
      ),
      duration: const Duration(milliseconds: 2000),
      behavior: SnackBarBehavior.floating,
    ),
  );
}
