import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practice_app/Weather_APP/Service/weather_api.service.dart';
import 'package:practice_app/Weather_APP/logic_bloc/Theme_Data/theme_data_bloc.dart';
import 'package:practice_app/Weather_APP/logic_bloc/temp_setting/temp_settings_bloc.dart';
import 'package:practice_app/Weather_APP/logic_bloc/theme/theme_bloc.dart';
import 'package:practice_app/Weather_APP/logic_bloc/weather/weather_bloc.dart';

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
            providers:
                //**For Bloc */
                [
              BlocProvider<WeatherBloc>(
                create: (context) => WeatherBloc(
                  weatherRepository: context.read<WeatherRepository>(),
                ),
              ),
              BlocProvider<TempSettingsBloc>(
                  create: (context) => TempSettingsBloc()),
              BlocProvider<ThemeDataBloc>(
                  create: (context) =>
                      ThemeDataBloc(weatherBloc: context.read<WeatherBloc>())),

              //**For Cubit */
              // BlocProvider<WeatherCubit>(
              //   create: (context) => WeatherCubit(
              //     weatherRepository: context.read<WeatherRepository>(),
              //   ),
              // ),
              // BlocProvider<TempSettingsCubit>(
              //     create: (context) => TempSettingsCubit()),
              // BlocProvider<ThemeCubit>(
              //     create: (context) =>
              //         ThemeCubit(weatherCubit: context.read<WeatherCubit>()))
            ],
            child: BlocBuilder<ThemeDataBloc, ThemeDataState>(
                builder: (context, state) {
              return MaterialApp(
                theme: context.watch<ThemeDataBloc>().state.appThemeData ==
                        AppThemeData.dark
                    ? ThemeData.light()
                    : ThemeData.dark(),
                home: const WeatherHome(),
              );
            })));
  }
}
