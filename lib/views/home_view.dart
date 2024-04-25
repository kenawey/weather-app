import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get%20weather%20cubit/get_weather%20_cubit.dart';
import 'package:weather_app/cubits/get%20weather%20cubit/get_weather_states.dart';
import 'package:weather_app/views/search_view.dart';
import 'package:weather_app/widgets/no_weather_body.dart';
import 'package:weather_app/widgets/weather_info_body.dart';

class HomeView extends StatefulWidget {
  const HomeView({
    super.key,
  });

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  String? color;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const SearchView(),
                ),
              );
            },
          ),
        ],
        // backgroundColor: Colors.blue,
        // foregroundColor: Colors.white,
        title: const Text('Weather App'),
        centerTitle: true,
      ),
      body: BlocBuilder<GetWeatherCubit, WeatherState>(
          // here we say "listen to state of cubit "
          builder: (context, state) {
        if (state is InitialState) {
          return const NoWeatherBody();
        } else if (state is WeatherLoadedState) {
          return WeatherInfoBody(weatherData: state.weatherModel);
        } else {
          return const Center(
            child: Text(
              "Oops there is an arror",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          );
        }
      }),
    );
  }
}
