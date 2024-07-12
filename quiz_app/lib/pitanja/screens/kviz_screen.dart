import 'package:flutter/material.dart';

import 'pitanja_screen.dart';

class KvizScreen extends StatefulWidget {
  const KvizScreen({super.key});

  @override
  State<KvizScreen> createState() => _KvizScreenState();
}

class _KvizScreenState extends State<KvizScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: const Color.fromARGB(255, 65, 4, 100),
      body: Column(
        children: [
          Expanded(
            child: PitanjaScreen(),
          ),
        ],
      ),
    );
  }
}
