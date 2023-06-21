import 'package:assesment/api/dio_client.dart';
import 'package:assesment/widgets/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UpcomingScreen extends StatelessWidget {
  UpcomingScreen({super.key});

  // static Route route() {
  //   return MaterialPageRoute(
  //       builder: (_) => const DetailsScreen(),
  //       settings: const RouteSettings(name: RouteNames.detailsScreen));
  // }

  @override
  Widget build(BuildContext context) {
    var weatherProvider = Provider.of<DioClient>(context);
    if (weatherProvider.forecast.current == null) {
      weatherProvider.getForecast();
    }

    return const Scaffold();
  }
}
