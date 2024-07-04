import 'package:flutter/material.dart';

import 'dart:math';

class ZarolajKockicu extends StatefulWidget {
  const ZarolajKockicu({super.key});

  @override
  State<ZarolajKockicu> createState() => _ZarolajKockicuState();
}

class _ZarolajKockicuState extends State<ZarolajKockicu> {
  var aktivnaSlika = 'assets/images/dice-images/dice-1.png';

  void zarolaj() {
    var broj = Random().nextInt(6) + 1;
    setState(() {
      aktivnaSlika = 'assets/images/dice-images/dice-$broj.png';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          aktivnaSlika,
          width: 200,
          height: 200,
        ),
        const SizedBox(height: 10),
        ElevatedButton(
          onPressed: zarolaj,
          child: const Text('ZAROLAJ KOCKU'),
          style: TextButton.styleFrom(
            textStyle: const TextStyle(fontSize: 20),
            elevation: 20,
          ),
        ),
        ElevatedButton(
            onPressed: () => showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text('Test dialog'),
                      content: Text('Modal'),
                      actions: [TextButton(onPressed: () {}, child: Text('Zatvori'))],
                    );
                  },
                ),
            child: Text(
              'Prikazi modal',
            ))
      ],
    );
  }
}
