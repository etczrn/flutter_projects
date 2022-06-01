part of 'weather_bloc.dart';

// In this class, we define different kinds of events by extending the abstract event class.
@immutable
abstract class WeatherEvent {}

class WeatherRequest extends WeatherEvent {
  // Here I've also created a final field called cityName.
  // It's nothing but a string inputted by the user in the search text field.
  // We have to pass it to the event in order to access it in our bloc.
  final String cityName;

  WeatherRequest({required this.cityName});
}
