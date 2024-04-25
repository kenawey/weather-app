import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get%20weather%20cubit/get_weather%20_cubit.dart';
import 'package:weather_app/cubits/get%20weather%20cubit/get_weather_states.dart';
import 'package:weather_app/views/home_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      // we use this widget to provide cubit to different places
      create: (BuildContext context) => GetWeatherCubit(),
      child: Builder(
        builder: (context) => BlocBuilder<GetWeatherCubit, WeatherState>(
          builder: (context, state) => MaterialApp(
            theme: ThemeData(
              appBarTheme: AppBarTheme(
                backgroundColor: getMaterialColor(
                    BlocProvider.of<GetWeatherCubit>(context).condition),
              ),
            ),
            debugShowCheckedModeBanner: false,
            home: HomeView(),
          ),
        ),
      ),
    );
  }
}

MaterialColor getMaterialColor(String? condition) {
  if (condition == null) {
    return Colors.blueGrey;
  }
  switch (condition.toLowerCase()) {
    case 'sunny':
      return Colors.yellow;
    case 'partly cloudy':
    case 'cloudy':
    case 'overcast':
      return Colors.grey;
    case 'mist':
    case 'patchy rain possible':
    case 'patchy snow possible':
    case 'patchy sleet possible':
    case 'patchy freezing drizzle possible':
    case 'thundery outbreaks possible':
    case 'fog':
    case 'freezing fog':
    case 'patchy light drizzle':
    case 'light drizzle':
    case 'freezing drizzle':
    case 'heavy freezing drizzle':
    case 'patchy light rain':
    case 'light rain':
    case 'moderate rain at times':
    case 'moderate rain':
    case 'heavy rain at times':
    case 'heavy rain':
    case 'light freezing rain':
    case 'moderate or heavy freezing rain':
    case 'light sleet':
    case 'moderate or heavy sleet':
    case 'patchy light snow':
    case 'light snow':
    case 'patchy moderate snow':
    case 'moderate snow':
    case 'patchy heavy snow':
    case 'heavy snow':
    case 'ice pellets':
    case 'light rain shower':
    case 'moderate or heavy rain shower':
    case 'torrential rain shower':
    case 'light sleet showers':
    case 'moderate or heavy sleet showers':
    case 'light snow showers':
    case 'moderate or heavy snow showers':
    case 'light showers of ice pellets':
    case 'moderate or heavy showers of ice pellets':
      return Colors.amber;
    case 'blowing snow':
    case 'blizzard':
      return Colors.indigo;
    case 'patchy light rain with thunder':
    case 'moderate or heavy rain with thunder':
    case 'patchy light snow with thunder':
    case 'moderate or heavy snow with thunder':
      return Colors.orange;
    default:
      return Colors.blue;
  }
}
