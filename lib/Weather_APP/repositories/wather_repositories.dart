// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:practice_app/Weather_APP/Service/weather_api.service.dart';
import 'package:practice_app/Weather_APP/exceptions/weather_exception.dart';
import 'package:practice_app/Weather_APP/model/custom_error.model.dart';
import 'package:practice_app/Weather_APP/model/weather.model.dart';

class WeatherRepository {
  final WeatherApiService weatherRepository;
  WeatherRepository({
    required this.weatherRepository,
  });
  Future<Weather> fetchWeather(String city) async {
    try {
      final int woied = await weatherRepository.getWoied(city);
      print("woied: $woied");
      final Weather weather = await weatherRepository.getWeather(woied);
      print('Weather $weather');
      return weather;
    } on WeatherException catch (e) {
      throw CustomError(errMsg: e.message);
    } catch (e) {
      throw CustomError(errMsg: e.toString());
    }
  }
}
