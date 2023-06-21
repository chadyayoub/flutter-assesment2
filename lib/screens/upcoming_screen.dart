import 'package:assesment/api/dio_client.dart';
import 'package:assesment/screens/forecast_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UpcomingScreen extends StatelessWidget {
  const UpcomingScreen({super.key});

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

    return Scaffold(
      body: weatherProvider.forecast.current == null
          ? const Text('Fetching data...')
          : ListView.builder(
              itemCount: 14,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () => {},
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(5, 15, 25, 5),
                    child: Row(children: [
                      Image.network(
                          'http:${weatherProvider.forecast.forecast?.forecastday?[index].day?.condition?.icon}' ??
                              defaultImage),
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                        children: [
                          Row(children: [
                            Text(weatherProvider.forecast.forecast
                                    ?.forecastday?[index]?.date ??
                                'unkown'),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                                '${weatherProvider.forecast.forecast?.forecastday?[index]?.astro?.isMoonUp == 0 ? 'day' : 'night'}' ??
                                    'day')
                          ]),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                              'Sunrise ${weatherProvider.forecast.forecast?.forecastday?[index]?.astro?.sunrise}' ??
                                  'unkown'),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                              'Sunset ${weatherProvider.forecast.forecast?.forecastday?[index]?.astro?.sunset}' ??
                                  'unkown')
                        ],
                      ),
                      const Spacer(),
                      Text(
                          '${weatherProvider.forecast.forecast?.forecastday?[index]?.day?.avgtempC}C' ??
                              '30C'),
                      const Icon(Icons.keyboard_arrow_right),
                    ]),
                  ),
                );
              },
            ),
    );
  }
}
