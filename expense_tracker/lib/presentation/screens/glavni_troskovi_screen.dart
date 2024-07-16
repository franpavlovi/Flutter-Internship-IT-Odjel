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
  final List<Trosak> troskovi = [
    Trosak(
      naziv: 'Restoran',
      iznos: 50.0,
      datum: DateTime.now(),
      kategorijaTroska: KategorijaTroska.hrana,
    ),
    Trosak(
      naziv: 'Kino',
      iznos: 15.0,
      datum: DateTime.now(),
      kategorijaTroska: KategorijaTroska.zabava,
    ),
    Trosak(
      naziv: 'Račun za struju',
      iznos: 60.0,
      datum: DateTime.now(),
      kategorijaTroska: KategorijaTroska.racuni,
    ),
    Trosak(
      naziv: 'Gorivo',
      iznos: 100.0,
      datum: DateTime.now(),
      kategorijaTroska: KategorijaTroska.transport,
    ),
    Trosak(
      naziv: 'Vikend u hotelu',
      iznos: 300.0,
      datum: DateTime.now(),
      kategorijaTroska: KategorijaTroska.luksuz,
    ),
    Trosak(
      naziv: 'Nepredviđeni trošak',
      iznos: 20.0,
      datum: DateTime.now(),
      kategorijaTroska: KategorijaTroska.ostalo,
    ),
  ];

  void dodajTrosakUListu(Trosak noviTrosak) {
    setState(() {
      troskovi.add(noviTrosak);
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Trošak je dodan'),
      ),
    );
  }

  void izbrisiTrosakIzListe(Trosak trosak) {
    final index = troskovi.indexOf(trosak);

    setState(() {
      troskovi.remove(trosak);
    });

    ScaffoldMessenger.of(context).removeCurrentSnackBar();

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('Trošak je obrisan.'),
        duration: const Duration(seconds: 4),
        action: SnackBarAction(
          label: 'Poništi',
          onPressed: () {
            setState(() {
              troskovi.insert(index, trosak);
            });
          },
        ),
      ),
    );
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
      backgroundColor: const Color.fromARGB(255, 189, 189, 189),
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
