import 'dart:math';

import 'package:flutter/material.dart';
import 'package:quiz_app/pitanja/domain/models/pitanje.dart';
import 'package:quiz_app/pitanja/widgets/odgovor_button.dart';
import 'package:google_fonts/google_fonts.dart';

class PitanjaScreen extends StatefulWidget {
  const PitanjaScreen({super.key});

  @override
  State<PitanjaScreen> createState() => _PitanjaScreenState();
}

class _PitanjaScreenState extends State<PitanjaScreen> {
  String aktivniScreen = '/pitanja';
  List<String> tocniOdgovori = [];
  List<String> netocniOdgovori = [];

  Random random = Random();

  void odgovorNaPitanje(String odgovor) {
    setState(
      () {
        var trenutnoPitanje = pitanja[pitanjeIndex];

        if (trenutnoPitanje.tocanOdgovor == odgovor) {
          tocniOdgovori.add(trenutnoPitanje.tocanOdgovor);
        } else {
          netocniOdgovori.add(odgovor);
        }

        if (pitanjeIndex < pitanja.length - 1) {
          pitanjeIndex++;
        } else {
          print(tocniOdgovori);
          print(netocniOdgovori);
          aktivniScreen = '/rezultati';
          Navigator.pushNamed(context, '/rezultati', arguments: {'tocniOdgovori': tocniOdgovori, 'netocniodgovori': netocniOdgovori});
        }
      },
    );
  }

  var pitanjeIndex = 0;

  @override
  Widget build(BuildContext context) {
    final trenutnoPitanje = pitanja[pitanjeIndex];

    return Card(
      color: const Color.fromARGB(
        255,
        65,
        4,
        100,
      ),
      elevation: 80,
      margin: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 100,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          20,
        ),
        side: const BorderSide(
          color: Colors.white,
          width: 5,
        ),
      ),
      child: Container(
        margin: const EdgeInsets.all(
          40,
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                trenutnoPitanje.postavljenoPitanje,
                style: GoogleFonts.lato(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 15,
              ),
              ...trenutnoPitanje.randomRaspored().map(
                (odgovor) {
                  return ElevatedButton(
                    onPressed: () => odgovorNaPitanje(odgovor),
                    child: Text(
                      odgovor,
                      style: GoogleFonts.lato(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
