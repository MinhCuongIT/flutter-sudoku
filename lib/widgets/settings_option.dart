import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/constants.dart';
import '../providers/settings_provider.dart';
import '../utils/strings.dart';

class SettingsOption extends ConsumerWidget {
  final MapEntry<int, Map<String, Object>> data;
  final Widget icon;
  final int index;
  final String option;
  final AlignmentGeometry alignment;

  const SettingsOption({
    Key? key,
    required this.data,
    required this.icon,
    required this.index,
    required this.option,
    required this.alignment,
  }) : super(key: key);

  void _handleTap(BuildContext context, WidgetRef ref) {
    final _optionsNotifier = ref.read(settingsProvider.notifier);

    //Set settings provider
    option == Constants.type
        ? _optionsNotifier.setType(data.key)
        : _optionsNotifier.setDifficulty(data.key);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _optionsProvider = ref.watch(settingsProvider);
    final _selected = option == Constants.type
        ? _optionsProvider.type
        : _optionsProvider.difficulty;

    return GestureDetector(
      onTap: () => _handleTap(context, ref),
      child: ListTile(
        leading: icon,
        title: Align(
          alignment: alignment,
          child: Text(
            getText(
              context,
              data.value[option == Constants.type
                  ? Constants.type
                  : Constants.difficulty] as String,
            ),
            style: TextStyle(
                color: _selected == index
                    ? Theme.of(context).colorScheme.primary
                    : Colors.grey.shade400,
                fontSize: 20,
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
