import 'package:flutter/material.dart';

import 'kviz_screen.dart';

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
      body: Column(
        children: const [
          Expanded(
            child: KvizScreen(),
          ),
        ],
      ),
    );
  }
}
