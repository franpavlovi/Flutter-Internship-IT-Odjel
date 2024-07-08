import 'package:flutter/material.dart';
import 'package:korisnicitask/custom_widgets/forma.dart';
import 'package:korisnicitask/models/korisnik.dart';

class Dodajkorisnika extends StatefulWidget {
  const Dodajkorisnika({super.key});

  @override
  State<Dodajkorisnika> createState() => _DodajkorisnikaState();
}

class _DodajkorisnikaState extends State<Dodajkorisnika> {
  final _FormKey = GlobalKey<FormState>();

  final TextEditingController _imeController = TextEditingController();
  final TextEditingController _prezimeController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _telefonController = TextEditingController();
  final TextEditingController _lozinkaController = TextEditingController();
  final TextEditingController _potvrdaLozinkeController = TextEditingController();

  @override
  void dispose() {
    _imeController.dispose();
    _prezimeController.dispose();
    _emailController.dispose();
    _telefonController.dispose();
    _lozinkaController.dispose();
    _potvrdaLozinkeController.dispose();
    super.dispose();
  }

  void _validacijaUspjela(BuildContext context, Korisnik korisnik) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("USPJEH"),
            content: Text("Uspjesno ste dodali novog korisnika ${korisnik.ime} ${korisnik.prezime}"),
            actions: [
              ElevatedButton(
                onPressed: () {},
                child: const Text("POGLEDAJ DETALJE"),
              ),
              ElevatedButton(
                child: const Text("OK"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "DODAJ KORISNIKA",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.grey[700],
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _FormKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Molimo vas ispunite traženu formu'),
                Forma(
                  hint: 'Ime',
                  icon: const Icon(Icons.person),
                  controller: _imeController,
                ),
                Forma(
                  hint: 'Prezime',
                  icon: const Icon(Icons.person),
                  controller: _prezimeController,
                ),
                Forma(
                  hint: 'Email',
                  icon: const Icon(Icons.email),
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                ),
                Forma(
                  hint: 'Telefonski broj',
                  icon: const Icon(Icons.phone),
                  controller: _telefonController,
                  keyboardType: TextInputType.number,
                ),
                Forma(
                  hint: 'Lozinka',
                  icon: const Icon(Icons.lock),
                  controller: _lozinkaController,
                  obscure: true,
                ),
                Forma(
                    hint: 'Potvrda lozinke',
                    icon: const Icon(Icons.lock),
                    controller: _potvrdaLozinkeController,
                    obscure: true,
                    additionalValidator: (value) {
                      if (value != _lozinkaController.text) {
                        return 'Lozinke se ne podudaraju';
                      }
                      return null;
                    }),
                ElevatedButton(
                  onPressed: () {
                    if (_FormKey.currentState!.validate()) {
                      Korisnik korisnik = Korisnik(
                        _imeController.text,
                        _prezimeController.text,
                        _emailController.text,
                        _telefonController.text,
                        _lozinkaController.text,
                        _potvrdaLozinkeController.text,
                      );
                      _validacijaUspjela(context, korisnik);
                    }
                  },
                  child: const Text('Potvrdi'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
