import 'package:flutter/material.dart';
import 'package:quiz_app/pitanja/screens/kviz_screen.dart';
import 'package:quiz_app/pitanja/screens/pitanja_screen.dart';
import 'package:quiz_app/pitanja/screens/rezultati_screen.dart';
import 'package:quiz_app/pocetna_stranica.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Quizz App',
      home: const PocetnaStranica(),
      routes: {'/pocetna': (context) => const PocetnaStranica(), '/kviz': (context) => const KvizScreen(), '/rezultati': (context) => const RezultatiScreen(), 'pitanja': (context) => const PitanjaScreen()},
    );
  }
}
