import 'dart:ui';

import 'package:carrental/constants.dart';
import 'package:carrental/helper/ads_provider.dart';
import 'package:carrental/screens/components/custom_painter.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final PageController _pageController = PageController();
  late List<Widget> _screens;

  @override
  void initState() {
    // final ads = Provider.of<AdsProvider>(context, listen: false);
    super.initState();

    _screens = [
      const OnBoarding(
        image: "car_1.png",
        text: "Simply the best",
        current: 0,
        isLastPage: false,
      ),
      const OnBoarding(
        image: "car_2.png",
        text: "Affordable car for rental",
        current: 1,
        isLastPage: false,
      ),
      const OnBoarding(
        image: "car_4.png",
        text: "Affordable car for rental",
        current: 2,
        isLastPage: true,
      ),
    ];

    // WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
    //   Future.delayed(const Duration(seconds: 30), () {
    //     if (ads.interstitialAd != null) {
    //       ads.interstitialAd?.show();
    //       ads.newAdsinit(context);
    //     }
    //   });
    // });
  }

  void _setPage(int pageIndex) {
    setState(() {
      _pageController.jumpToPage(pageIndex);
    });
  }

  @override
  void dispose() {
    final adsProvider = Provider.of<AdsProvider>(context, listen: false);

    adsProvider.disposed();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.kBlackColor,
      extendBody: true,
      body: PageView.builder(
        controller: _pageController,
        itemCount: _screens.length,
        physics: const BouncingScrollPhysics(),
        onPageChanged: (index) {
          _setPage(index);
        },
        itemBuilder: (context, index) {
          return _screens[index];
        },
      ),
    );
  }
}

class OnBoarding extends StatelessWidget {
  const OnBoarding({
    Key? key,
    required this.image,
    required this.text,
    required this.current,
    required this.isLastPage,
  }) : super(key: key);
  final String image;
  final String text;
  final bool isLastPage;
  final int current;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Consumer<AdsProvider>(builder: (context, ads, child) {
      return SizedBox(
        height: height,
        width: width,
        child: Stack(
          children: [
            Positioned(
              top: height * 0.1,
              left: -88,
              child: Container(
                height: 166,
                width: 166,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Constants.kRedColor,
                ),
                child: BackdropFilter(
                  filter: ImageFilter.blur(
                    sigmaX: 200,
                    sigmaY: 200,
                  ),
                  child: Container(
                    height: 166,
                    width: 166,
                    color: Colors.transparent,
                  ),
                ),
              ),
            ),
            Positioned(
              top: height * 0.3,
              right: -100,
              child: Container(
                height: 200,
                width: 200,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Constants.kBlueColor,
                ),
                child: BackdropFilter(
                  filter: ImageFilter.blur(
                    sigmaX: 200,
                    sigmaY: 200,
                  ),
                  child: Container(
                    height: 200,
                    width: 200,
                    color: Colors.transparent,
                  ),
                ),
              ),
            ),
            SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: height * 0.1,
                  ),
                  CustomOutline(
                    strokeWidth: 4,
                    radius: width * 0.8,
                    padding: const EdgeInsets.all(4),
                    width: width * 0.8,
                    height: width * 0.8,
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Constants.kRedColor,
                        Constants.kRedColor.withOpacity(0),
                        Constants.kBlueColor.withOpacity(0.1),
                        Constants.kBlueColor
                      ],
                      stops: const [0.2, 0.4, 0.6, 1],
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          alignment: Alignment.bottomLeft,
                          image: AssetImage('assets/img/$image'),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: height * 0.09,
                  ),
                  Text(
                    'Quality\nCar For Renting',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Constants.kWhiteColor.withOpacity(0.85),
                      fontSize: height <= 667 ? 18 : 34,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(
                    height: height * 0.05,
                  ),
                  Text(
                    text,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Constants.kWhiteColor.withOpacity(0.75),
                      fontSize: height <= 667 ? 12 : 16,
                    ),
                  ),
                  if (isLastPage)
                    SizedBox(
                      height: height * 0.03,
                    ),
                  if (isLastPage)
                    CustomOutline(
                      strokeWidth: 3,
                      radius: 20,
                      padding: const EdgeInsets.all(3),
                      width: 160,
                      height: 38,
                      gradient: const LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [Constants.kRedColor, Constants.kBlueColor],
                      ),
                      child: InkWell(
                        onTap: () {
                          // if (ads.interstitialAd != null) {
                          //   ads.interstitialAd?.show();
                          // } else {
                          //   ads.moveToHome(context);
                          // }
                          // Future.delayed(const Duration(seconds: 5), () {
                          ads.moveToHome(context);
                          // });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                Constants.kRedColor.withOpacity(0.5),
                                Constants.kBlueColor.withOpacity(0.5)
                              ],
                            ),
                          ),
                          child: const Center(
                            child: Text(
                              'Get Started',
                              style: TextStyle(
                                fontSize: 14,
                                color: Constants.kWhiteColor,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  SizedBox(
                    height: height * 0.01,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      3,
                      (index) {
                        return Container(
                          height: 7,
                          width: 7,
                          margin: const EdgeInsets.symmetric(horizontal: 4),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: index == current
                                ? Constants.kBlueColor
                                : Constants.kWhiteColor.withOpacity(0.2),
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: height * 0.01,
                  ),
                ],
              ),
            ),
          ],
        ),
      );
      ;
    });
  }
}
