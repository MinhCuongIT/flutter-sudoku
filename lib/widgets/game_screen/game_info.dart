import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import './game_info_counter.dart';
import './game_info_data.dart';
import '../../models/game_model.dart';
import '../../providers/game_provider.dart';
import '../../utils/ad_helper.dart';

class GameInfo extends ConsumerStatefulWidget {
  const GameInfo({Key? key}) : super(key: key);

  @override
  _MatchInfoState createState() => _MatchInfoState();
}

class _MatchInfoState extends ConsumerState<GameInfo> {
  InterstitialAd? _interstitialAd;

  bool _isInterstitialAdReady = false;

  ///Load ad
  void _loadInterstitialAd() {
    InterstitialAd.load(
      adUnitId: AdHelper.interstitialWinAdUnitId,
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
      // _interstitialAd?.show();
    } else {
      return;
    }
  }

  @override
  void dispose() {
    _interstitialAd?.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _matchNotifier = ref.read(gameProvider.notifier);

    ref.listen<GameModel>(gameProvider, (prev, next) {
      //Check victory when grid is full
      _matchNotifier.check(
          context, ref, _loadInterstitialAd, _showInterstitialAd);
    });

    return Flex(
      direction: Axis.horizontal,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: const [
        //Remaining counter
        GameInfoCounter(),

        //Match id + difficulty icon
        GameInfoData(),
      ],
    );
  }
}
