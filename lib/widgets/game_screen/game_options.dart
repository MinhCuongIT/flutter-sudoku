import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/constants.dart';
import '../../models/settings_model.dart';
import '../../providers/game_provider.dart';
import '../../providers/settings_provider.dart';

class GameOptions extends ConsumerWidget {
  const GameOptions({Key? key}) : super(key: key);

  ///Check the settings provider type and return the type to display (number, color, image)
  Widget _getTypeOptions(int value, SettingsModel options, Color color) {
    Widget _result;

    if (options.type == Type.number.index) {
      _result = Text(
        value.toString(),
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 24, color: color),
      );
    } else if (options.type == Type.color.index) {
      final _data = Constants.colors[value - 1];
      _result = Icon(
        _data[Constants.icon] as IconData,
        color: _data[Constants.color] as Color,
        size: 34,
      );
    } else if (options.type == Type.image.index) {
      final _data = Constants.images[value - 1];
      _result = Icon(
        _data[Constants.icon] as IconData,
        color: _data[Constants.color] as Color,
        size: 34,
      );
    } else {
      _result = const Icon(Icons.error);
    }
    return FittedBox(
      fit: BoxFit.contain,
      child: _result,
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _settingsProvider = ref.read(settingsProvider);
    final _gameNotifier = ref.read(gameProvider.notifier);
    final _gameProvider = ref.watch(gameProvider);
    final _options = [1, 2, 3, 4, 5, 6, 7, 8, 9, 0];
    final _primaryColor = Theme.of(context).colorScheme.primary;

    return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        border: Border.all(
          width: 2,
          color: _primaryColor,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: GridView.count(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        crossAxisCount: 5,
        mainAxisSpacing: 20,
        crossAxisSpacing: 10,
        padding: const EdgeInsets.all(10),
        childAspectRatio: 2,
        children: _options.map(
          (input) {
            return FittedBox(
              fit: BoxFit.cover,
              child: ElevatedButton(
                style: ButtonStyle(
                  padding: MaterialStateProperty.all(const EdgeInsets.all(5)),
                  elevation: MaterialStateProperty.all<double>(0),
                  backgroundColor: MaterialStateProperty.all(Colors.white),
                  side: MaterialStateProperty.all(
                      BorderSide(width: 2, color: _primaryColor)),
                  shape: MaterialStateProperty.all(
                    const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                  ),
                ),
                child: input == 0
                    ? FittedBox(
                        fit: BoxFit.contain,
                        child: Icon(
                          Icons.delete,
                          color: _settingsProvider.type == Type.number.index
                              ? _primaryColor
                              : Theme.of(context).colorScheme.secondary,
                          size: 34,
                        ),
                      )
                    : _getTypeOptions(input, _settingsProvider, _primaryColor),
                onPressed: () => _gameProvider.index.isNegative
                    ? null
                    : _gameNotifier.update(input, ref),
              ),
            );
          },
        ).toList(),
      ),
    );
  }
}
