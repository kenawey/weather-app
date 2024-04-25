import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get%20weather%20cubit/get_weather%20_cubit.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        // foregroundColor: Colors.white,
        // backgroundColor: Colors.amber,
        title: const Text(
          "Search a City ",
        ),
        centerTitle: true,
      ),
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(
            child: TextField(
              onChanged: (value) {
                // log(value); // to see changed value
              },
              onSubmitted: (cityName) async {
                var of = BlocProvider.of<GetWeatherCubit>(
                    context); // trigger cubit to get info
                of.getWeatherInfo(cityName: cityName);
                Navigator.of(context).pop();
                //log(result.temp);
              },
              decoration: const InputDecoration(
                contentPadding:
                    EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                hintText: "Enter City Name ",
                /* enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.deepOrange)),*/
                suffix: Icon(Icons.search),
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black87),
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                label: Text("Search"),
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
