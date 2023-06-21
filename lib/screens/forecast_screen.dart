import 'package:assesment/api/dio_client.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

final List<String> selectableItems = <String>['C', 'F'];

const String defaultImage =
    'https://cdn.dribbble.com/users/162970/screenshots/6456084/casual-bounce.gif';

// ignore: must_be_immutable
class ForecastScreen extends StatefulWidget {
  ForecastScreen({super.key});

  String selectedItem = 'C';

  // static Route route() {
  //   return MaterialPageRoute(
  //       builder: (_) => ForecastScreen(),
  //       settings: const RouteSettings(name: RouteNames.forecastScreen));
  // }

  @override
  State<ForecastScreen> createState() => _ForecastScreenState();
}

class _ForecastScreenState extends State<ForecastScreen> {
  var pageIndex = 1;

  @override
  Widget build(BuildContext context) {
    var weatherProvider = Provider.of<DioClient>(context);
    if (weatherProvider.currentWeather.location == null) {
      weatherProvider.getCurrentWeather();
    }

    return Center(
        child: Column(
      children: weatherProvider.currentWeather.current == null
          ? [
              const SizedBox(height: 100),
              const Text('Getting Weather... Please wait'),
            ]
          : [
              Image.network(
                  'http:${weatherProvider.currentWeather.current?.condition?.icon}',
                  width: 150,
                  height: 150),
              const SizedBox(height: 20),
              const Text('Daily'),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                      '${widget.selectedItem == 'C' ? weatherProvider.currentWeather.current?.tempC : weatherProvider.currentWeather.current?.tempF}' ??
                          '10'),
                  const SizedBox(width: 10),
                  DropdownButton<String>(
                    value: widget.selectedItem,
                    icon: const Icon(Icons.arrow_drop_down),
                    elevation: 12,
                    style: const TextStyle(color: Colors.black),
                    underline: Container(
                      height: 1,
                      color: Colors.black,
                    ),
                    onChanged: (String? value) {
                      setState(() {
                        widget.selectedItem = value!;
                      });
                    },
                    items: selectableItems
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                      'Humidity ${weatherProvider.currentWeather.current?.humidity ?? 'unkown'}-%rh'),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                      'Cloud ${weatherProvider.currentWeather.current?.cloud ?? 'unkown'}%'),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                      'Wind ${weatherProvider.currentWeather.current?.windMph ?? 'unkown'}MPH'),
                ],
              ),
              const SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 2)),
                width: 250,
                height: 180,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('location: '),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                    'name: ${weatherProvider.currentWeather.location?.name ?? 'unkown'}'),
                                const SizedBox(height: 5),
                                Text(
                                    'region: ${weatherProvider.currentWeather.location?.region ?? 'unkown'}'),
                                const SizedBox(height: 5),
                                Text(
                                    'Country: ${weatherProvider.currentWeather.location?.country ?? 'unkown'}'),
                                const SizedBox(height: 5),
                                Text(
                                    'Timezone: ${weatherProvider.currentWeather.location?.tzId ?? 'unkown'}'),
                                const SizedBox(height: 5),
                                Text(
                                    'Last update: ${weatherProvider.currentWeather.current?.lastUpdated ?? 'unkown'}'),
                              ]),
                        ),
                      ]),
                ),
              )
            ],
    ));
  }
}
