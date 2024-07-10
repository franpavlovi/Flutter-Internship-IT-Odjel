import 'package:flutter/material.dart';
import 'package:quiz_app/pitanja/domain/models/pitanje.dart';
import 'package:quiz_app/pitanja/widgets/odgovor_button.dart';

class PitanjaScreen extends StatefulWidget {
  const PitanjaScreen({super.key});

  @override
  State<PitanjaScreen> createState() => _PitanjaScreenState();
}

class _PitanjaScreenState extends State<PitanjaScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 65, 4, 100),
      ),
      backgroundColor: const Color.fromARGB(255, 65, 4, 100),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 80.0),
        child: Column(
          children: [],
        ),
      ),
    );
  }
}
