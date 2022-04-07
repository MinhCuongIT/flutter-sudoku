import 'dart:async';

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:page_transition/page_transition.dart';
import 'package:responsive_framework/responsive_framework.dart';

import './data/routes.dart';
import './data/theme.dart';
import './screens/start_screen.dart';
import './utils/error.dart';
import './utils/licences.dart';

void main() {
  runZonedGuarded(
    () {
      WidgetsFlutterBinding.ensureInitialized();
      //Init Ads
      MobileAds.instance.initialize();
      //Handler error
      errorHandler();
      //Add licenses
      addLicences();
      //Start app
      runApp(const App());
    },
    (Object error, StackTrace stack) {
      //Handler error
      errorHandler();
    },
  );
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Set app orientation
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    //Set status bar color
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark,
      ),
    );

    return ProviderScope(
      child: MaterialApp(
        //Debug banner
        debugShowCheckedModeBanner: false,
        //Multi language
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('en', ''),
          Locale('it', ''),
        ],
        //App primary color
        color: AppTheme.lightTheme.colorScheme.primary,
        //App name */
        title: AppLocalizations.of(context)?.appName ?? '',
        //Override error screen
        builder: (BuildContext context, Widget? widget) =>
            ResponsiveWrapper.builder(
          BouncingScrollWrapper.builder(context, widget!),
          maxWidth: 1200,
          minWidth: 450,
          defaultScale: true,
          breakpoints: [
            const ResponsiveBreakpoint.resize(450, name: MOBILE),
            const ResponsiveBreakpoint.autoScale(800, name: TABLET),
            const ResponsiveBreakpoint.autoScale(1000, name: TABLET),
            const ResponsiveBreakpoint.resize(1200, name: DESKTOP),
            const ResponsiveBreakpoint.autoScale(2460, name: "4K"),
          ],
        ),
        //App theme
        theme: AppTheme.lightTheme,
        //App home
        home: AnimatedSplashScreen(
          backgroundColor: Colors.white,
          duration: 5000,
          centered: true,
          splash: 'assets/images/sudoku3.gif',
          splashIconSize: double.infinity,
          nextScreen: const StartScreen(),
          splashTransition: SplashTransition.fadeTransition,
          pageTransitionType: PageTransitionType.rightToLeft,
        ),
        //Navigation
        onGenerateRoute: (settings) => generateRoute(settings),
        onUnknownRoute: (_) =>
            MaterialPageRoute(builder: (_) => const StartScreen()),
      ),
    );
  }
}
