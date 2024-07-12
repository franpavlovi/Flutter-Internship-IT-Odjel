import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RezultatiScreen extends StatelessWidget {
  const RezultatiScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments! as Map<String, List<String>>;

    final tocniOdgovori = args['tocniOdgovori'];
    final netocniOdgovori = args['netocniodgovori'];

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
            Text(
              'REZULTATI:',
              style: GoogleFonts.lato(color: Colors.white, fontSize: 30),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'Imali ste ${tocniOdgovori?.length ?? 0} točna i ${netocniOdgovori?.length ?? 0} netočna pitanja.',
              style: GoogleFonts.lato(color: Colors.white, fontSize: 20),
            ),
            SizedBox(
              height: 10,
            ),
            const SizedBox(
              height: 80,
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
