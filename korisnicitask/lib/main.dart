import 'package:flutter/material.dart';
import 'package:korisnicitask/screens/listakorisnika.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Lista korisnika',
      home: Listakorisnika(),
      onGenerateRoute: (settings) {
        if (settings.name == Listakorisnika.routeName) {
          return MaterialPageRoute(
            builder: (context) => Listakorisnika(),
          );
        }
      },
    );
  }
}
