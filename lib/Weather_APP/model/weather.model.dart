// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:equatable/equatable.dart';

class Weather extends Equatable {
  final String weatherStateName;
  final String weatherStateAbbr;
  final String created;
  final double minTemp;
  final double maxTemp;
  final double theTemp;
  final String title;
  final int woeid;
  final DateTime lastUpdated;
  const Weather({
    required this.weatherStateName,
    required this.weatherStateAbbr,
    required this.created,
    required this.minTemp,
    required this.maxTemp,
    required this.theTemp,
    required this.title,
    required this.woeid,
    required this.lastUpdated,
  });

  factory Weather.formJson(Map<String, dynamic> json) {
    final consolidatedWeather = json['consolidated_weather'][0];
    return Weather(
      weatherStateName: consolidatedWeather['weather_State_Name'],
      weatherStateAbbr: consolidatedWeather['weather_State_Abbr'],
      created: consolidatedWeather[''],
      minTemp: consolidatedWeather['minTemp'],
      maxTemp: consolidatedWeather['max_Temp'],
      theTemp: consolidatedWeather['the_Temp'],
      title: json['title'],
      woeid: json['woeid'],
      lastUpdated: DateTime.now(),
    );
  }
  factory Weather.initial() => Weather(
      created: '',
      lastUpdated: DateTime(1970),
      maxTemp: 100.0,
      minTemp: 100.0,
      theTemp: 100.0,
      title: '',
      weatherStateAbbr: '',
      weatherStateName: '',
      woeid: -1);

  @override
  List<Object> get props {
    return [
      weatherStateName,
      weatherStateAbbr,
      created,
      minTemp,
      maxTemp,
      theTemp,
      title,
      woeid,
      lastUpdated,
    ];
  }

  @override
  bool get stringify => true;
}
