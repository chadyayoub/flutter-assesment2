import 'package:assesment/api/dio_client.dart';
import 'package:assesment/config/app_router.dart';
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
          onGenerateRoute: AppRouter.onGenerateRoute,
          initialRoute: RouteNames.forecastScreen),
    );
  }
}
