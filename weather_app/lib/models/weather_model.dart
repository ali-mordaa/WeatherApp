class WeatherModel {
  String cityName;
  DateTime date;
  double temp;
  double minTemp;
  double maxTemp;
  String staet;
  String? image;
  WeatherModel({
    required this.date,
    this.image,
    required this.maxTemp,
    required this.minTemp,
    required this.cityName,
    required this.staet,
    required this.temp,
  });
  factory WeatherModel.fromJeson(jeson) {
    return WeatherModel(
        date: DateTime.parse(jeson["current"]["last_updated"]),
        image: jeson["forecast"]["forecastday"][0]["day"]["condition"]["icon"],
        maxTemp: jeson["forecast"]["forecastday"][0]["day"]["maxtemp_c"],
        minTemp: jeson["forecast"]["forecastday"][0]["day"]["mintemp_c"],
        cityName: jeson["location"]["name"],
        staet: jeson["forecast"]["forecastday"][0]["day"]["condition"]["text"],
        temp: jeson["current"]["temp_c"]);
  }
}
