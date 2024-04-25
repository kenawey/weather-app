import 'dart:developer';

import 'package:dio/dio.dart';

import '../models/weather_model.dart';

class WeatherService {
  final Dio dio;
  final baseUrl = "https://api.weatherapi.com/v1";
  final apiKey = '8d86ab1f2eaa4e6b9bc143910242002';
  WeatherService(this.dio);
  Future<WeatherModel> getCurrentWeather(String cityName) async {
    try {
      Response response = await dio
          .get("$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=1");
      return WeatherModel.fromJson(response.data);
    } on DioException catch (e) {
      String errorMsg = e.response?.data['error']['message'] ??
          'Oops there is an error try later!';
      throw Exception(errorMsg);
    } catch (e) {
      log(e.toString());
      throw Exception('Oops there is an error try later!');
    }
  }
}
