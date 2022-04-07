import 'package:flutter/material.dart';

import 'game_grid_single.dart';

class GameGrid extends StatelessWidget {
  const GameGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 9,
          crossAxisSpacing: 2,
          mainAxisSpacing: 2,
        ),
        itemCount: 81,
        itemBuilder: (_, index) => GameGridSingle(index: index),
      ),
    );
  }
}
