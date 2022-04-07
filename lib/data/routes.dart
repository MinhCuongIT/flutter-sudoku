import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import '../screens/game_screen.dart';
import '../screens/start_screen.dart';

Route<dynamic>? generateRoute(RouteSettings settings) {
  switch (settings.name as String) {
    case StartScreen.route:
      return MaterialPageRoute(
        builder: (_) => const StartScreen(),
      );
    case GameScreen.route:
      return PageTransition(
        child: const GameScreen(),
        type: PageTransitionType.rightToLeft,
      );
    default:
      return null;
  }
}
