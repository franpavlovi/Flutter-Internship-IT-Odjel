import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Zadatakwidget extends StatefulWidget {
  const Zadatakwidget({super.key});

  @override
  State<Zadatakwidget> createState() => _ZadatakwidgetState();
}

class _ZadatakwidgetState extends State<Zadatakwidget> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Column(
        children: [
          Text(
            'Ime zadatka',
            style: GoogleFonts.lato(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const Divider(
            thickness: 2,
          ),
          Text(
            'Opis zadatka',
            style: GoogleFonts.lato(fontSize: 15, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(onPressed: () {}, child: const Text('URAĐEN')),
              const SizedBox(
                width: 20,
              ),
              ElevatedButton(onPressed: () {}, child: const Text('IZBRIŠI')),
            ],
          ),
        ],
      ),
    );
  }
}
