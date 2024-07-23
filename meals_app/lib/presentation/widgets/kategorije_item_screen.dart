import 'package:flutter/material.dart';
import 'package:meals_app/domain/models/kategorija.dart';

class KategorijeItemScreen extends StatelessWidget {
  const KategorijeItemScreen({super.key, required this.kategorija, required this.odabirKategorije});

  final Kategorija kategorija;
  final void Function() odabirKategorije;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: odabirKategorije,
      splashColor: Colors.white,
      borderRadius: BorderRadius.circular(10),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          color: kategorija.boja,
          borderRadius: BorderRadius.circular(10),
          gradient: LinearGradient(
            colors: [
              kategorija.boja.withOpacity(0.35),
              kategorija.boja.withOpacity(1.0),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Text(kategorija.naziv),
      ),
    );
  }
}
