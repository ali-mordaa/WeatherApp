import 'package:dio/dio.dart';
import 'package:whether_app/models/weather_model.dart';

class WeatherService {
  String domainMane = "https://api.weatherapi.com";
  String apiKey = "408cdfb1224f4f19957125413241504";
  final dio;
  WeatherService(this.dio);
  Future<WeatherModel> getForecastWaether({required String cityName}) async {
    try {
      Response response = await dio
          .get('$domainMane/v1/forecast.json?key=$apiKey&q=$cityName&days=1');
      WeatherModel waether = WeatherModel.fromJeson(response.data);
      return waether;
    } on DioException catch (e) {
      String errorMasseg = e.response?.data['error']['message'] ??
          "oops that one error , try later";
      throw Exception(errorMasseg);
    }
  }
}
