import 'package:flutter/material.dart';

import './load_game_btn.dart';
import './new_game_btn.dart';
import './search_id_btn.dart';

class StartBody extends StatelessWidget {
  const StartBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (_, constraints) => Center(
        child: SingleChildScrollView(
          child: Flex(
            direction: Axis.vertical,
            children: [
              //New game
              NewGameBtn(height: constraints.maxHeight * 0.1),

              //Spacer
              SizedBox(height: constraints.maxHeight * 0.1),

              //Load game
              LoadGameBtn(height: constraints.maxHeight * 0.1),

              //Spacer
              SizedBox(height: constraints.maxHeight * 0.1),

              //Search by id
              SearchIdBtn(height: constraints.maxHeight * 0.1),
            ],
          ),
        ),
      ),
    );
  }
}
