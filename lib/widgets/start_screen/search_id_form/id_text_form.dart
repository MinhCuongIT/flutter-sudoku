import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../data/constants.dart';
import '../../../data/difficulty_easy.dart';
import '../../../data/difficulty_hard.dart';
import '../../../data/difficulty_medium.dart';
import '../../../data/difficulty_ultra.dart';
import '../../../providers/settings_provider.dart';
import '../../../providers/search_provider.dart';
import '../../full_width_container.dart';

class IdTextForm extends ConsumerWidget {
  const IdTextForm({Key? key}) : super(key: key);

  void _handleIdChange(WidgetRef ref, String value) {
    final _searchProvider = ref.read(searchProvider.notifier);

    //If value is not empty set the search provider
    value.isEmpty ? null : _searchProvider.setSearch(int.parse(value));
  }

  String? _validate(BuildContext context, WidgetRef ref, String? value) {
    final _optionsNotifier = ref.read(settingsProvider.notifier);
    final _matchList = [
      ...DifficultyEasy.easy,
      ...DifficultyMedium.medium,
      ...DifficultyHard.hard,
      ...DifficultyUltra.ultra,
    ];
    List<int> _idList = [];

    //Create a list of all games
    for (var list in _matchList) {
      _idList.add(list[Constants.id] as int);
    }
    //Error message handler
    if (value!.isEmpty) {
      return AppLocalizations.of(context)!.insertId;
    } else if (value.length != 3 || !_idList.contains(int.parse(value))) {
      return AppLocalizations.of(context)!.insertValidId;
    } else if (_optionsNotifier.options.type == _optionsNotifier.defValue) {
      return AppLocalizations.of(context)!.chooseType;
    }
    return null;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FullWidhtContainer(
      verticalMargin: 30,
      horizzontalPadding: 10,
      child: TextFormField(
        onChanged: (value) => _handleIdChange(ref, value),
        validator: (value) => _validate(context, ref, value),
        keyboardType: TextInputType.number,
        inputFormatters: [
          //Only numbers
          FilteringTextInputFormatter.digitsOnly,
          //Max number limit
          LengthLimitingTextInputFormatter(3),
        ],
        decoration: InputDecoration(
          border: const UnderlineInputBorder(),
          helperText: AppLocalizations.of(context)!.matchId,
          helperStyle: const TextStyle(fontSize: 20),
        ),
        style: Theme.of(context).textTheme.caption,
      ),
    );
  }
}
