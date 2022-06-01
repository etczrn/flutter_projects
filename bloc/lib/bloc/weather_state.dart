part of 'weather_bloc.dart';

@immutable
abstract class WeatherState {}

// In this class, we define different kinds of states
// (For example, LoadingInProgress state, LoadSuccess state, LoadFailure state).

// For example, your app is fetching user data from an external API.
// Now when the user requests their data,
// initially we passLoadingInProgress which represents that the data is currently loading
// and we can show ProgressIndicator in UI.
// After data is received, we change the state and pass the LoadSuccess state with the requested data.
// And if for some reason, something went wrong or some error occurred
// then we will pass LoadFailure for showing the user that the app has failed to fetch data.

// For initial stage
class WeatherInitial extends WeatherState {}

// For telling the app that weather data is in progress,
class WeatherLoadInprogress extends WeatherState {}

// After weather data has been received
// we change our UI state and show the temperature data of the specified city
class WeatherLoadSuccess extends WeatherState {
  final Weather weather;
  WeatherLoadSuccess({required this.weather});
}

// For Error handling
class WeatherLoadFailure extends WeatherState {
  final String error;
  WeatherLoadFailure({required this.error});
}
