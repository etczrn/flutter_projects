import 'package:global_fitness/data/weather.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HttpHelper {
  // https://api.openweathermap.org/data/2.5/weather?q=London&appid=752b9165bc01d5f6fd4157ab41f7d539
  final String authority = 'api.openweathermap.org';
  final String path = 'data/2.5/weather';
  final String appId = '752b9165bc01d5f6fd4157ab41f7d539';

  Future<Weather> getWeather(String location) async {
    Map<String, dynamic> parameters = {'q': location, 'appid': appId};
    Uri uri = Uri.https(authority, path, parameters);
    http.Response result = await http.get(uri);
    Map<String, dynamic> data = json.decode(result.body);
    Weather weather = Weather.fromJson(data);

    return weather;
  }
}
