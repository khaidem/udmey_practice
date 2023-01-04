// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:practice_app/Weather_APP/Service/http_error_handler.dart';
import 'package:practice_app/Weather_APP/constant/constant.dart';
import 'package:http/http.dart' as http;
import 'package:practice_app/Weather_APP/exceptions/weather_exception.dart';

class WeatherApiService {
  final http.Client httpClient;
  WeatherApiService({
    required this.httpClient,
  });

  Future<int> getWoied(String city) async {
    final Uri uri = Uri(
      scheme: 'https',
      host: KHost,
      path: '/api/location/search',
      queryParameters: {
        'query': city,
      },
    );

    try {
      final http.Response response = await http.get(uri);
      if (response.statusCode != 200) {
        throw Exception(httpErrorHandler(response));
      }
      final responseBody = json.decode(response.body);
      if (responseBody.isEmpty) {
        throw WeatherException(message: 'Cannot get the woied of $city');
      }
      if (responseBody.length > 1) {
        throw WeatherException(
            message:
                'There are multiple canditate for city\n Please specify furthur!');
      }
      return responseBody[0]['woied'];
    } catch (e) {
      rethrow;
    }
  }
}
