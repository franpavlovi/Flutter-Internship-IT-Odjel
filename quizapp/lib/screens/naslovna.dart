import 'package:flutter/material.dart';
import 'package:quizapp/screens/kviz.dart';

class Naslovna extends StatelessWidget {
  const Naslovna({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/images/quiz-logo.png'),
          const SizedBox(
            height: 44,
          ),
          OutlinedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const Kviz(),
                ),
              );
            },
            child: const Text(
              'Pokreni kviz',
              style: TextStyle(fontSize: 24),
            ),
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.white,
              side: const BorderSide(
                width: 2.0,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
