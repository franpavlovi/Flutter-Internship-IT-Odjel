import 'package:expense_tracker/presentation/screens/bloc/test_bloc.dart';
import 'package:expense_tracker/presentation/screens/glavni_troskovi_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Aplikacija za upravljanje troškovima',
      home: MultiBlocProvider(providers: [
        BlocProvider(
          create: (context) => TestBloc(),
        ),
      ], child: GlavniTroskoviScreen()),
    );
  }
}
