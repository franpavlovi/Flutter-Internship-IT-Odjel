import 'package:flutter/material.dart';
import 'package:quizapp/naslovna.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
        ),
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.green, Colors.white],
            ),
          ),
          child: const Center(
            child: Naslovna(),
          ),
        ),
      ),
    );
  }
}
