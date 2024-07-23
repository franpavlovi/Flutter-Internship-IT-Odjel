import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meals_app/presentation/screens/kategorije_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 214, 209, 209),
      body: Expanded(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 400,
              ),
              Text(
                "DOBRODOŠLI U KUHARICU",
                style: GoogleFonts.roboto(fontSize: 30, color: Colors.black, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                'Recepti za sva vaša omiljena jela na dohvat ruke',
                style: GoogleFonts.lato(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: 17.5,
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 92.0, vertical: 100.0),
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(
                      color: Colors.black,
                      width: 2.8,
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const KategorijeScreen()));
                  },
                  child: Row(
                    children: [
                      const Icon(
                        Icons.double_arrow_rounded,
                        color: Colors.black,
                      ),
                      const Spacer(),
                      Text(
                        'KLIKNI ZA RECEPTE',
                        style: GoogleFonts.roboto(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
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
