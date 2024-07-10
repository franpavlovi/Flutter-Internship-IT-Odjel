import 'dart:io';
import 'package:flutter/material.dart';
import 'package:korisnicitask/custom_widgets/forma.dart';
import 'package:korisnicitask/models/korisnik.dart';
import 'package:korisnicitask/screens/detalji_korisnika.dart';
import 'package:image_picker/image_picker.dart';

class Dodajkorisnika extends StatefulWidget {
  const Dodajkorisnika({super.key});

  @override
  State<Dodajkorisnika> createState() => _DodajkorisnikaState();
}

class _DodajkorisnikaState extends State<Dodajkorisnika> {
  final _FormKey = GlobalKey<FormState>();

  final ImagePicker _picker = ImagePicker();
  File? _image;
  bool _isPickingImage = false;

  Future<void> _pickImage(ImageSource source) async {
    if (_isPickingImage) return; // Ako je već aktivan, ne pokrećemo ga ponovo
    setState(() {
      _isPickingImage = true; // Postavimo da je aktivan
    });

    try {
      final pickedFile = await _picker.pickImage(source: source);

      setState(() {
        if (pickedFile != null) {
          _image = File(pickedFile.path);
        } else {
          print('Nijedna slika nije odabrana.');
        }
      });
    } catch (e) {
      print('Error: $e');
    } finally {
      setState(() {
        _isPickingImage = false; // Vratimo da nije aktivan
      });
    }
  }

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
    ListaKorisnika.dodajKorisnika(korisnik);
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("USPJEH"),
            content: Text("Uspjesno ste dodali novog korisnika ${korisnik.ime} ${korisnik.prezime}"),
            actions: [
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetaljiKorisnika(
                        korisnik: korisnik,
                      ),
                    ),
                  );
                },
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
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[700],
                    shape: BoxShape.circle,
                    image: _image != null
                        ? DecorationImage(
                            image: FileImage(_image!),
                            fit: BoxFit.cover,
                          )
                        : DecorationImage(
                            image: AssetImage('assets/images/no_image.png'),
                          ),
                  ),
                  height: 100,
                  width: 100,
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly, // ili spaceAround za dodatni razmak između
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.grey[700],
                          foregroundColor: Colors.white,
                          shape: StadiumBorder(),
                        ),
                        onPressed: () => _pickImage(ImageSource.gallery),
                        child: const Text('Dodaj iz galerije'),
                      ),
                    ),
                    SizedBox(width: 10), // Dodajte željeni razmak između dugmadi
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.grey[700],
                          foregroundColor: Colors.white,
                          shape: StadiumBorder(),
                        ),
                        onPressed: () async => await _pickImage(ImageSource.camera),
                        child: const Text('Slikaj kamerom'),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
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
                        UniqueKey().toString(),
                        _imeController.text,
                        _prezimeController.text,
                        _emailController.text,
                        _telefonController.text,
                        _lozinkaController.text,
                        _potvrdaLozinkeController.text,
                        _image,
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
