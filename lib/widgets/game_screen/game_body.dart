import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/loader_provider.dart';
import './loader.dart';
import './game_info.dart';
import './game_grid.dart';
import './game_options.dart';

class GameBody extends ConsumerWidget {
  const GameBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _loaderProvider = ref.watch(loaderProvider);

    return Center(
      child: _loaderProvider
          ? const Loader()
          : SingleChildScrollView(
              primary: false,
              padding: const EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  GameInfo(),
                  GameGrid(),
                  GameOptions(),
                ],
              ),
            ),
    );
  }
}
