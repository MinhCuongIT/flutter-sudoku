import 'package:flutter/material.dart';

import '../animations/warning_dialog.dart';
import '../widgets/game_screen/game_app_bar.dart';
import '../widgets/game_screen/game_body.dart';

class GameScreen extends StatelessWidget {
  static const route = '/match';

  const GameScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => warningDialog(context),
      child: const SafeArea(
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(kToolbarHeight),
            child: GameAppBar(),
          ),
          body: GameBody(),
        ),
      ),
    );
  }
}
