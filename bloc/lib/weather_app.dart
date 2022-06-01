import 'package:flutter/material.dart';

class WeatherApp extends StatelessWidget {
  const WeatherApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Weather App"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const TextField(
              decoration: InputDecoration(
                hintText: "Enter city name",
                border: OutlineInputBorder(),
              ),
            ),
            Column(
              children: [
                Image.asset(
                  "assets/images/sun.png",
                  height: 200,
                  width: 200,
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "New York",
                  style: Theme.of(context).textTheme.headline3,
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  "38",
                  style: Theme.of(context).textTheme.headline4!.copyWith(
                      fontWeight: FontWeight.bold, color: Colors.black),
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text("Get Weather"),
            )
          ],
        ),
      ),
    );
  }
}
