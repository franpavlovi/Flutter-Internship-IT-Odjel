import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../domain/models/trosak.dart';
import '../widgets/lista_troskova_builder.dart';
import 'dodaj_trosak_modal.dart';

class GlavniTroskoviScreen extends StatefulWidget {
  const GlavniTroskoviScreen({super.key});

  @override
  State<GlavniTroskoviScreen> createState() => _GlavniTroskoviScreenState();
}

class _GlavniTroskoviScreenState extends State<GlavniTroskoviScreen> {
  final List<Trosak> troskovi = [];

  void dodajTrosakUListu(Trosak noviTrosak) {
    setState(() {
      troskovi.add(noviTrosak);
    });
  }

  void izbrisiTrosakIzListe(Trosak trosak) {
    setState(() {
      troskovi.remove(trosak);
    });
  }

  void otvoriDodajTrosakModal() {
    showModalBottomSheet(
      context: context,
      builder: (ctx) {
        return DodajTrosakModal(
          dodajTrosak: dodajTrosakUListu,
        );
      },
      isScrollControlled: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('POPIS TROŠKOVA', style: GoogleFonts.lato(fontWeight: FontWeight.bold)),
        backgroundColor: const Color.fromARGB(255, 36, 33, 33),
        foregroundColor: Colors.white,
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              otvoriDodajTrosakModal();
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
                child: ListaTroskovaBuilder(
              listatroskova: troskovi,
              izbrisi: izbrisiTrosakIzListe,
            )),
          ],
        ),
      ),
    );
  }
}
