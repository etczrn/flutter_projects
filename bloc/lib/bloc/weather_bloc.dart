import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'dart:async';
import 'package:meta/meta.dart';

part 'weather_event.dart';
part 'weather_state.dart';

// The weather_bloc.dart class is a bridge between our UI and the Data class,
// In other words, this class will handle all the Events triggered by the User
// and sends the relevant State back to the UI.
class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final _weatherRepository = WeatherRepository();
  WeatherBloc() : super(WeatherInitial());

  @override
  Stream<WeatherState> mapEventToState(WeatherEvent event) async* {
    // we check for different events and return the relevant states to the UI.
    if (event is WeatherRequest) {
      yield WeatherLoadInprogress();

      try {
        final weatherResponse =
            await _weatherRepository.getWeather(event.cityName);
        yield WeatherLoadSuccess(weather: weatherResponse);
      } catch (e) {
        yield WeatherLoadFailure(error: e.toString());
      }
    }
  }
}
