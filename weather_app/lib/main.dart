import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whether_app/cubits/get_weather_cubits/get_weather_cubit.dart';
import 'package:whether_app/cubits/get_weather_cubits/get_weather_states.dart';
import 'package:whether_app/views/home_view.dart';

void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubit(),
      child: BlocBuilder<GetWeatherCubit, WeatherState>(
        builder: (context, state) {
          return MaterialApp(
            theme: ThemeData(
              useMaterial3: false,
              primarySwatch: getThemeColor(
                  BlocProvider.of<GetWeatherCubit>(context)
                      .waethermodel
                      ?.staet),
            ),
            debugShowCheckedModeBanner: false,
            home: const HomeView(),
          );
        },
      ),
    );
  }
}

MaterialColor getThemeColor(String? condition) {
  if (condition == "Sunny") {
    return Colors.orange;
  } else if (condition == "Partly cloudy") {
    return Colors.lightBlue;
  } else if (condition == "Cloudy") {
    return Colors.grey;
  } else if (condition == "Overcast") {
    return Colors.grey;
  } else if (condition == "Mist" ||
      condition == "Fog" ||
      condition == "Freezing fog") {
    return Colors.grey;
  } else if (condition == "Heavy rain at times" ||
      condition == "Heavy rain" ||
      condition == "Patchy freezing rain" ||
      condition == "Light freezing rain" ||
      condition == "Moderate or heavy freezing rain") {
    return Colors.blue;
  } else if (condition == "Patchy snow possible" ||
      condition == "Light snow" ||
      condition == "Patchy light snow" ||
      condition == "Patchy moderate snow" ||
      condition == "Patchy rain possible" ||
      condition == "Light rain" ||
      condition == "Moderate rain at times" ||
      condition == "Moderate rain" ||
      condition == "Patchy light rain" ||
      condition == "Patchy light drizzle") {
    return Colors.lightBlue;
  } else if (condition == "Moderate snow" ||
      condition == "Heavy snow" ||
      condition == "Patchy heavy snow" ||
      condition == "Patchy sleet possible" ||
      condition == "Light sleet" ||
      condition == "Moderate or heavy sleet" ||
      condition == "Light sleet showers" ||
      condition == "Moderate or heavy sleet showers" ||
      condition == "Blowing snow" ||
      condition == "Blizzard" ||
      condition == "Ice pellets" ||
      condition == "Patchy light snow with thunder" ||
      condition == "Moderate or heavy snow with thunder" ||
      condition == "Light snow showers" ||
      condition == "Moderate or heavy snow showers" ||
      condition == "Light showers of ice pellets" ||
      condition == "Moderate or heavy showers of ice pellets") {
    return Colors.blueGrey;
  } else if (condition == "Thundery outbreaks possible" ||
      condition == "Patchy light rain with thunder" ||
      condition == "Moderate or heavy rain with thunder") {
    return Colors.yellow;
  } else if (condition == "Light rain shower" ||
      condition == "Moderate or heavy rain shower" ||
      condition == "Torrential rain shower") {
    return Colors.blue;
  }
  return Colors.green;
}
