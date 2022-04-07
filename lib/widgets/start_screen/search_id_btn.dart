import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../animations/id_search_dialog.dart';
import '../../utils/providers.dart';
import '../full_width_btn.dart';

class SearchIdBtn extends ConsumerWidget {
  final double height;

  const SearchIdBtn({Key? key, required this.height}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FullWidthBtn(
        text: AppLocalizations.of(context)!.searchById.toUpperCase(),
        color: Theme.of(context).colorScheme.primary,
        backgroundColor: Colors.white,
        icon: const Icon(Icons.search),
        height: height,
        handlePress: () {
          //Reset providers
          resetAll(ref);
          //Show search dialog
          idSearchDialog(context);
        });
  }
}
