import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/constants.dart';
import '../../providers/game_provider.dart';

class GameInfoData extends ConsumerWidget {
  const GameInfoData({Key? key}) : super(key: key);

  ///Check settings provider difficulty value and return the icon
  Widget _difficultyIcon(BuildContext context, String value) {
    final Widget _result;

    if (Constants.easy == value) {
      _result = Constants.difficulties[Difficulty.easy.index][Constants.icon]
          as Widget;
    } else if (Constants.medium == value) {
      _result = Constants.difficulties[Difficulty.medium.index][Constants.icon]
          as Widget;
    } else if (Constants.hard == value) {
      _result = Constants.difficulties[Difficulty.hard.index][Constants.icon]
          as Widget;
    } else if (Constants.ultra == value) {
      _result = Constants.difficulties[Difficulty.ultra.index][Constants.icon]
          as Widget;
    } else {
      _result = const Icon(Icons.error_outline);
    }
    return Center(child: _result);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _matchProvider = ref.read(gameProvider);

    return Flexible(
      child: Flex(
        direction: Axis.horizontal,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          //Item
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Text(
              '${AppLocalizations.of(context)!.id.toUpperCase()}: ${_matchProvider.id}',
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ),

          //Item
          _difficultyIcon(context, _matchProvider.difficulty),
        ],
      ),
    );
  }
}
