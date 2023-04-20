// ignore_for_file: avoid_print

import 'dart:math';

import 'package:carrental/helper/ad_helper.dart';
import 'package:carrental/screens/pages/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdsProvider extends ChangeNotifier {
  BannerAd? _bannerAd;
  BannerAd? get bannerAd => _bannerAd;
  BannerAd? _bannerAd2;
  BannerAd? get bannerAd2 => _bannerAd2;

  RewardedAd? _rewardedAd;
  RewardedAd? get rewardedAd => _rewardedAd;

  InterstitialAd? _interstitialAd;
  InterstitialAd? get interstitialAd => _interstitialAd;

  void init(BuildContext context) async {
    print(12345);
    await _initGoogleMobileAds();
    _loadInterstitialAd(context);
    _setBannerAd();
    _setBannerAd2();
    await _loadRewardedAd();
  }

  Future<void> newAdsinit(BuildContext context) async {
    print(12345);
    await _initGoogleMobileAds();
    _loadInterstitialAd(context);
    _setBannerAd();
    _setBannerAd2();
    await _loadRewardedAd();
  }

  disposed() {
    _bannerAd?.dispose();
    _interstitialAd?.dispose();
    _rewardedAd?.dispose();
    _bannerAd2?.dispose();
  }

  String randString() {
    var rng = Random();
    int randomNumber =
        rng.nextInt(101); // generates a random integer between 0 and 100
    return "$randomNumber";
  }

  Future<InitializationStatus> _initGoogleMobileAds() {
    // Initialize Google Mobile Ads SDK
    // MobileAds.instance.updateRequestConfiguration(RequestConfiguration(testDeviceIds: ['85E1F07FB88E540BA7D716187870A116']));

    return MobileAds.instance.initialize();
  }

  Future<void> _loadRewardedAd() async {
    RewardedAd.load(
      adUnitId: AdHelper.rewardedAdUnitId,
      request: const AdRequest(),
      rewardedAdLoadCallback: RewardedAdLoadCallback(
        onAdLoaded: (ad) {
          ad.fullScreenContentCallback = FullScreenContentCallback(
            onAdDismissedFullScreenContent: (ad) {
              ad.dispose();
              _rewardedAd = null;
              notifyListeners();
            },
          );

          _rewardedAd = ad;
          notifyListeners();
        },
        onAdFailedToLoad: (err) {
          print('Failed to load a rewarded ad: ${err.message}');
          _loadRewardedAd();
        },
      ),
    );
  }

  Future<void> _setBannerAd() async {
    BannerAd(
      adUnitId: AdHelper.bannerAdUnitId,
      request: const AdRequest(),
      size: AdSize.banner,
      listener: BannerAdListener(
        onAdLoaded: (ad) {
          _bannerAd = ad as BannerAd;
          notifyListeners();
        },
        onAdFailedToLoad: (ad, err) {
          print('Failed to load a banner ad: ${err.message}');
          ad.dispose();
          _setBannerAd();
        },
      ),
    ).load();
    notifyListeners();
  }
  Future<void> _setBannerAd2() async {
    BannerAd(
      adUnitId: AdHelper.bannerAdUnitId,
      request: const AdRequest(),
      size: AdSize.banner,
      listener: BannerAdListener(
        onAdLoaded: (ad) {
          _bannerAd2 = ad as BannerAd;
          notifyListeners();
        },
        onAdFailedToLoad: (ad, err) {
          print('Failed to load a banner ad: ${err.message}');
          ad.dispose();
          _setBannerAd2();
        },
      ),
    ).load();
    notifyListeners();
  }

  void _loadInterstitialAd(BuildContext context) {
    InterstitialAd.load(
      adUnitId: AdHelper.interstitialAdUnitId,
      request: const AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (ad) {
          ad.fullScreenContentCallback = FullScreenContentCallback(
            onAdDismissedFullScreenContent: (ad) {
              moveToHome(context);
            },
          );

          _interstitialAd = ad;
          notifyListeners();
        },
        onAdFailedToLoad: (err) {
          print('Failed to load an interstitial ad: ${err.message}');
          _loadInterstitialAd(context);
        },
      ),
    );
    notifyListeners();
  }

  moveToHome(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const HomeScreen(),
      ),
    );
  }
}
