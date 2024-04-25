import 'package:weather_app/models/weather_model.dart';

class WeatherLoadedState extends WeatherState {
  final WeatherModel weatherModel;

  WeatherLoadedState(this.weatherModel);
}

class InitialState extends WeatherState {}

class WeatherFailureState extends WeatherState {}

class WeatherState {}
