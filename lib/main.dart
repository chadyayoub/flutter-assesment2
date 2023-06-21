import 'package:assesment/api/dio_client.dart';
import 'package:assesment/config/app_router.dart';
import 'package:assesment/screens/forecast_screen.dart';
import 'package:assesment/screens/upcoming_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [ChangeNotifierProvider(create: (_) => DioClient())],
        child: MaterialApp(
          title: 'Weather',
          theme: ThemeData().copyWith(primaryColor: Colors.black),
          // onGenerateRoute: AppRouter.onGenerateRoute,
          // initialRoute: RouteNames.forecastScreen),
          home: DefaultTabController(
            length: 2,
            child: Scaffold(
              appBar: AppBar(
                title: Image.network(defaultImage, width: 50, height: 50),
                backgroundColor: Colors.white,
                bottom: TabBar(
                  dividerColor: Colors.black,
                  tabs: [
                    Container(
                      width: 200,
                      decoration: BoxDecoration(
                          border: Border.all(width: 2, color: Colors.black)),
                      child: const Tab(
                        height: 30,
                        child: Text(
                          'Daily',
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                    Container(
                      width: 200,
                      decoration: BoxDecoration(
                          border: Border.all(width: 2, color: Colors.black)),
                      child: const Tab(
                        height: 30,
                        child: Text(
                          'Upcoming 2 weeks',
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              body: TabBarView(
                children: [
                  ForecastScreen(),
                  UpcomingScreen(),
                ],
              ),
            ),
          ),
        ));
  }
}
