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
    Trosak(naziv: 'Restoran', iznos: 50, datum: DateTime.now(), kategorijaTroska: KategorijaTroska.hrana),
    Trosak(naziv: 'Maldivi', iznos: 8000, datum: DateTime.now(), kategorijaTroska: KategorijaTroska.luksuz),
    Trosak(naziv: 'Gorivo', iznos: 100, datum: DateTime.now(), kategorijaTroska: KategorijaTroska.transport),
    Trosak(naziv: 'Struja', iznos: 150, datum: DateTime.now(), kategorijaTroska: KategorijaTroska.racuni),
    Trosak(naziv: 'Poklon', iznos: 40, datum: DateTime.now(), kategorijaTroska: KategorijaTroska.ostalo),
  ];

  void dodajTrosak() {
    showModalBottomSheet(
        context: context,
        builder: (ctx) {
          return const DodajTrosakModal();
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('EXPENSE TRACKER', style: GoogleFonts.lato(fontWeight: FontWeight.bold)),
        backgroundColor: const Color.fromARGB(255, 36, 33, 33),
        foregroundColor: Colors.white,
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              dodajTrosak();
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(child: ListaTroskovaBuilder(listatroskova: troskovi)),
          ],
        ),
      ),
    );
  }
}
