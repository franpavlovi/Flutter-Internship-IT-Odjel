import 'package:flutter/material.dart';
import 'package:quizapp/screens/naslovna.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          shadowColor: Color.fromARGB(193, 3, 3, 3),
          title: const Text(
            'Quizz App',
            style: const TextStyle(
              color: Colors.green,
              fontSize: 40,
              fontWeight: FontWeight.bold,
              fontFamily: 'Helvetica',
            ),
          ),
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
