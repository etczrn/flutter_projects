import 'package:http/http.dart' as http;

class WeatherDataProvider {
  final String API_KEY = "939acde7425669040c506de296c86ed2";

  Future<http.Response> getRawWeatherData(String city) async {
    http.Response rawWeatherData = await http.get(
      Uri.parse(
          "https://api.openweathermap.org/data/2.5/weather?q=$city&appid=$API_KEY&units=metric"),
    );
    print(rawWeatherData.body);
    return rawWeatherData;
  }
}
