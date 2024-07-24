import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Dodajzadatak extends StatefulWidget {
  const Dodajzadatak({super.key});

  @override
  State<Dodajzadatak> createState() => _DodajzadatakState();
}

class _DodajzadatakState extends State<Dodajzadatak> {
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
        child: Column(
          children: [
            TextFormField(
              decoration: const InputDecoration(labelText: 'Unesite naziv zadatka'),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Unesite opis zadatka'),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                child: Text(
                  'DODAJ',
                  style: GoogleFonts.lato(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(153, 4, 194, 115),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
