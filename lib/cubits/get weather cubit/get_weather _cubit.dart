import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get%20weather%20cubit/get_weather_states.dart';

import '../../models/weather_model.dart';
import '../../services/weather_service.dart';

class GetWeatherCubit extends Cubit<WeatherState> {
  // GetWeatherCubit(super.initialState);

  GetWeatherCubit() : super(InitialState());
  String? condition;
  getWeatherInfo({
    required String cityName,
  }) async {
    try {
      WeatherModel? result =
          await WeatherService(Dio()).getCurrentWeather(cityName);
      condition = result.weatherStatus;
      emit(WeatherLoadedState(result)); // we use it to talk with UI
    } on Exception catch (e) {
      // TODO emit failure State
      emit(WeatherFailureState());
    }
  }
}
