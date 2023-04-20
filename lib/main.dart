import 'package:carrental/screens/pages/splash.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:carrental/helper/ads_provider.dart';
import 'dart:async';
import 'dart:math';

// import 'package:sensors_plus/sensors_plus.dart';
// import 'package:pedometer/pedometer.dart';

String formatDate(DateTime d) {
  return d.toString().substring(0, 19);
}


final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AdsProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    Provider.of<AdsProvider>(context, listen: false).init(context);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue, useMaterial3: true),
      // home: Pedometerw(),
      home: const SplashScreen(),
    );
  }
}
// class Pedometerw extends StatefulWidget {
//   @override
//   _PedometerwState createState() => _PedometerwState();
// }

// class _PedometerwState extends State<Pedometerw> {
//   late Stream<StepCount> _stepCountStream;
//   late Stream<PedestrianStatus> _pedestrianStatusStream;
//   String _status = '?', _steps = '?';

//   @override
//   void initState() {
//     super.initState();
//     initPlatformState();
//   }

//   void onStepCount(StepCount event) {
//     print(event);
//     setState(() {
//       _steps = event.steps.toString();
//     });
//   }

//   void onPedestrianStatusChanged(PedestrianStatus event) {
//     print(event);
//     setState(() {
//       _status = event.status;
//     });
//   }

//   void onPedestrianStatusError(error) {
//     print('onPedestrianStatusError: $error');
//     setState(() {
//       _status = 'Pedestrian Status not available';
//     });
//     print(_status);
//   }

//   void onStepCountError(error) {
//     print('onStepCountError: $error');
//     setState(() {
//       _steps = 'Step Count not available';
//     });
//   }

//   void initPlatformState() {
//     _pedestrianStatusStream = Pedometer.pedestrianStatusStream;
//     _pedestrianStatusStream
//         .listen(onPedestrianStatusChanged)
//         .onError(onPedestrianStatusError);

//     _stepCountStream = Pedometer.stepCountStream;
//     _stepCountStream.listen(onStepCount).onError(onStepCountError);

//     if (!mounted) return;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text('Pedometer example app'),
//         ),
//         body: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               Text(
//                 'Steps taken:',
//                 style: TextStyle(fontSize: 30),
//               ),
//               Text(
//                 _steps,
//                 style: TextStyle(fontSize: 60),
//               ),
//               Divider(
//                 height: 100,
//                 thickness: 0,
//                 color: Colors.white,
//               ),
//               Text(
//                 'Pedestrian status:',
//                 style: TextStyle(fontSize: 30),
//               ),
//               Icon(
//                 _status == 'walking'
//                     ? Icons.directions_walk
//                     : _status == 'stopped'
//                         ? Icons.accessibility_new
//                         : Icons.error,
//                 size: 100,
//               ),
//               Center(
//                 child: Text(
//                   _status,
//                   style: _status == 'walking' || _status == 'stopped'
//                       ? TextStyle(fontSize: 30)
//                       : TextStyle(fontSize: 20, color: Colors.red),
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
// class MyHomePage extends StatefulWidget {
//   const MyHomePage({Key? key, required this.title}) : super(key: key);

//   final String title;

//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   final List<StreamSubscription<dynamic>> _streamSubscriptions =
//       <StreamSubscription<dynamic>>[];

//   DateTime? startTime;
//   DateTime? endTime;
//   bool isBeingThrown = false;
//   final double GRAVITATIONAL_FORCE = 9.80665;
//   final double DECELERATION_THRESHOLD = 10; // <---- experimental
//   List<double> accelValuesForAnalysis = <double>[];

//   @override
//   void initState() {
//     super.initState();

//     _streamSubscriptions
//         .add(accelerometerEvents.listen((AccelerometerEvent event) {
//       if (isBeingThrown) {
//         double x_total = pow(event.x, 2).toDouble();
//         double y_total = pow(event.y, 2).toDouble();
//         double z_total = pow(event.z, 2).toDouble();

//         double totalXYZAcceleration = sqrt(x_total + y_total + z_total);

//         // only needed because we are not using UserAccelerometerEvent
//         // (because it was acting weird on my test phone Galaxy S5)
//         double accelMinusGravity = totalXYZAcceleration - GRAVITATIONAL_FORCE;

//         accelValuesForAnalysis.add(accelMinusGravity);
//         if (accelMinusGravity > DECELERATION_THRESHOLD) {
//           _throwHasEnded();
//         }
//       }
//     }));
//   }

//   void _throwHasEnded() {
//     isBeingThrown = false;
//     endTime = DateTime.now();
//     Duration totalTime = DateTime.now().difference(startTime!);
//     double totalTimeInSeconds = totalTime.inMilliseconds / 1000;
//     // this is the equation from the wired article
//     double heightInMeters =
//         (GRAVITATIONAL_FORCE * pow(totalTimeInSeconds, 2)) / 8;

//     Widget resetButton = TextButton(
//       child: const Text("LONG PRESS TO RESET"),
//       onPressed: () {},
//       onLongPress: () {
//         startTime = null;
//         endTime = null;
//         print(accelValuesForAnalysis.toString());
//         accelValuesForAnalysis.clear();
//         Navigator.pop(context);
//         setState(() {
//           isBeingThrown = false;
//         });
//       },
//     );

//     AlertDialog alert = AlertDialog(
//       title: const Text("Throw End Detected"),
//       content: Text("total throw time in seconds was: $totalTimeInSeconds\nTotal height was: $heightInMeters meters. \n"),
//       actions: [
//         resetButton,
//       ],
//     );

//     showDialog(
//       barrierDismissible: false,
//       context: context,
//       builder: (BuildContext context) {
//         return alert;
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//       ),
//       body: SizedBox.expand(
//         child: Container(
//           color: Colors.green,
//           //alignment: Alignment.center,
//           child: SizedBox.expand(
//             child: (!isBeingThrown)
//                 ? TextButton(
//                     child: const Text("GO!",
//                         style: TextStyle(
//                             color: Colors.white,
//                             fontWeight: FontWeight.bold,
//                             fontSize: 40)),
//                     onPressed: () {
//                       setState(() {
//                         isBeingThrown = true;
//                         startTime = DateTime.now();
//                       });
//                     },
//                   )
//                 : const Center(
//                     child: Text("weeeeeeeeee!",
//                         style: TextStyle(
//                             color: Colors.white,
//                             fontWeight: FontWeight.bold,
//                             fontSize: 40)),
//                   ),
//           ),
//         ),
//       ),
//     );
//   }

//   @override
//   void dispose() {
//     // cancel the stream from the accelerometer somehow!! ugh!!!
//     for (StreamSubscription<dynamic> subscription in _streamSubscriptions) {
//       subscription.cancel();
//     }
//     super.dispose();
//   }
// }