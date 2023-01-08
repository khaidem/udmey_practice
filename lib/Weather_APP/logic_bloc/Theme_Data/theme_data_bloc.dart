import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../constant/constant.dart';
import '../weather/weather_bloc.dart';

part 'theme_data_event.dart';
part 'theme_data_state.dart';

class ThemeDataBloc extends Bloc<ThemeDataEvent, ThemeDataState> {
  late final StreamSubscription weatherSub;
  final WeatherBloc weatherBloc;
  ThemeDataBloc({required this.weatherBloc}) : super(ThemeDataState.initial()) {
    weatherSub = weatherBloc.stream.listen((WeatherState weatherState) {
      if (weatherState.weather.theTemp > KwarmOrNot) {
        add(const ChangeThemeEvent(appTheme: AppThemeData.light));
      } else {
        add(const ChangeThemeEvent(appTheme: AppThemeData.dark));
      }
    });
    on<ChangeThemeEvent>((event, emit) {
      add(ChangeThemeEvent(appTheme: event.appTheme));
    });
  }
  @override
  Future<void> close() {
    weatherSub.cancel();
    return super.close();
  }
}
