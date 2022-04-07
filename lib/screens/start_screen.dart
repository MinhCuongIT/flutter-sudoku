import 'package:flutter/material.dart';
import 'package:slide_drawer/slide_drawer.dart';

import '../widgets/start_screen/drawer_new/drawer_new_game.dart';
import '../widgets/start_screen/start_app_bar.dart';
import '../widgets/start_screen/start_body.dart';

class StartScreen extends StatelessWidget {
  static const route = '/start';

  const StartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SlideDrawer(
      offsetFromRight: MediaQuery.of(context).size.width * 0.3,
      curve: Curves.easeInOut,
      duration: const Duration(milliseconds: 500),
      drawer: const DrawerNew(),
      child: const SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(kToolbarHeight),
            child: StartAppBar(),
          ),
          body: StartBody(),
        ),
      ),
    );
  }
}
