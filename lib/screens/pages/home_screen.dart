import 'dart:ui';

import 'package:carrental/constants.dart';
import 'package:carrental/fakedata.dart';
import 'package:carrental/screens/components/custom_painter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Constants.kBlackColor,
      extendBody: true,
      body: SizedBox(
        width: width,
        height: height,
        child: Stack(
          children: [
            Positioned(
              top: 0,
              left: -100,
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
              bottom: height * 0.3,
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
            Positioned(
              bottom: 0,
              left: -100,
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
              child: ListView(
                shrinkWrap: true,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Spacer(),
                        Text(
                          "Select Car".toUpperCase(),
                          style: const TextStyle(
                            color: Constants.kGreyColor,
                            fontSize: 24,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const Spacer(),
                        Container(
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                  color: Constants.kBlueColor,
                                  blurRadius: 20,
                                  blurStyle: BlurStyle.outer)
                            ],
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Icon(
                              Icons.person,
                              color: Constants.kGreyColor,
                              size: 15,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          "Most Popular Cars",
                          style: TextStyle(
                            color: Constants.kGreyColor,
                            fontSize: 24,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: List.generate(popularcars.length, (index) {
                          PopularCars car = popularcars[index];
                          return Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: CustomOutline(
                              strokeWidth: 2,
                              radius: 20,
                              padding: const EdgeInsets.all(4),
                              width: width * 0.4,
                              height: width * 0.7,
                              gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  Constants.kRedColor.withOpacity(0.01),
                                  Constants.kRedColor.withOpacity(0),
                                  Constants.kBlueColor.withOpacity(0.1),
                                  Constants.kBlueColor
                                ],
                                stops: const [0.2, 0.4, 0.6, 1],
                              ),
                              child: Container(
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    alignment: Alignment.bottomLeft,
                                    image:
                                        AssetImage('assets/img/${car.image}'),
                                  ),
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(20),
                                  ),
                                  gradient: LinearGradient(
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                    colors: [
                                      Constants.kRedColor.withOpacity(0.1),
                                      Constants.kRedColor.withOpacity(0.01),
                                      Constants.kBlueColor.withOpacity(0.1),
                                      Constants.kBlueColor
                                    ],
                                  ),
                                ),
                                child: Stack(
                                  children: [
                                    Positioned(
                                      bottom: 50,
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
                                      bottom: 30,
                                      left: 10,
                                      child: Text(
                                        car.name,
                                        style: const TextStyle(
                                          color: Constants.kWhiteColor,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      bottom: 5,
                                      left: 10,
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
                                      child: Container(
                                        padding: const EdgeInsets.all(8),
                                        decoration: const BoxDecoration(
                                          color: Constants.kRedColor,
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(20),
                                            bottomRight: Radius.circular(20),
                                          ),
                                        ),
                                        child: const Icon(
                                          CupertinoIcons
                                              .arrowshape_turn_up_right_fill,
                                          color: Constants.kWhiteColor,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        }),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: List.generate(
                          carsCategories.length,
                          (index) {
                            CarCategories category = carsCategories[index];
                            return Padding(
                              padding: const EdgeInsets.only(right: 12.0),
                              child: CustomOutline(
                                strokeWidth: 2,
                                radius: 20,
                                padding: const EdgeInsets.all(4),
                                width: width * 0.2,
                                height: width * 0.2,
                                gradient: LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: [
                                    Constants.kRedColor.withOpacity(0.1),
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
                                        Constants.kRedColor,
                                        Constants.kRedColor.withOpacity(0.1),
                                        Constants.kRedColor.withOpacity(0.01),
                                        Constants.kBlueColor.withOpacity(0.01),
                                        Constants.kBlueColor.withOpacity(0.1),
                                        Constants.kBlueColor
                                      ],
                                    ),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Image.asset(
                                      "assets/img/${category.image}",
                                      width: width * 0.15,
                                      height: width * 0.15,
                                      colorBlendMode: BlendMode.overlay,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Container(
                      width: width,
                      height: width * 0.5,
                      decoration: BoxDecoration(
                        image: const DecorationImage(
                          fit: BoxFit.contain,
                          alignment: Alignment.bottomLeft,
                          image: AssetImage('assets/img/car_2.png'),
                        ),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20)),
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Constants.kBlueColor.withOpacity(0.1),
                            Constants.kBlueColor.withOpacity(0.1),
                            Constants.kRedColor.withOpacity(0.1),
                            Constants.kRedColor.withOpacity(0),
                          ],
                        ),
                      ),
                      child: Stack(
                        children: [
                          Positioned(
                            top: height * .01,
                            right: width * 0.05,
                            child: Text(
                              "Electric".toUpperCase(),
                              style: const TextStyle(
                                color: Constants.kGreyColor,
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                          Positioned(
                            top: height * .045,
                            right: width * 0.05,
                            child: Text(
                              "Testla Roadstar".toUpperCase(),
                              style: const TextStyle(
                                color: Constants.kWhiteColor,
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                          Positioned(
                            top: height * .085,
                            right: width * 0.05,
                            child: const Text(
                              "\$130/Day",
                              style: TextStyle(
                                color: Constants.kGreyColor,
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: Container(
                              width: width * 0.35,
                              height: width * 0.15,
                              padding: const EdgeInsets.all(8),
                              decoration: const BoxDecoration(
                                color: Constants.kRedColor,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  bottomRight: Radius.circular(20),
                                ),
                              ),
                              child: const Icon(
                                CupertinoIcons.arrowshape_turn_up_right_fill,
                                color: Constants.kWhiteColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Container(
                      width: width,
                      height: width * 0.5,
                      decoration: BoxDecoration(
                        image: const DecorationImage(
                          fit: BoxFit.contain,
                          alignment: Alignment.bottomLeft,
                          image: AssetImage('assets/img/car_5.png'),
                        ),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20)),
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Constants.kBlueColor.withOpacity(0.1),
                            Constants.kBlueColor.withOpacity(0.1),
                            Constants.kRedColor.withOpacity(0.1),
                            Constants.kRedColor.withOpacity(0),
                          ],
                        ),
                      ),
                      child: Stack(
                        children: [
                          Positioned(
                            top: height * .01,
                            right: width * 0.05,
                            child: Text(
                              "Electric".toUpperCase(),
                              style: const TextStyle(
                                color: Constants.kGreyColor,
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                          Positioned(
                            top: height * .045,
                            right: width * 0.05,
                            child: Text(
                              "Testla Model Y".toUpperCase(),
                              style: const TextStyle(
                                color: Constants.kWhiteColor,
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                          Positioned(
                            top: height * .085,
                            right: width * 0.05,
                            child: const Text(
                              "\$130/Day",
                              style: TextStyle(
                                color: Constants.kGreyColor,
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: Container(
                              width: width * 0.35,
                              height: width * 0.15,
                              padding: const EdgeInsets.all(8),
                              decoration: const BoxDecoration(
                                color: Constants.kRedColor,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  bottomRight: Radius.circular(20),
                                ),
                              ),
                              child: const Icon(
                                CupertinoIcons.arrowshape_turn_up_right_fill,
                                color: Constants.kWhiteColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
