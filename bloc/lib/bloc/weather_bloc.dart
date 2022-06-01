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
  WeatherBloc() : super(WeatherInitial()) {
    on<WeatherEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
