import 'package:flutter/material.dart';
import 'package:quiz_app/pitanja/screens/kviz_screen.dart';
import 'package:quiz_app/pocetna_stranica.dart';

class RezultatiScreen extends StatelessWidget {
  const RezultatiScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(
        255,
        65,
        4,
        100,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Rezultati'),
            const Text('Rezultati'),
            const SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 60, right: 60),
              child: OutlinedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/pocetna');
                },
                style: OutlinedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  side: const BorderSide(width: 3, color: Colors.white),
                ),
                child: const Row(
                  children: [
                    Icon(
                      Icons.restart_alt_sharp,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Pokreni kviz ponovo',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
