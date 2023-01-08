import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practice_app/Weather_APP/Service/weather_api.service.dart';

import 'package:practice_app/Weather_APP/page/setting_page.dart';
import 'package:practice_app/Weather_APP/page/weather_search.dart';
import 'package:practice_app/Weather_APP/repositories/wather_repositories.dart';
import 'package:http/http.dart' as http;

import '../logic_cubit/cubit.dart';

class WeatherHome extends StatefulWidget {
  const WeatherHome({super.key});

  @override
  State<WeatherHome> createState() => _WeatherHomeState();
}

class _WeatherHomeState extends State<WeatherHome> {
  String? _city;
  @override
  void initState() {
    super.initState();
  }

  _fetch() {
    WeatherRepository(
        weatherRepository: WeatherApiService(httpClient: http.Client()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather'),
        actions: [
          IconButton(
            onPressed: () async {
              _city = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const WeatherSearch();
                  },
                ),
              );
              if (_city != null) {
                context.read<WeatherCubit>().fetchWeather(_city!);
              }
            },
            icon: const Icon(Icons.search),
          ),
          IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const SettingPage();
                }));
              },
              icon: const Icon(Icons.settings))
        ],
      ),
      body: _showWeather(),
    );
  }

//We modified temp According to tempUnit
  String showTemperature(double temp) {
    final tempUnit = context.watch<TempSettingsCubit>().state.tempUnit;
    if (tempUnit == TempUnit.fahrenheit) {
      return ((temp * 9 / 5) + 32).toStringAsFixed(2) + 'F';
    }
    return temp.toStringAsFixed(2) + 'C';
  }

  Widget _showWeather() {
    //** if error occur in these show dilog occure otherWise Widget will display*/
    return BlocConsumer<WeatherCubit, WeatherState>(
      listener: (context, state) {
        if (state.status == WeatherStatus.error) {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                content: Text(state.error.toString()),
              );
            },
          );
        }
      },
      builder: (context, state) {
        if (state.status == WeatherStatus.initial) {
          return const Center(
            child: Text('Select a city'),
          );
        }
        if (state.status == WeatherStatus.loading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state.status == WeatherStatus.error && state.weather.title == '') {
          return const Center();
        }
        return Center(
          child: Text(state.weather.title),
        );
      },
    );
  }
}
