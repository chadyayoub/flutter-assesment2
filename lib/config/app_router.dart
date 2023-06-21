// import 'dart:developer';

// import 'package:assesment/screens/details_screen.dart';
// import 'package:assesment/screens/forecast_screen.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';

// class AppRouter {
//   static Route onGenerateRoute(RouteSettings settings) {
//     if (kDebugMode) {
//       log('this is route: ${settings.name}');
//     }
//     switch (settings.name) {
//       case RouteNames.forecastScreen:
//         return ForecastScreen.route();
//       case RouteNames.detailsScreen:
//         return DetailsScreen.route();
//       default:
//         return _errorRoute();
//     }
//   }

//   static Route _errorRoute() {
//     return MaterialPageRoute(
//         settings: const RouteSettings(name: '/error'),
//         builder: (_) => Scaffold(
//               appBar: AppBar(
//                   title: const Text(
//                 "Error",
//                 textAlign: TextAlign.center,
//               )),
//             ));
//   }
// }

// class RouteNames {
//   static const String forecastScreen = '/';
//   static const String detailsScreen = '/details';
// }
