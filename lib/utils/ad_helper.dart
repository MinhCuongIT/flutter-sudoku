import 'dart:io';

class AdHelper {
  ///Help Ad
  static String get interstitialHelpAdUnitId {
    //Ad id
    const adUnitId = 'ca-app-pub-3940256099942544/1033173712';

    if (Platform.isAndroid) {
      return adUnitId;
    } else if (Platform.isIOS) {
      throw UnsupportedError('Unsupported platform');
    } else {
      throw UnsupportedError('Unsupported platform');
    }
  }

  ///Win Ad
  static String get interstitialWinAdUnitId {
    //Ad id
    const adUnitId = 'ca-app-pub-3940256099942544/1033173712';

    if (Platform.isAndroid) {
      return adUnitId;
    } else if (Platform.isIOS) {
      throw UnsupportedError('Unsupported platform');
    } else {
      throw UnsupportedError('Unsupported platform');
    }
  }
}
