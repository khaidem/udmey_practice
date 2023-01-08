import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:practice_app/Weather_APP/constant/constant.dart';
import 'package:practice_app/Weather_APP/logic/weather/weather_cubit.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  late final StreamSubscription weatherSubScription;
  final WeatherCubit weatherCubit;
  ThemeCubit({required this.weatherCubit}) : super(ThemeState.initial()) {
    weatherSubScription =
        weatherCubit.stream.listen((WeatherState weatherState) {
      print('$weatherState');
      if (weatherState.weather.theTemp > KwarmOrNot) {
        emit(state.copyWith(appTheme: AppTheme.light));
      } else {
        emit(state.copyWith(appTheme: AppTheme.dark));
      }
    });
  }
  @override
  Future<void> close() {
    weatherSubScription.cancel();
    return super.close();
  }
}
