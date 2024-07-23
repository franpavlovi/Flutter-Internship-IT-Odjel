import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meals_app/domain/data/dummy_data.dart';
import 'package:meals_app/presentation/widgets/kategorije_item_screen.dart';

class KategorijeScreen extends StatelessWidget {
  const KategorijeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 214, 209, 209),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 214, 209, 209),
        title: Text(
          'ODABERITE KATEGORIJU',
          style: GoogleFonts.roboto(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
        ),
        child: GridView(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, mainAxisSpacing: 25, crossAxisSpacing: 15, childAspectRatio: 0.8),
          children: [
            for (final kategorija in dostupneKategorije) KategorijeItemScreen(kategorija: kategorija),
          ],
        ),
      ),
    );
  }
}
