import 'dart:ui';

import 'package:carrental/constants.dart';
import 'package:carrental/fakedata.dart';
import 'package:carrental/helper/ads_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:provider/provider.dart';

import '../components/custom_painter.dart';

class CarDetailScreen extends StatelessWidget {
  const CarDetailScreen({Key? key, required this.car}) : super(key: key);
  final PopularCars car;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Constants.kBlackColor,
      extendBody: true,
      body: Consumer<AdsProvider>(builder: (context, ads, child) {
        // ads.newAdsinit(context);
        return SizedBox(
          width: width,
          height: height - 50,
          child: Stack(
            children: [
              Positioned(
                top: 250,
                left: width / 2 - 83,
                child: Container(
                  height: 166,
                  width: 166,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Constants.kBlueColor,
                    boxShadow: [
                      BoxShadow(
                        color: Constants.kBueColor,
                        offset: Offset(10, 10),
                        blurRadius: 90,
                        spreadRadius: 30,
                      ),
                    ],
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
                top: 200,
                left: width / 2 - 50,
                child: Container(
                  height: width / 2 - 50,
                  width: width / 2 - 50,
                  decoration:
                      const BoxDecoration(shape: BoxShape.circle, boxShadow: [
                    BoxShadow(
                        color: Constants.kBueColor,
                        offset: Offset(10, 10),
                        blurRadius: 70,
                        spreadRadius: 20)
                  ]),
                  child: Container(
                    height: 166,
                    width: 166,
                    color: Colors.transparent,
                  ),
                ),
              ),
              Positioned(
                top: 200,
                left: width / 2 - 50,
                child: Container(
                  height: width / 2 - 50,
                  width: width / 2 - 50,
                  decoration:
                      const BoxDecoration(shape: BoxShape.circle, boxShadow: [
                    BoxShadow(
                        color: Constants.kBueColor,
                        offset: Offset(10, 10),
                        blurRadius: 70,
                        spreadRadius: 20)
                  ]),
                  child: Container(
                    height: 166,
                    width: 166,
                    color: Colors.transparent,
                  ),
                ),
              ),
              Positioned(
                top: 200,
                left: width / 2 - 50,
                child: Container(
                  height: width / 2 - 50,
                  width: width / 2 - 50,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.contain,
                      alignment: Alignment.bottomLeft,
                      image: AssetImage('assets/img/${car.image}'),
                    ),
                    boxShadow: const [
                      BoxShadow(
                        color: Constants.kBueColor,
                        offset: Offset(10, 10),
                        blurRadius: 70,
                        spreadRadius: 20,
                      ),
                    ],
                  ),
                ),
              ),
              SafeArea(
                child: ListView(
                  children: [
                    ads.bannerAd != null
                        ? SizedBox(
                            width: ads.bannerAd!.size.width.toDouble(),
                            height: ads.bannerAd!.size.height.toDouble(),
                            child: Align(
                              alignment: Alignment.topCenter,
                              child: AdWidget(
                                key: Key(ads.randString()),
                                ad: ads.bannerAd!,
                              ),
                            ),
                          )
                        : const Text(
                            ".",
                            style: TextStyle(color: Colors.white),
                          ),
                    Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Row(
                        children: [
                          InkWell(
                            onTap: () => Navigator.pop(context),
                            child: Container(
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                    color: Constants.kBlueColor,
                                    blurRadius: 20,
                                    blurStyle: BlurStyle.outer,
                                  )
                                ],
                              ),
                              child: const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Icon(
                                  Icons.chevron_left,
                                  color: Constants.kGreyColor,
                                  // size: 15,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Car Detail".toUpperCase(),
                            style: const TextStyle(
                              color: Constants.kGreyColor,
                              fontSize: 24,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: height * 0.28,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: CustomOutline(
                        strokeWidth: 2,
                        radius: 20,
                        padding: const EdgeInsets.all(4),
                        width: width,
                        height: height * 0.5,
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Constants.kRedColor.withOpacity(0.01),
                            Constants.kRedColor.withOpacity(0),
                            Constants.kBlueColor.withOpacity(0.1),
                            Constants.kBlueColor.withOpacity(0.1)
                          ],
                          stops: const [0.2, 0.4, 0.6, 1],
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(20),
                            ),
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                Constants.kRedColor.withOpacity(0.1),
                                Constants.kRedColor.withOpacity(0.01),
                                Constants.kBlueColor.withOpacity(0.01),
                                Constants.kBlueColor.withOpacity(0.1),
                                Constants.kBlueColor
                              ],
                            ),
                          ),
                          child: Stack(
                            children: [
                              Positioned(
                                top: 15,
                                left: 10,
                                child: Text(
                                  car.transmission.toUpperCase(),
                                  style: const TextStyle(
                                    color: Constants.kGreyColor,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 50,
                                left: 10,
                                child: Text(
                                  car.name,
                                  style: const TextStyle(
                                    color: Constants.kWhiteColor,
                                    fontSize: 25,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                              Positioned(
                                top: height * 0.15,
                                left: 10,
                                child: Text(
                                  car.description!,
                                  maxLines: 5,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    color: Constants.kGreyColor,
                                  ),
                                ),
                              ),
                              Positioned(
                                top: height * 0.28,
                                left: 10,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    CustomGradient(
                                      width: width * 0.25,
                                      height: width * 0.21,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          const Icon(
                                            CupertinoIcons.person_2_fill,
                                            color: Constants.kBlueColor,
                                          ),
                                          GradientText(
                                            car.passengers!,
                                            style: const TextStyle(
                                              color: Constants.kGreyColor,
                                            ),
                                            gradient: LinearGradient(
                                              begin: Alignment.topLeft,
                                              end: Alignment.bottomRight,
                                              colors: [
                                                Constants.kRedColor,
                                                Constants.kGreyColor,
                                                Constants.kBlueColor
                                                    .withOpacity(0.1),
                                                Constants.kBlueColor
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    CustomGradient(
                                      width: width * 0.25,
                                      height: width * 0.21,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          const Icon(
                                            CupertinoIcons.car_detailed,
                                            color: Constants.kBlueColor,
                                          ),
                                          GradientText(
                                            car.transmission,
                                            style: const TextStyle(
                                              color: Constants.kGreyColor,
                                            ),
                                            gradient: LinearGradient(
                                              begin: Alignment.topLeft,
                                              end: Alignment.bottomRight,
                                              colors: [
                                                Constants.kRedColor,
                                                Constants.kGreyColor,
                                                Constants.kBlueColor
                                                    .withOpacity(0.1),
                                                Constants.kBlueColor
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    CustomGradient(
                                      width: width * 0.25,
                                      height: width * 0.21,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          const Icon(
                                            Icons.ac_unit,
                                            color: Constants.kBlueColor,
                                          ),
                                          GradientText(
                                            "AC",
                                            style: const TextStyle(
                                              color: Constants.kGreyColor,
                                            ),
                                            gradient: LinearGradient(
                                              begin: Alignment.topLeft,
                                              end: Alignment.bottomRight,
                                              colors: [
                                                Constants.kRedColor,
                                                Constants.kGreyColor,
                                                Constants.kBlueColor
                                                    .withOpacity(0.1),
                                                Constants.kBlueColor
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Positioned(
                                bottom: 15,
                                left: 15,
                                child: Text(
                                  car.price,
                                  style: const TextStyle(
                                    color: Constants.kGreyColor,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 0,
                                right: 0,
                                child: InkWell(
                                  onTap: () => {},
                                  child: Container(
                                    width: width * 0.4,
                                    padding: const EdgeInsets.all(8),
                                    decoration: const BoxDecoration(
                                      color: Constants.kRedColor,
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(20),
                                        bottomRight: Radius.circular(20),
                                      ),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: const [
                                        Text(
                                          "Book Now",
                                          style: TextStyle(
                                            color: Constants.kWhiteColor,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                        Icon(
                                          CupertinoIcons.car_detailed,
                                          color: Constants.kWhiteColor,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}

// a sub is ok for the channel
// Source code link :  https://github.com/kahdichienja/carrentalui.git