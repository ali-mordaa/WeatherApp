import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whether_app/cubits/get_weather_cubits/get_weather_cubit.dart';
import 'package:whether_app/cubits/get_weather_cubits/get_weather_states.dart';
import 'package:whether_app/views/saerch_view.dart';
import 'package:whether_app/widgets/no_weather_body.dart';
// import 'package:whether_app/widgets/no_weather_body.dart';
import 'package:whether_app/widgets/weather_info_body.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // backgroundColor: Colors.blue,
          title: const Text('Weather App'),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const SaerchView();
                  }));
                },
                icon: const Icon(Icons.search))
          ],
        ),
        body: BlocBuilder<GetWeatherCubit, WeatherState>(
          builder: (context, state) {
            if (state is WeatherLoadedState) {
              return WeatherInfoBody();
            } else if (state is WeatherFailureState) {
              return const Center(
                  child: Text(
                "oopse ther is error , tey later",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ));
            } else {
              return const NoWeatherBody();
            }
          },
        ));
  }
}
