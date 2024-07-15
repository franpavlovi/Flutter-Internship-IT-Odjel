import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../../domain/models/trosak.dart';

class ListaTroskovaBuilder extends StatelessWidget {
  const ListaTroskovaBuilder({super.key, required this.listatroskova});

  final List<Trosak> listatroskova;

  String formatirajDatum({required DateTime d}) {
    final DateFormat formatter = DateFormat.yMd();
    return formatter.format(d);
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: listatroskova.length,
      itemBuilder: (context, index) {
        return Card(
          color: const Color.fromARGB(255, 36, 33, 33),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      listatroskova[index].naziv,
                      style: GoogleFonts.lato(fontWeight: FontWeight.bold, fontSize: 18.0, color: Colors.white),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text('${listatroskova[index].iznos} €', style: GoogleFonts.lato(fontSize: 13.0, color: Colors.white)),
                    const Spacer(),
                    Text(formatirajDatum(d: listatroskova[index].datum), style: GoogleFonts.lato(fontSize: 13.0, color: Colors.white)),
                    const SizedBox(
                      width: 5,
                    ),
                    Icon(ikoneKategorijaTroska[listatroskova[index].kategorijaTroska], color: Colors.white),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
