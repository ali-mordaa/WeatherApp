import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whether_app/Services/service_weather.dart';
import 'package:whether_app/cubits/get_weather_cubits/get_weather_states.dart';
import 'package:whether_app/models/weather_model.dart';

class GetWeatherCubit extends Cubit<WeatherState> {
  GetWeatherCubit() : super(InitialState());
  WeatherModel? waethermodel;
  getWeather({required String cityName}) async {
    try {
      waethermodel =
          await WeatherService(Dio()).getForecastWaether(cityName: cityName);
      emit(WeatherLoadedState());
    } catch (e) {
      emit(WeatherFailureState());
    }
  }
}
