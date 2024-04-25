class WeatherModel {
  final String cityName;
  final String date;
  final String image;
  final String temp;
  final String minmumTemp;
  final String maximumTemp;
  final String weatherStatus;

  WeatherModel(
      {required this.cityName,
      required this.date,
      required this.image,
      required this.temp,
      required this.minmumTemp,
      required this.maximumTemp,
      required this.weatherStatus});

  factory WeatherModel.fromJson(json) {
    return WeatherModel(
      image: json["forecast"]["forecastday"][0]["day"]["condition"]["icon"],
      weatherStatus: json["forecast"]["forecastday"][0]["day"]["condition"]
          ["text"],
      cityName: json["location"]["name"],
      date: json["current"]["last_updated"],
      temp: json["forecast"]["forecastday"][0]["day"]["avgtemp_c"].toString(),
      maximumTemp:
          json["forecast"]["forecastday"][0]["day"]["maxtemp_c"].toString(),
      minmumTemp:
          json["forecast"]["forecastday"][0]["day"]["mintemp_c"].toString(),
    );
  }
}
