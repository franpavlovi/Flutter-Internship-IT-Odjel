import 'dart:io';

import 'package:flutter/material.dart';
import 'package:korisnicitask/_all.dart';
import 'package:korisnicitask/models/korisnik.dart';

class DetaljiKorisnika extends StatefulWidget {
  const DetaljiKorisnika({super.key, required this.korisnik});

  final Korisnik korisnik;

  @override
  State<DetaljiKorisnika> createState() => _DetaljiKorisnikaState();
}

class _DetaljiKorisnikaState extends State<DetaljiKorisnika> {
  Korisnik noviKorisnik = Korisnik(
    UniqueKey().toString(),
    "",
    "",
    "",
    "",
    "",
    "",
    File(''),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "DETALJI KORISNIKA",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.grey[700],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: widget.korisnik.slika != null ? FileImage(widget.korisnik.slika!) : AssetImage('assets/images/no_image.png'),
                    fit: BoxFit.cover,
                  ),
                ),
                height: 100,
                width: 100,
              ),
              const SizedBox(height: 20),
              TextFormField(
                onChanged: (value) {
                  widget.korisnik.ime = value;
                },
              ),
              Forma(
                hint: widget.korisnik.ime,
                icon: const Icon(Icons.person),
                readOnly: true,
              ),
              Forma(
                hint: widget.korisnik.prezime,
                icon: const Icon(Icons.person),
                readOnly: true,
              ),
              Forma(
                hint: widget.korisnik.email,
                icon: const Icon(Icons.email),
                keyboardType: TextInputType.emailAddress,
                readOnly: true,
              ),
              Forma(
                hint: widget.korisnik.telefon,
                icon: const Icon(Icons.phone),
                keyboardType: TextInputType.number,
                readOnly: true,
              ),
              Forma(
                hint: widget.korisnik.lozinka,
                icon: const Icon(Icons.lock),
                obscure: false,
                readOnly: true,
              ),
              Forma(
                hint: widget.korisnik.potvrda,
                icon: const Icon(Icons.lock),
                obscure: false,
                readOnly: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
