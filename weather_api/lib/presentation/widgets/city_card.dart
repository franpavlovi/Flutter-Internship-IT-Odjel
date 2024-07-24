import 'package:flutter/material.dart';
import 'package:weather/weather.dart';

class CityCard extends StatelessWidget {
  const CityCard({super.key, required this.weather});

  final Weather weather;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(weather.temperature.toString()),
          ],
        ),
      ),
    );
  }
}
