import 'dart:convert';

import 'package:assesment/models/current_weather.dart';
import 'package:assesment/models/forecast_lost.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

const apiKey = '0f09e3c63079459dba161741232106';
const longLat = '34.02139053920694,35.647088393446026';
const _baseUrl = 'http://api.weatherapi.com/v1';
const _currentWeatherUrl = '$_baseUrl/current.json';
const _forecastUrl = '$_baseUrl/forecast.json';

class DioClient with ChangeNotifier {
  final Dio _dio = Dio();
  final itemCount = 5;
  CurrentWeather currentWeather = CurrentWeather();
  ForecastList forecast = ForecastList();

  Future<void> getCurrentWeather() async {
    Response response = await _dio.get(_currentWeatherUrl,
        queryParameters: {'key': apiKey, 'q': longLat});
    if (kDebugMode) {
      print('Result Info: $response');
    }
    Map<String, dynamic> map = jsonDecode(response.toString());
    currentWeather = CurrentWeather.fromJson(map);
    notifyListeners();
  }

  Future<void> getForecast() async {
    Response response = await _dio.get(_forecastUrl,
        queryParameters: {'key': apiKey, 'days': 14, 'q': longLat});

    if (kDebugMode) {
      print('List Info: $response');
    }

    Map<String, dynamic> map = jsonDecode(response.toString());
    forecast = ForecastList.fromJson(map);
    notifyListeners();
  }
}
