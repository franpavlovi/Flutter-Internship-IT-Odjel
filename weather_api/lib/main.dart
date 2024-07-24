import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_api/bloc/vrijeme_bloc.dart';
import 'package:weather_api/presentation/screens/weather_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<VrijemeBloc>(create: (context) => VrijemeBloc()),
      ],
      child: const MaterialApp(
        title: 'Weather API',
        home: StartingScreen(),
      ),
    );
  }
}
