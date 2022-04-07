import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import '../../animations/help_dialog.dart';
import '../../animations/no_help_dialog.dart';
import '../../providers/game_provider.dart';
import '../../utils/ad_helper.dart';

class HelpBtn extends ConsumerStatefulWidget {
  const HelpBtn({Key? key}) : super(key: key);

  @override
  _HelpBtnState createState() => _HelpBtnState();
}

class _HelpBtnState extends ConsumerState<HelpBtn> {
  InterstitialAd? _interstitialAd;

  bool _isInterstitialAdReady = false;

  ///Load Ad
  void _loadInterstitialAd() {
    InterstitialAd.load(
      adUnitId: AdHelper.interstitialHelpAdUnitId,
      request: const AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (ad) {
          _interstitialAd = ad;

          ad.fullScreenContentCallback = FullScreenContentCallback(
            onAdDismissedFullScreenContent: (ad) {},
          );

          _isInterstitialAdReady = true;
        },
        onAdFailedToLoad: (err) {
          _isInterstitialAdReady = false;
        },
      ),
    );
  }

  ///Show Ad
  void _showInterstitialAd() {
    if (_isInterstitialAdReady) {
      _interstitialAd?.show();
    } else {
      return;
    }
  }

  ///If there are more one one empty box on the grid show help dialog else show no help dialog
  void _showHelpDialog(Iterable<int> helpCount) {
    if (helpCount.length > 1) {
      _loadInterstitialAd();
      helpDialog(context, ref, _showInterstitialAd);
    } else {
      noHelpDialog(context);
    }
  }

  @override
  void dispose() {
    _interstitialAd?.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _matchProvider = ref.watch(gameProvider);
    final _helpCount = _matchProvider.temp.where((e) => e == 0);

    return GestureDetector(
      onTap: () => _showHelpDialog(_helpCount),
      child: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Icon(
          Icons.help_outline,
          color: Colors.white,
        ),
      ),
    );
  }
}
