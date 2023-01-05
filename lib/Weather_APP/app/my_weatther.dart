import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practice_app/Weather_APP/Service/weather_api.service.dart';
import 'package:practice_app/Weather_APP/logic/weather/weather_cubit.dart';
import 'package:practice_app/Weather_APP/page/weather_home.dart';
import 'package:practice_app/Weather_APP/repositories/wather_repositories.dart';
import 'package:http/http.dart' as http;

class MyWeather extends StatelessWidget {
  const MyWeather({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => WeatherRepository(
          weatherRepository: WeatherApiService(httpClient: http.Client())),
      child: MultiBlocProvider(
        providers: [
          BlocProvider<WeatherCubit>(
              create: (context) => WeatherCubit(
                  weatherRepository: context.read<WeatherRepository>()))
        ],
        child: MaterialApp(
          theme: ThemeData(primarySwatch: Colors.blue),
          home: const WeatherHome(),
        ),
      ),
    );
  }
}
