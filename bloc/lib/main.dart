import 'package:bloc_test/weather_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/weather_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // BlocProvider widget provides a bloc to its children.
    // We have to put it at the place from where all the children can access the bloc.
    // Bloc provides us a MultiBlocProvider widget that takes a List of Bloc and provides it to its children.
    return BlocProvider(
      create: (context) =>
          WeatherBloc()..add(WeatherRequest(cityName: "Ahmedabad")),
      child: MaterialApp(
        home: WeatherApp(),
      ),
    );
  }
}
