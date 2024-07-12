import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PocetnaStranica extends StatelessWidget {
  const PocetnaStranica({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 65, 4, 100),
      body: Center(
        child: Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/quiz-logo.png'),
              const SizedBox(
                height: 90,
              ),
              Text(
                'Geography Quiz App',
                style: GoogleFonts.lato(
                  color: Colors.white,
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 100.0),
                child: OutlinedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/kviz');
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
                        Icons.keyboard_double_arrow_right_sharp,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Pokreni kviz',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
