import 'package:flutter/material.dart';

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
            onPressed: () {},
            child: Text('Pokreni kviz'),
          )
        ],
      ),
    );
  }
}
