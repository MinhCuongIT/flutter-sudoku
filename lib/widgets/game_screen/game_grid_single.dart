import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import '../../data/constants.dart';
import '../../models/game_model.dart';
import '../../models/settings_model.dart';
import '../../providers/help_provider.dart';
import '../../providers/game_provider.dart';
import '../../providers/settings_provider.dart';

class GameGridSingle extends ConsumerWidget {
  final int index;

  const GameGridSingle({Key? key, required this.index}) : super(key: key);

  ///Count the grid index and add background color for build the grid
  Color _getBackgroundColor(int index) {
    const _background1 = Color(0xfffafafa);
    const _background2 = Color(0xfff2f3f4);
    Colors.grey;
    final _blocks = [
      1, 2, 3, 4, 5, 6, 7, 8, 9, //
      1, 2, 3, 4, 5, 6, 7, 8, 9, //
      1, 2, 3, 4, 5, 6, 7, 8, 9, //
      1, 2, 3, 4, 5, 6, 7, 8, 9, //
      1, 2, 3, 4, 5, 6, 7, 8, 9, //
      1, 2, 3, 4, 5, 6, 7, 8, 9, //
      1, 2, 3, 4, 5, 6, 7, 8, 9, //
      1, 2, 3, 4, 5, 6, 7, 8, 9, //
      1, 2, 3, 4, 5, 6, 7, 8, 9,
    ];
    if (_blocks[index] == 4 || _blocks[index] == 5 || _blocks[index] == 6) {
      if (index < 27 || index > 54) {
        return _background2;
      }
    } else {
      if (index > 26 && index < 54) {
        return _background2;
      }
    }
    return _background1;
  }

  Widget _buildIcon(IconData icon, double size, Color color) {
    return Center(
      child: FittedBox(
        fit: BoxFit.contain,
        child: Icon(
          icon,
          color: color,
          size: size,
        ),
      ),
    );
  }

  ///Check the settings provider and return the content of the grid box
  Widget _getTypeGrid(int value, SettingsModel settings, Color color,
      GameModel match, int index) {
    Widget _result;

    if (value == 0) {
      _result = const Text('');
    } else if (settings.type == Type.number.index) {
      _result = Text(
        value == 0 ? '' : value.toString(),
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 24, color: color),
      );
    } else if (settings.type == Type.color.index) {
      final _data = Constants.colors[value - 1];
      _result = match.mask[index] == 0
          ? Icon(
              _data[Constants.icon] as IconData,
              color: _data[Constants.color] as Color,
              size: 28,
            )
          : Stack(
              children: [
                _buildIcon(_data[Constants.icon] as IconData, 28, Colors.black),
                _buildIcon(_data[Constants.icon] as IconData, 24,
                    _data[Constants.color] as Color),
              ],
            );
    } else if (settings.type == Type.image.index) {
      final _data = Constants.images[value - 1];
      _result = match.mask[index] == 0
          ? Icon(
              _data[Constants.icon] as IconData,
              color: _data[Constants.color] as Color,
              size: 28,
            )
          : Stack(
              children: [
                _buildIcon(_data[Constants.icon] as IconData, 28, Colors.black),
                _buildIcon(_data[Constants.icon] as IconData, 24,
                    _data[Constants.color] as Color),
              ],
            );
    } else {
      _result = const Icon(Icons.error);
    }
    return _result;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _helpNotifier = ref.read(helpProvider.notifier);
    final _gameNotifier = ref.watch(gameProvider.notifier);
    final _gameProvider = ref.watch(gameProvider);
    final _settingsState = ref.read(settingsProvider);
    const _selectedColor = Colors.blueAccent;

    return GestureDetector(
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            width: 3,
            color: index == _gameProvider.index
                ? _selectedColor
                : Colors.transparent,
          ),
          color: _getBackgroundColor(index),
        ),
        child: Center(
          child: AnimationConfiguration.staggeredGrid(
            position: index,
            duration: const Duration(milliseconds: 300),
            columnCount: 81,
            child: ScaleAnimation(
              child: FadeInAnimation(
                child: _getTypeGrid(
                    _gameProvider.temp[index],
                    _settingsState,
                    _gameProvider.mask[index] == 0
                        ? _selectedColor
                        : Theme.of(context).colorScheme.secondary,
                    _gameProvider,
                    index),
              ),
            ),
          ),
        ),
      ),
      onTap: () {
        _helpNotifier.reset();
        _gameProvider.mask[index] == 0 ? _gameNotifier.setIndex(index) : null;
      },
    );
  }
}
