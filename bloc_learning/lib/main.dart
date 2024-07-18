import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BLoC Learning',
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'BLoC Learning',
            style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: const Center(
          child: Column(
            children: [
              Text('Hello, World!'),
            ],
          ),
        ),
      ),
    );
  }
}
