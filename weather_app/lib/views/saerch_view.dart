import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whether_app/cubits/get_weather_cubits/get_weather_cubit.dart';

import 'package:whether_app/views/home_view.dart';

class SaerchView extends StatelessWidget {
  const SaerchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Saerch"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: TextField(
              onSubmitted: (value) async {
                GetWeatherCubit getWeatherCubit =
                    BlocProvider.of<GetWeatherCubit>(context);
                getWeatherCubit.getWeather(cityName: value);
                Navigator.pop(context, [const HomeView()]);
              },
              decoration: const InputDecoration(
                labelText: "Saerch",
                suffixIcon: Icon(Icons.search),
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 32,
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
