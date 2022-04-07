import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/game_provider.dart';

class GameInfoCounter extends ConsumerWidget {
  const GameInfoCounter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _matchProvider = ref.watch(gameProvider);

    return Flexible(
      child: Text(
        '${AppLocalizations.of(context)!.remains}: ${_matchProvider.temp.where((e) => e == 0).toList().length}',
        style: Theme.of(context).textTheme.bodyText1,
      ),
    );
  }
}
